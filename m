Received: from verifonedns.verifone.com ([192.30.91.34])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b5SO-00038P-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 19:52:44 +0000
Message-ID: <03F65384200AD111936B0060B067AC7B030912AA@HNL-NT-MAIL1.verifone.com>
From: Lance Nakamura <LANCE_N@VERIFONE.COM>
To: gleixner@autronix.de, David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: RE: NAND flash and JFFS(2)
Date: Wed, 13 Feb 2002 10:03:35 -1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

2 things:
1) can the test be set to remove power more frequently,
   as in every minute rather than every hour?  our experience with
   power fail safety is that you have to run at least 100K cycles, =
preferably
   over a number of different units with parts from different =
manufactures,
   in order to have reasonable confidence.  that's probably something =
left
   to product implementors and not the current developers.  however, =
there is
   the order of magnitude rule that says everytime you get an order of =
magnitude
   more experience, you find another layer of problems.  a thousand =
cycles=20
   would be pretty easy to come by on your setup if you can get random =
power
fails
   every minute or so, and that would yield a very high level of =
confidence
   at this stage of development.

2) an important test is to remove power while the file
   system is trying to recover.  in the real world, power failures
   are rarely clean, isolated instances.  you may get multiple failures =
in
   as little as 1 second (failures a few hundred miliseconds apart).


-----Original Message-----
From: Thomas Gleixner [mailto:gleixner@autronix.de]
Sent: Wednesday, February 13, 2002 1:41 AM
To: David Woodhouse
Cc: linux-mtd@lists.infradead.org; jffs-dev@axis.com
Subject: Re: NAND flash and JFFS(2)


On Tuesday, 12. February 2002 18:47, Thomas Gleixner wrote:
>
> Actual state of JFFS2 on NAND
>
> I will run some more tests tonight.
Excellent test result.=20

Test is as follows:

SmartMediaCard: 16MB two partitions a 8MB
1st partition is root
2nd partition is data

data contains 20 files, which are not touched.

3 tasks running in loops

task 1:=20
	copy 40 files from root to data, remove the files on root
	diff against original files on nfs
	copy 40 files from data to root, remove the files on data
	diff against original files on nfs
task 2:
	open file A on data for write every 1 sec.=20
	append 1000 bytes and close the file=20
	loop until filesize is >1MB
	open file B on data for write every 1 sec.=20
	append 1000 bytes and close the file=20
	loop until filesize is >1MB
task3:=09
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
The untouched 20 files on data are diffed against the original files on =
nfs
The 40 files, which are shuffeld between root and data are diffed =
against=20
original files on nfs.
task1 starts
task2 takes the file, which was filled at last and starts
task3 starts

The test ran for 8 hours without any problem.

Thomas=20
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de =A0


To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
the body of a message to majordomo@axis.com
