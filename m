Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pXlv-00027m-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 16:52:07 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <kd@flaga.is>, <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Tue, 17 Apr 2001 17:51:32 +0200
Message-ID: <000601c0c756$47018250$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <31299.987521006@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi again

I can place them at any physical(almost) address since they are connected to
the
cpu's Chip Select logic. I figure I will place them somewhere high starting
at 0xf8000000.
I can also make the address space linear(no holes between the banks).

Now, can I just define WINDOW_ADDR 0xf8000000 and WINDOW_SIZE 0x8000000 and
specifiy my partitions without worrying about flash bank boundries? (In my
dreams or ...)

    Jocke
PS.
    I meant 4 flash banks below. Each bank is 32 MB

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, April 17, 2001 17:23
To: joakim.tjernlund@lumentis.se
Cc: kd@flaga.is; mtd@infradead.org
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus



joakim.tjernlund@lumentis.se said:
>  We are doing our own custom board(PPC860) with 3 "banks" of Intel
> Flashes. Each bank consists of 2 flashes in 16 bit mode, 2-chip
> interleave, 32-bit data bus. Now I want to make a partition that spans
> more than one flash bank(or at least crosses a bank boundary). Is that
> possible? Any special tricks or just do an add_mtd_partition() call?

Special tricks, if they're really in separate banks and you can't just use
a single mapping driver which will detect all the flash in one go. The code
can deal with aliases appearing between devices, but can't deal with empty
space between them - although you could play tricks in the mapping driver
to make that disappear.

What physical addresses are the flash chips mapped to?

If they have to be in separate mappings, you'll need to write wrapper
functions similar to the ones in mtdpart.c, which munge the offset and pass
through to the function in the appropriate MTD device.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
