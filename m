Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wXm7-0000f7-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 22:44:59 +0000
Received: from gateway-490.mvista.com ([63.192.220.206] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wXm3-0000f1-00
	for mtd@infradead.org; Thu, 16 Nov 2000 22:44:56 +0000
Message-ID: <3A14638F.8EBE29DA@mvista.com>
Date: Thu, 16 Nov 2000 14:45:36 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mark.langsdorf@amd.com
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: Big Endian/Little Endian headache in cfi_cmdset_0002.c
References: <0FA1031B65A9D111960900805F9FA8E103B9F1C0@txexmta8.amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

mark.langsdorf@amd.com wrote:

> > In data writes and reads, endianness should not be a concern
> > except for the unaligned bytes which should follow the
> > cfi_cmdset_0001.c code example instead of the assumption of
> > a particular endianness that exists now in cfi_amdext_write_bytes_32.
>
>         I'm not sure what you mean - as far as I can tell,
> cfi_cmdset_0001.c does deal with endianness except in 3
> specific incidences, two of which cfi_cmdset_0002.c doesn't
> use and the third which we don't currently implement (but
> should, and probably could trivially).
>         Is there something else I am missing, or can I take
> all these endian references out of my code with a clear
> conscience?
>
> Mark Langsdorf
> Advanced Micro Devices, Inc             Tel: 512.602.3756
> 5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
> Austin, TX 78741                        mark.langsdorf@amd.com
>

Sorry, I think I confused the issue with my big endian concerns.

The code that you have a problem with in cfi_amdext_write_bytes_32:

                /* if write address is aligned */
                if ((ofs & 0x03) == 0) {
                        tmp = map->read32(map, ofs);
                        tmp = be32_to_cpu(tmp);
                        memcpy((u_char *)&tmp, buf, len);
                        tmp = cpu_to_be32(tmp);
                        size = len;
                }

doesn't look like it should work for either little endian
or big endian - it just slams buf into big endian on a little endian
machine  (my big endian library
has be32_to_cpu as a nop).   This looks like a bug to me or for some
reason the coder wanted
the bytes to land in the flash in big endian order.  But this would only
be for the last bytes so it
doesn't make sense.

As far as the unaligned part of that code:

           else if ((ofs & 0x03) == 3) {
                        tmp = map->read32(map, ofs - 3);
                        tmp = (be32_to_cpu(tmp) & 0xFFFFFF00) | buf[0];
                        tmp = cpu_to_be32(tmp);
                        size = 1;
                }
                else if ((ofs & 0x03) == 2) {
                        tmp = map->read32(map, ofs - 2);
                        tmp = (be32_to_cpu(tmp) & 0xFFFF0000) | buf[1] |
(buf[0] << 8);
                        tmp = cpu_to_be32(tmp);
                        size = 2;
                }
                else if ((ofs & 0x03) == 1) {
                        tmp = map->read32(map, ofs - 1);
                        tmp = (be32_to_cpu(tmp) & 0xFF000000) | buf[2] |
(buf[1] << 8) | buf[0] << 16;
                        tmp = cpu_to_be32(tmp);
                        size = 3;
                }

This look ok except that unaligned data with lengths 1 or 2 would fail.
 Does this part work for you?

The code I was  referring to  in cfi_cmdset_0001.c is  for unaligned
writes in either write buffer or write words:

if (ofs & (CFIDEV_BUSWIDTH-1)) {
                unsigned long bus_ofs = ofs & ~(CFIDEV_BUSWIDTH-1);
                int gap = ofs - bus_ofs;
                int i = 0, n = 0;
                u_char tmp_buf[4];
                __u32 datum;

                while (gap--)
                        tmp_buf[i++] = 0xff;
                while (len && i < CFIDEV_BUSWIDTH)
                        tmp_buf[i++] = buf[n++], len--;
                while (i < CFIDEV_BUSWIDTH)
                        tmp_buf[i++] = 0xff;

                if (cfi_buswidth_is_2()) {
                        datum = *(__u16*)tmp_buf;
                } else if (cfi_buswidth_is_4()) {
                        datum = *(__u32*)tmp_buf;
                } else {
                        return -EINVAL;  /* should never happen, but be
safe */
                }

                ret = do_write_oneword(map, &cfi->chips[chipnum],
                                               bus_ofs, datum);
                if (ret)
                        return ret;

                ofs += n;
                buf += n;
                (*retlen) += n;

                ........

which just kepts the buf in data order (little endian) and also works for
unaligned data of lengths 1 or 2.

I altered it slightly for cfi_cmdset_0002.c  cfi_amdext_write_bytes_32()
because of the eventual check for read value matching write value:

 /* If it's not word-aligned, do the first bytes write */
                        if (ofs & 3) {
                                __u8 tmpbuf[4];
                                int i;
                                unsigned int data;

                                data = map->read32(map, ofs & 0xfffffffc);

                                for (i=0; i< (ofs & 3); i++)
                                        tmpbuf[i] = 0xff;
                                for (; i < min(4, len + (ofs & 3)) ; i++)
                                        tmpbuf[i] = buf[i - (ofs & 3)];
                                for (; i < 4; i++)
                                        tmpbuf[i] = 0xff;
                                data &= *(__u32 *)tmpbuf;
                                ret = do_write_oneword(map, chip, ofs &
0xfffffffc, (__u32 *) &data, 0);
                                if (ret)
                                        return ret;

                                buf += min(4-(ofs & 3), len);
                                ofs += min(4-(ofs & 3), len);
                                len -= min(4-(ofs & 3), len);


As far as my big endian environment,  I need to change the code slightly
in do_write_oneword()
so the data lands in flash in little endian order.  It seems the read
(memcpy_fromio)
is a byte read and therefore expects little endian order  - unless I am
missing something.

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
