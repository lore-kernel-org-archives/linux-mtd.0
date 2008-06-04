Received: from rv-out-0708.google.com ([209.85.198.244])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3kGp-0003fE-HC
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 04:06:44 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2296059rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Jun 2008 21:06:41 -0700 (PDT)
Message-ID: <5ed5c4730806032106r77a912f4jbf72f06c59e3f72f@mail.gmail.com>
Date: Wed, 4 Jun 2008 13:06:41 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
In-Reply-To: <1212387034.31023.166.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
	<1212148942.31023.135.camel@sauron>
	<1212149102.31023.138.camel@sauron>
	<5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
	<1212155390.31023.140.camel@sauron>
	<5ed5c4730805300808v79f7fd7dpe3550cd8fc1b0db5@mail.gmail.com>
	<1212387034.31023.166.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> ok. here is my simple test.
>>
>> 1. make a random dumped file in sdram area.
>> # cd /dev/shm/tmp
>> # dd if=/dev/urandom of=test.out bs=1M count=10
>> because ubifs uses compressor, I made a random data file for test.
>>
>> 2. make another shell script.
>> # cat test_write.sh
>> #!/bin/sh
>> /bin/cp /dev/shm/tmp/test.out /nand_partition
>> /bin/sync
>
> In my previous mail, I described why the load will jump up when you do
> like this, please refer to that mail again.
>
> I suggest you to mount the file-system with '-o sync' option and measure
> load average.
>


Hi, I tested again with '-o sync'. :-)

UBIFS LZO (mounted with '-o sync,noatime' option)
16.93sec 590KB/s
load avg : 0.00 -> 0.36

UBIFS No Compressor (mounted with '-o sync,noatime' option)
13.38sec 747KB/s
load avg : 0.00 -> 0.29

YAFFS2 (mounted with '-o sync,noatime' option)
12.25sec 816KB/s
load avg : 0.00 -> 0.15

regards,
KeunO Park.
