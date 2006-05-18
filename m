Received: from s15154467.rootmaster.info ([82.165.32.28]
	helo=s15111287.lios-tech.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgfVn-0002oY-64
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 06:13:50 -0400
Received: from srv-lios2.koeln.nktcables.com (unknown [127.0.0.1])
	by s15111287.lios-tech.com (Postfix) with ESMTP id 9F76C174D
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 May 2006 09:46:13 +0000 (UTC)
Received: from [172.16.21.44] (pc023044.koeln.nktcables.com [172.16.21.44])
	by srv-lios2.koeln.nktcables.com (Postfix) with ESMTP id 6F844805B
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 May 2006 11:46:13 +0200 (CEST)
Message-ID: <446C4265.8090108@lios-tech.com>
Date: Thu, 18 May 2006 11:46:13 +0200
From: =?UTF-8?B?QWxicmVjaHQgRHJlw58=?= <albrecht.dress@lios-tech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: [OT?] File system recommendation for SD cards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sorry if this is an ot question - I could not find an answer for this
question on the web.  Hope the question is not /too/ dumb, though...

I plan to use an SD card in an embedded system (arm9/Linux 2.6 based).
The SD card shall buffer measurement data files which are created about
every minute and are each ~20 kByte large.  On a regular basis, a remote
machine will load the files from the embedded system which in turn
unlinks them, thus creating a big "ring buffer".

After reading a Sandisk whitepaper about wear levelling [1] I thought
about using a standard vfat file system on it (mainly to have the
ability to remove the sd card and to read it on a Winbloze pc).
However, I read a report that using a sync vfat fs could lead to fast
corruption of the SD card [2].

Questions:
Would using JFFS2 on the SD card improve the lifetime of the device?
Does anyone have experiences about the achievable lifetime in my
scenario, for both vfat or jffs2?
How would I practically set up a jffs2 fs on the sd card?

Thanks in advance for any input,
Albrecht


[1]
http://www.sandisk.com/Assets/File/OEM/WhitePapersAndBrochures/RS-MMC/WPa=
perWearLevelv1.0.pdf
[2] http://www.ussg.iu.edu/hypermail/linux/kernel/0506.0/0058.html

--=20
LIOS Technology GmbH
Dr. Albrecht Dre=C3=9F
Project Engineering / Software Design
Schanzenstrasse 6 - 20
D-51063 K=C3=B6ln
Germany

Phone +49 221 676 2742
Fax   +49 221 676 2069
