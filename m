Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GUiK-0002Uu-00
	for mtd-list@infradead.org; Wed, 10 Jan 2001 23:31:32 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14GUiJ-0002Uo-00
	for mtd@infradead.org; Wed, 10 Jan 2001 23:31:31 +0000
Message-ID: <3A5CF18A.3DEAE71E@mvista.com>
Date: Wed, 10 Jan 2001 15:34:34 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?St=E9phane?= Laroche <stephane.laroche@colubris.com>
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: CFI problems with 32bit bus and 4 devices
References: <3A5CB4C3.41FC20D1@colubris.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Stéphane Laroche wrote:

> Hi,
>
> I've just updated to the latest CVS and my CFI AMD chips are not
> accessible anymore.
>
> I lokked briefly into it and saw that the cfi->interleave and
> cfi->device_type were removed from offset calculations when accessing
> the devices.
>
> So, for my setup, which has 4 x16 devices on a 32 bit bus (AMDs),  the
> CFI query structure is located at offsets 0x80, 0x88, 0x90, etc.
>
> cfi_read_query()  uses only the buswidth to calculate the offset, which
> is not general enough (it used to be like that before I played with the
> code a bit last summer).  It's obviously wrong in my case ( 0x10 << 2 !=
> 0x80 ).
>
> Rewriting cfi_read_query like this made the CFI query structure
> readable:
>
> static inline __u8 cfi_read_query(struct map_info *map, __u32 base,
> __u32 addr)
> {
>     struct cfi_private *cfi = map->fldrv_priv;
>     addr *= cfi->interleave * cfi->device_type;  /* instead of addr <<
> (buswidth / 2) */
>     if (cfi_buswidth_is_1()) {
>         return map->read8(map, base + addr);
>     } else if (cfi_buswidth_is_2()) {
>         return cfi16_to_cpu(map->read16(map, base + addr));
>     } else if (cfi_buswidth_is_4()) {
>         return cfi32_to_cpu(map->read32(map, base + addr));
>     } else {
>         return 0;
>     }
> }
>
> With this change, the chips are now properly recognized.  But I can't
> still not use them (reads are wrong), so I think I have to look at
> cfi_cmdset_002.c to bring back the use of cfi->interleave in some
> calculations...
>
> Any comments?  Is it possible that I'm the only one using that kind of
> geometry?
>
> -Stephane
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I just ran into the same problem with my one 8x16 intel chip which is set
up in 8 bit mode.

I think the fix should be:

static inline __u8 cfi_read_query(struct map_info *map, __u32 base, __u32
query_addr, int int
erleave, int type)
{
        __u32 addr = base + cfi_build_query_addr(query_addr, interleave,
type);

        if (cfi_buswidth_is_1()) {
                return map->read8(map, addr);
        } else if (cfi_buswidth_is_2()) {
                return cfi16_to_cpu(map->read16(map, addr));
        } else if (cfi_buswidth_is_4()) {
                return cfi32_to_cpu(map->read32(map, addr));
        } else {
                return 0;
        }
}

with cfi_build_query_addr () the same as cfi_build_cmd_addr():

static inline __u32 cfi_build_query_addr(__u32 cmd_ofs, int interleave, int
type)
{
        return (cmd_ofs * type) * interleave;
}

So that the address of the query is adjusted for the 8 bit selection of an
8x16 chip.
I think the correct address is taken from the combo of interleave and type
( which is correctly set up to be
CFI_DEVICETYPE_X16  for this configuration).


I think we need to pass in the interleave and type because the
map->fldrv_priv
isn't set up before the first query call.

Alice







To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
