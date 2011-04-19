Received: from [218.104.47.52] (helo=bqc-fe01.BQC.CORP.COM)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QC75Z-0003fi-7S
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 09:19:18 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Question about nand tests
Date: Tue, 19 Apr 2011 17:06:47 +0800
Message-ID: <33579C238B096249ADEFFC942E9C396301BA2C56@guru-msv.BQC.CORP.COM>
In-Reply-To: <4DAD4EF1.5040305@nokia.com>
References: <33579C238B096249ADEFFC942E9C396301BA2C52@guru-msv.BQC.CORP.COM>
	<4DAD4EF1.5040305@nokia.com>
From: "Ryan Liu" <RyanLiu@BENQ.com>
To: "Adrian Hunter" <adrian.hunter@nokia.com>
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


thanks=20

-----Original Message-----
From: Adrian Hunter [mailto:adrian.hunter@nokia.com]=20
Sent: Tuesday, April 19, 2011 4:59 PM
To: Ryan Liu
Cc: linux-mtd Mailing List
Subject: Re: Question about nand tests

On 19/04/11 11:21, Ryan Liu wrote:
> Hi Adrian,
>
>
> I'm new to linux, and currently study MTD driver. I tried google but=20
> not find useful information.
>
> I have a Samsung S5PC100(ARM cortex A8) platform board(running=20
> Android) with 256MiB SLC NAND Flash on it (K9F2G08U0B) and try to run=20
> nand test on it.
>
> I download nand-tests-f9f10b8.tar.gz from=20
> http://git.infradead.org/users/ahunter/nand-tests.git first, and=20
> modify KERNEL_PATH in the Makefile.

Those tests are out of date.  The uptodate tests are in the kernel
itself, in drivers/mtd/tests

Please refer your questions to the mtd mailing list.

>
> Then I compile the project with "make ARCH=3Darm=20
> =
CROSS_COMPILER=3D/usr/local/arm/4.2.2-eabi/usr/bin/arm-unknown-linux-gnu
> ea
> bi-" successfully.
>
> After compiling, I get some files such as scantest.ko, speedtest.ko=20
> etc.
>
> After pushing the xxxtest.ko file into the board memory and running=20
> "chmod 777 xxxtest.ko" file, I find error "insmod: can't insert=20
> '/storage/mstorage/scantest.ko':
> unknown symbol in module or invalid parameter"
> after running "busybox insmod scantest.ko dev=3D4", but above the =
error=20
> there is no inofrmation like "ext3: Unknown symbol warn_on_slowpath".
>
> Is there anything I missed or doing something wrong?
>
> Thanks in advance.
>
>
> Regards,
> Ryan
>
