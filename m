Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GQhj-0000rC-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 19:14:39 +0000
Received: from [207.35.116.203] (helo=mail.colubris.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14GQhh-0000r6-00
	for mtd@infradead.org; Wed, 10 Jan 2001 19:14:38 +0000
Received: from colubris.com (ws30-146.colubris.com [192.168.30.146])
	by mail.colubris.com (8.10.2/8.10.2) with ESMTP id f0AJEXV13609
	for <mtd@infradead.org>; Wed, 10 Jan 2001 14:14:33 -0500
Message-ID: <3A5CB4C3.41FC20D1@colubris.com>
Date: Wed, 10 Jan 2001 14:15:16 -0500
From: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: CFI problems with 32bit bus and 4 devices
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I've just updated to the latest CVS and my CFI AMD chips are not
accessible anymore.

I lokked briefly into it and saw that the cfi->interleave and
cfi->device_type were removed from offset calculations when accessing
the devices.

So, for my setup, which has 4 x16 devices on a 32 bit bus (AMDs),  the
CFI query structure is located at offsets 0x80, 0x88, 0x90, etc.

cfi_read_query()  uses only the buswidth to calculate the offset, which
is not general enough (it used to be like that before I played with the
code a bit last summer).  It's obviously wrong in my case ( 0x10 << 2 !=
0x80 ).

Rewriting cfi_read_query like this made the CFI query structure
readable:

static inline __u8 cfi_read_query(struct map_info *map, __u32 base,
__u32 addr)
{
    struct cfi_private *cfi = map->fldrv_priv;
    addr *= cfi->interleave * cfi->device_type;  /* instead of addr <<
(buswidth / 2) */
    if (cfi_buswidth_is_1()) {
        return map->read8(map, base + addr);
    } else if (cfi_buswidth_is_2()) {
        return cfi16_to_cpu(map->read16(map, base + addr));
    } else if (cfi_buswidth_is_4()) {
        return cfi32_to_cpu(map->read32(map, base + addr));
    } else {
        return 0;
    }
}

With this change, the chips are now properly recognized.  But I can't
still not use them (reads are wrong), so I think I have to look at
cfi_cmdset_002.c to bring back the use of cfi->interleave in some
calculations...

Any comments?  Is it possible that I'm the only one using that kind of
geometry?

-Stephane



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
