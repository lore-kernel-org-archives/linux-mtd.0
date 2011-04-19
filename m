Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC6mf-0003Qu-9x
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 08:59:46 +0000
Message-ID: <4DAD4EF1.5040305@nokia.com>
Date: Tue, 19 Apr 2011 11:59:29 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Ryan Liu <RyanLiu@BENQ.com>
Subject: Re: Question about nand tests
References: <33579C238B096249ADEFFC942E9C396301BA2C52@guru-msv.BQC.CORP.COM>
In-Reply-To: <33579C238B096249ADEFFC942E9C396301BA2C52@guru-msv.BQC.CORP.COM>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/04/11 11:21, Ryan Liu wrote:
> Hi Adrian,
>
>
> I'm new to linux, and currently study MTD driver. I tried google but not
> find useful information.
>
> I have a Samsung S5PC100(ARM cortex A8) platform board(running Android)
> with 256MiB SLC NAND Flash on it (K9F2G08U0B) and try to run nand test
> on it.
>
> I download nand-tests-f9f10b8.tar.gz from
> http://git.infradead.org/users/ahunter/nand-tests.git first, and modify
> KERNEL_PATH in the Makefile.

Those tests are out of date.  The uptodate tests are in the kernel itself,
in drivers/mtd/tests

Please refer your questions to the mtd mailing list.

>
> Then I compile the project with "make ARCH=arm
> CROSS_COMPILER=/usr/local/arm/4.2.2-eabi/usr/bin/arm-unknown-linux-gnuea
> bi-" successfully.
>
> After compiling, I get some files such as scantest.ko, speedtest.ko
> etc.
>
> After pushing the xxxtest.ko file into the board memory and running
> "chmod 777 xxxtest.ko" file,
> I find error "insmod: can't insert '/storage/mstorage/scantest.ko':
> unknown symbol in module or invalid parameter"
> after running "busybox insmod scantest.ko dev=4", but above the error
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
