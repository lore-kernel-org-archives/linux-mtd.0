Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEBTd-0001kp-6E
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 19:20:41 +0100
Received: from kiire.colleduc.ee (localhost [127.0.0.1])
	by kiire.colleduc.ee (8.12.10/8.12.10) with ESMTP id i3FIKdhO019295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2004 21:20:39 +0300
Received: from localhost (kalev@localhost)i3FIKd0W019292
	for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2004 21:20:39 +0300
Date: Thu, 15 Apr 2004 21:20:39 +0300 (EEST)
From: Kalev Lember <kalev@colleduc.ee>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0404152104170.18769-100000@kiire.colleduc.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: FAT corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am having trouble with current mtd code and linux 2.6.5 kernel.

I have a 16MB DoC Millennium Plus that has been formatted with dformat 
(dformat -win:c800 -ipl:ipl.rom -s:doc514.exb -bdkf0:clara.rom 
-bdkl0:256K -bdkn0:CLRA -y). It has been running for some time with 2.4.21 
kernel and M-Systems TrueFFS driver. It uses the FAT filesystem.

If I mount it with 2.6.5+mtd it also works flawlessly.

Problems occur if I try to mount it again with 2.4+trueffs, then the 
filesystem is corrupted. Sometimes file listing does not show any of the 
files I have written with 2.6.5+mtd, sometimes I get filesystem panic and 
I would be told that there was a FAT error.

And ideas?

-- 
Best regards,
Kalev
