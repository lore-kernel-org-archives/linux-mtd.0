Received: from smtp2.sssup.it ([193.205.80.100] helo=smpt.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JOzUJ-00048P-FM
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 18:04:18 +0000
Message-ID: <47B1DF8C.4090500@gandalf.sssup.it>
Date: Tue, 12 Feb 2008 19:03:56 +0100
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: DMcLeod <dmcleod@bittware.com>
Subject: Re: First access to mounted jffs2 partition is slow
References: <47B1840D.1010702@carallon.com> <47B1D5A7.4000509@bittware.com>
In-Reply-To: <47B1D5A7.4000509@bittware.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Will Wagner <will_wagner@carallon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> Will Wagner wrote:
>   
>> Hello,
>>
>> I have an ARM11 system with a JFFS2 partition in NAND flash. It works 
>> but the first time it is accessed after mounting it can be very slow.
>>
>> These are the steps I am performing:
>>
>> # flash_eraseall /dev/mtd4
>> Erasing 128 Kibyte @ 5fe0000 -- 99 % complete.
>> # time mount /dev/mtdblock4 /flash -t jffs2
>> real    0m 1.25s
>> user    0m 0.01s
>> sys     0m 0.13s
>> # time ls flash		- with an empty filsystem, this takes no time
>> real    0m 0.00s
>> user    0m 0.01s
>> sys     0m 0.00s
>> # cp /sdcard/bigfile flash/	- bigfile is ~8MB
>> # umount /flash
>> # time mount /dev/mtdblock4 /flash -t jffs2
>> real    0m 2.63s
>> user    0m 0.01s
>> sys     0m 0.50s
>> # time ls flash		- first time we do this it takes a long time
>> bigfile
>> real    0m 11.79s
>> user    0m 0.00s
>> sys     0m 0.18s
>> # time ls flash		- subsequent reads are fast
>> bigfile
>> real    0m 0.00s
>> user    0m 0.01s
>> sys     0m 0.00s
>>
>>     
I think that is a problem of jffs2 and I think that is related to the 
time spent during the fstat64 system but
I'm not sure. I have little experince with jffs2.

Regards Michael
