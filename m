Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pWxt-0001Rg-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 16:00:25 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <kd@flaga.is>, <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Tue, 17 Apr 2001 16:59:54 +0200
Message-ID: <000301c0c74f$10768340$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

yeah, shame on emacs! :-)

It's working much better now. I have managed to create a JFFS2 FS on one
partition and copied
a few files to it. No problems so far. Now I trying to make that partition
my root FS, have not gotten
very far yet, but I will :-)

I still working my way through MTD and I have still much to learn ...
Hope you have the time to answer a question or two ...

We are doing our own custom board(PPC860) with 3 "banks" of Intel Flashes.
Each bank consists of 2 flashes in 16 bit mode, 2-chip interleave, 32-bit
data bus.
Now I want to make a partition that spans more than one flash bank(or at
least crosses
a bank boundary). Is that possible? Any special tricks or just do an
add_mtd_partition() call?

  Jocke

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, April 17, 2001 15:58
To: joakim.tjernlund@lumentis.se
Cc: 'Kari Davmpsson'; mtd@infradead.org
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus



joakim.tjernlund@lumentis.se said:
>  I been all the time wrong! I just discovered that hexl-mode i emacs
> is broken! Emacs in hexl-mode displays 81ff81ff81ff ... and od -x says
> fffffff ...

Heh. Naughty emacs. Is everything working now?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
