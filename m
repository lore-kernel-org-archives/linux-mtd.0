Received: from zigzag.lvk.cs.msu.su ([158.250.17.23])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BSfAt-0003WP-AU
	for linux-mtd@lists.infradead.org; Tue, 25 May 2004 12:53:16 -0400
Received: from localhost ([127.0.0.1])
	by zigzag.lvk.cs.msu.su with esmtp (Exim 3.36 #1 (Debian))
	id 1BSf9q-0003Uy-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 May 2004 20:52:06 +0400
From: "Nikita V. Youshchenko" <yoush@cs.msu.su>
To: linux-mtd@lists.infradead.org
Date: Tue, 25 May 2004 20:52:05 +0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_1m3sAgt5/qu0wUv"
Message-Id: <200405252052.05706@zigzag.lvk.cs.msu.su>
Subject: Smartmedia block device code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_1m3sAgt5/qu0wUv
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

AFAIK, linux-mtd still has no read-write SmartMedia driver.

About a year ago I created a driver that implements a read-write block 
device for SmartMedia nandflash, for an embedded device with arm processor 
running Linux 2.2.1 kernel. With this driver, card could be mounted 
read-write, file interchange with USB card readers was possible; also 
there is a number of ioctls() for lowlevel card access, and a user-level 
tool for doing low-level card manipulations.

I'm not interested in this code today (and I don't have hardware). However, 
maybe someone needs it?

It's attached, and also available from 
http://zigzag.lvk.cs.msu.su/~nikita/sm.tar.bz2

It does not use mtd infrastructure (AFAIK there was none in 2.2 kernel), 
and probably needs some obvious fixes to run on any kernel other than was 
used on that device. But is should be more or less trivial to port it to 
recent kernels and MTD infrastructure.

Nikita

P.S.
If you wish to reply, please CC: to yoush@cs.msu.su - I am not on the list.

--Boundary-00=_1m3sAgt5/qu0wUv
Content-Type: application/x-tbz;
  name="sm.tar.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="sm.tar.bz2"

QlpoORdyRThQkAAAAAA=

--Boundary-00=_1m3sAgt5/qu0wUv--
