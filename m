Received: from pd9e41948.dip.t-dialin.net ([217.228.25.72] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16axZH-0002aw-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 11:27:19 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND flash and JFFS(2)
Date: Wed, 13 Feb 2002 12:40:52 +0100
References: <Pine.LNX.4.44.0202112137580.1558-100000@lapdancer.baythorne.internal> <0202121847440K.00764@thomas>
In-Reply-To: <0202121847440K.00764@thomas>
MIME-Version: 1.0
Message-Id: <0202131200230Q.00764@thomas>
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, <jffs-dev@axis.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tuesday, 12. February 2002 18:47, Thomas Gleixner wrote:
>
> Actual state of JFFS2 on NAND
>
> I will run some more tests tonight.
Excellent test result. 

Test is as follows:

SmartMediaCard: 16MB two partitions a 8MB
1st partition is root
2nd partition is data

data contains 20 files, which are not touched.

3 tasks running in loops

task 1: 
	copy 40 files from root to data, remove the files on root
	diff against original files on nfs
	copy 40 files from data to root, remove the files on data
	diff against original files on nfs
task 2:
	open file A on data for write every 1 sec. 
	append 1000 bytes and close the file 
	loop until filesize is >1MB
	open file B on data for write every 1 sec. 
	append 1000 bytes and close the file 
	loop until filesize is >1MB
task3:	
	wait until A is >1MB
	copy file A to nfs
	check file integrity of A
	remove file A on data
	wait until B is >1MB
	copy file B to nfs
	check file integrity of B
	remove file B on data

A independent control removes power after ~ 1-2 hours without warning.
After reboot:
The untouched 20 files on data are diffed against the original files on nfs
The 40 files, which are shuffeld between root and data are diffed against 
original files on nfs.
task1 starts
task2 takes the file, which was filled at last and starts
task3 starts

The test ran for 8 hours without any problem.

Thomas 
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
