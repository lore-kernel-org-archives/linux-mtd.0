Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cmyys-0003LV-8y
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 13:37:03 -0500
Message-ID: <41DED6C5.3080502@imc-berlin.de>
Date: Fri, 07 Jan 2005 19:36:53 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2: mount time, SUMMARY and gc.c ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I am using linux-2.6.10 with recent MTD CVS and the SUMMARY patch on an embedded 
ARM9 system (150MHz core, 48MHz SDRAM) with 8MB NOR flash as root fs.

The SUMMARY patch actually reduced the mount time - the time between

  NET: Registered protocol family 1
  NET: Registered protocol family 17

and

  VFS: Mounted root (jffs2 filesystem).
  Freeing init memory: 72K

- from 6 to less then 1 second (710ms)! :-)

But then before

  init started:  BusyBox v1.00 (2005.01.04-08:42+0000) multi-call binary

appears still "nothing" happens for around 8 seconds.

I noticed that "jffs2_gcd_mtd0" is heavily running after boot consuming much time.

gc.c:jffs2_garbage_collect_pass() gets called very often - 596 times!

Why is that garbage collection running everytime I boot my target!?!?
Is there anything I can do about it?

Thanks a million!

-- 
Steven Scholz
