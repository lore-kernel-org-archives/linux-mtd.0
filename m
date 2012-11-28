Received: from server157.star-server.info ([195.78.76.157])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TddX0-0001QE-5Z
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2012 09:02:11 +0000
Received: from [192.168.1.11] (563B90B0.catv.pool.telekom.hu [86.59.144.176])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by server157.star-server.info (Postfix) with ESMTP id A3CCA15E5BCE
 for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2012 10:02:03 +0100 (CET)
Message-ID: <50B5D30B.9070609@infracont.hu>
Date: Wed, 28 Nov 2012 10:02:03 +0100
From: =?ISO-8859-2?Q?Tak=E1cs_=C1ron?= <takacs.aron@infracont.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Bad sectors
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Reply-To: takacs.aron@infracont.hu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have the following problem: I am using a PXA27x based module with two 
16bit flash chips (Intel P33) parallel on it. We have been using these 
modules without any problems with linux-2.6 kernels and jffs2 filesystem 
on top of mtdblock.
Recently I moved to the 3.6-rc4 kernel. Since then the following error 
happened to two different modules: they were working for a while (some 
days, week), and then suddenly some blocks of the flash became 
uneraseable. I get a lot of such error messages while trying to dd the 
jffs2 image to /dev/mtdblockX:

[  478.796166] Buffer I/O error on device mtdblock2, logical block 2085
[  478.802472] lost page write due to I/O error on mtdblock2
[  479.068366] mtdblock: erase of region [0x300000, 0x40000] on 
"Filesystem" failed
[  479.075760] end_request: I/O error, dev mtdblock2, sector 16688

I have tried to erase the block with openocd, u-boot and WinCE too, but 
all of them failed.

The error occurred after a few writes to the flash (far less than 100k), 
so I don't think it was a wearing issue.

Is it theoretically possible the damage sectors by any software error 
(bad kernel config)? Or do I have to think of hardware defects (maybe ESD)?

Thank you very much for your help! It is very important to me to exclude 
software problems.

Best regards:

Áron
