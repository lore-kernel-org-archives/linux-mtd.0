Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9i7z-00059L-RI
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 06:16:25 -0500
Message-ID: <42317DD7.3090205@yandex.ru>
Date: Fri, 11 Mar 2005 14:15:35 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Konstantin Kletschke <lists@ku-gbr.de>
References: <20050311104457.GB11203@synertronixx3>
In-Reply-To: <20050311104457.GB11203@synertronixx3>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
 > The "Name CRC failed on node at ..." is away. I populated the root-fs
Good.

 > root-fs. No problems. But mounting takes ages :)
How much time does "ages" mean ?
Do you stand that it was faster before?
How large is your flash?
Do you have directories with huge files number in it (say, ~ 10000)?

 > Whats next? :D
Profiling might help.
Try to put fewver files to your flash and test how quck is it mounted.

P.S. :

 > I erased /dev/mtdblock3 with bootloader and
If you erase your flash with flash_eraseall -j it might work a bit faster.

Q: What's -j ?
A: This means that flash_eraseall ought to write special node called 
cleanmarker at the beginning of each block.

Q: Why is this better then to erase using my bootloader?
A: your bootloader probably doesn't write cleanmarkers.

Q: What happens if there are no cleanmarkers?
A: Nothing critical. JFFS2 will just re-erase such blocks and put 
cleanmarkers itself. This is just time wasting.

Q: Why does JFFS2 re-erase blocks which have no cleanmarkers but contain 
all FF (i.e., are erased)?
A: Because it was observed that if the power loss occurs when block is 
almost completely erased, there might be "unstable" bits in it. I.e., 
they are read sometimes as "1" and sometimes as "0" (This effect is 
described in David Woodhouse's page). Cleanmarker does guarantee that 
the block was successfully erased. All FFs don't.

Q: Does this affect mount time?
A: It might, but I guess not very much. The difference is that if there 
is clean marker at the beginning of the block, JFFS2 quickly detects 
that it is free. Otherwise, JFFS2 scans it trying to find some data, 
thus, wasting time.

P.P.S:
JFFS2 has problems with mount time but it should be noticable when you 
work with relatively large partitions, which isn't very typical for NOR.

If you are sure that the problem is not your slow flash driver, you 
might try Ferenc's "summary" patch.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
