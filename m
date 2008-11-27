Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L5XXu-0001j1-Ax
	for linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 03:28:03 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KAZ0010G2YGBC@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 12:27:52 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KAZ001S22YCB9@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 12:27:49 +0900 (KST)
Date: Thu, 27 Nov 2008 09:01:21 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: UBIFS performance
To: Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Brijesh Singh <brij.singh@samsung.com>
Message-id: <656B846D04624422AF2BDEFB95C1466D@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <B76220C07A204128A4B86AE742992E46@sisodomain.com>
	<492D37D7.3010908@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian

Really good information for us, In my understanding random 
read/write performance can not be greater then sequential , 
Am I right because I have seen in LFS on SSD  sequential and 
random performance are same , Please correct me if I am 
missing any scenario.we will measure performance using perf.

Thanks
Amit

----- Original Message ----- 
From: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
To: "Brijesh Singh" <brij.singh@samsung.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Wednesday, November 26, 2008 5:19 PM
Subject: Re: UBIFS performance


> Brijesh Singh wrote:
>>   I am testing UBIFS and JFFS2 performance on OneNand 
>> with iozone utility.
>> Interestingly, random read / write performance are 
>> slightly better than
>> sequential read / write.
>> These results are consistent across multiple versions. 
>> And consistent with
>> all different record length sizes.
>>
>> Correct me if I am wrong, but shouldn't sequential 
>> read/write fair better
>> than random read/write? Is this expected behavior? If 
>> yes,why?
>
> For log-structured file systems on flash memory, there 
> should be little
> difference between sequential and random access.
>
> That is true for UBIFS, although sequential might be 
> slightly faster,
> because it is slightly more likely to find index nodes 
> already cached.
>
> We recently introduced a facility called bulk-read that 
> offers improved
> sequential read speed.  It has lower overhead and benefits 
> from OneNAND's
> read-while-load operation.
>
> We are thinking about something for writing in bigger 
> chunks that would
> benefit from OneNAND's write-while-program operation, but 
> that will be good
> for either random or sequential writes.
>
> With regard to iozone, you need to be aware that it hides 
> one of JFFS2's
> weaknesses which is how long it takes to open a file. 
> Unlike UBIFS and
> other file systems which just read the inode, JFFS2 has to 
> do lots of work
> putting all the file fragments together.  The bigger the 
> file, the longer
> it takes to open.  If you compare how long it takes to 
> open a file and
> read it, our experience is that UBIFS is faster than 
> JFFS2.  Whereas
> if you ignore the open time, JFFS2 is faster that UBIFS.
>
> In mtd-utils there is a simple performance test program 
> called perf
> which includes the open time in calculations.  It is in 
> the
> tests/fs-tests/simple directory.
>
> Also, if you want to exclude the effects of caching you 
> may want to use
> the -e and -U options for iozone.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
