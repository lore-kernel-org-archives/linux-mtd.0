Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qKXK-0004E5-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 20:56:18 +0100
Message-ID: <001b01c0c90b$47543ca0$8b96143e@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>, "Nicolas Pitre" <nico@cam.org>,
        "David Woodhouse" <dwmw2@infradead.org>
References: <000801c0c8bb$44e56de0$0a01a8c0@Win1> <3ADF15EF.DBCD9EA@daniel.com>
Subject: Re: JFFS2 as root FS
Date: Thu, 19 Apr 2001 21:59:37 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Wow, that was an impressive analysis!

Regarding my HW, it is a PPC860T and it is running at 50MHz(48 to be exact
since the ext. clock is 8MHz
and the multiplier 6). The bus is supposed to run at the same speed, 48
MHz,(how do I check that?)
The Flash is on a 32 bit bus(4 in x8 mode), erase sector is 256KB.

hmm, mounting my fs should be quicker than 90 seconds.

     Jocke

----- Original Message -----
From: "Vipin Malik" <vipin.malik@daniel.com>
To: <joakim.tjernlund@lumentis.se>
Cc: <mtd@infradead.org>; "Nicolas Pitre" <nico@cam.org>; "David Woodhouse"
<dwmw2@infradead.org>
Sent: den 19 april 2001 18:44
Subject: Re: JFFS2 as root FS


> > Now I am having some other problems :-(
> > First it takes about 1 min 30 sec to mount my root FS. Is that expected?
I
> > was hoping for a much shorter
> > mount time, 10-20 sec
> > The root partition is 15 MB and df reports:
> >
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > /dev/mtdblock1           15104      6580      8524  44% /mnt/mtdblock1
>
> Just for reference, my AMD SC520 -100MHz (a 100MHz 486+) with a 8MB, 57%
full
> JFFS2 f/s takes ~19 seconds to mount.
> The flash is connected on a 32bit bus. Even if it takes 700us (for max
wait
> states on my system) per quad word read (32bits), the entire flash can be
> read in 1.46 seconds.
>
> Even if your flash is connected x8 wide, your flash read times should not
be
> more than 10-12seconds.
>
> Obviously, as my flash read time is only ~2 seconds of my 19s fs mount
time,
> the processor speed plays quite a significant role in the mount process.
>
> To test this theory, I upped the speed to 133MHz and then it took
~15seconds
> to mount.
> The increase in clock speed was 33%, the mount was (19-15)/15 = 26%
faster.
> However, if I remove the "constant" portion of the two mounts- the flash
read
> which is not any faster, then the increase in
> mount speed  = ((19-1.46) - (15-1.46))/ (15 - 1.46) = 29.5% faster, almost
> linear with the increase with clock speed!
> (This also tells me that the code is executing primarily out of cache).
>
> If you say, that your system takes ~90seconds to mount. Let's say that
your
> flash read time is ~10 seconds (for 16MB), then if all else is
> ok, your processor should be ~80/17.5 = 4.5 times slower than mine. This
> assumes equal amount of processing. But your processor is doing about
> (6580/4636 = 140%) more
> processing than mine. Assuming linear overhead, then the new factor is
~57/18
> = 3.1X slower. (your flash usage is 6580 blocks, mine is 4636 blocks).
>
> Now you say that you are using a MPC869T. I did not find a 869T on the
web. I
> presume that you meant 860T. At what MHz?
>
> The 860T is claimed to have a performance of ~66 Dhrystone MIPS at 50MHz.
I
> downloaded Dhrystone 2.1 and that give me 51 mips at 100Mhz (and 67.7at
> 133MHz).
>
> However, my 486 has a 16KB combined cache and a 66MHz SDRAM bus. The FLASH
is
> not cached, so the entire cache can be used for the instruction execution.
> The 860T has only 4KB of instruction cache. Under some circumstances (when
> the code fits in the cache in my processor and not in yours), the SC520
will
> behave like a 100MHz machine while the PPC will be limited to the bus
clock
> speed. What is you bus clock speed (and your core clock speed).
>
> If your BUS clock is ~25-33 MHz, it's not unbelievable that your processor
> runs ~2-3X slower, specially if your processor core is running at <50MHz.
> Also remember that execution from cache is significantly faster than
> execution from EDO DRAM on the bus.
>
> Something to think about. Of course it could be something completely
> different, like a bug in David's code ;)
>
> Vipin
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
