Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ar9v-0002I1-GT
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 13:58:03 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE500EL1QO98A@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 30 Apr 2003 14:57:45 +0200 (MEST)
Date: Wed, 30 Apr 2003 15:57:04 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <Law11-F625OmHBewRNS00016c03@hotmail.com>
To: J B <mad_flasher@hotmail.com>, linux-mtd@lists.infradead.org
Message-id: <200304301557.04691.tglx@linutronix.de>
MIME-version: 1.0
References: <Law11-F625OmHBewRNS00016c03@hotmail.com>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Subject: Re: moving MTD partitions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 April 2003 13:29, J B wrote:
> "The basic question is if it is feasible to resize (smaller or larger) a
> jffs2 filesystem / mtd block device over flash and maintain the existing
> contents. Copying the contents out and then back again is not an option
> (not enough space)."

First answer is no.
On second thought could be a possibility to do so. 

Assuming following situation:
block = eraseblock
part1:		100 blocks, none free
part2:		100 blocks, 20 blocks free

1. Force garbage collection in part2 (needs hacking jffs2) to free the blocks 
really
2. Write a block mover, which moves all used blocks of part2 to the end of 
part2
3. Erase the 20 blocks at the beginning of part2
4. rmmod mapping driver
5. change partition size of part1 (now 120 blocks) and part2 (now 80 blocks) 
in mapping driver (or give it to the mapping driver by module params)
6. reload mapping driver
7. remount filesystems

I don't know, what's that good for, but that's the only way to do it without 
data loss.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
