Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L5bTv-0005k6-33
	for linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 07:40:11 +0000
Message-ID: <492E50F0.502@nokia.com>
Date: Thu, 27 Nov 2008 09:49:04 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: UBIFS performance
References: <B76220C07A204128A4B86AE742992E46@sisodomain.com>
	<492D37D7.3010908@nokia.com>
	<656B846D04624422AF2BDEFB95C1466D@sisodomain.com>
In-Reply-To: <656B846D04624422AF2BDEFB95C1466D@sisodomain.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brijesh Singh <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amit Kumar Sharma wrote:
> Really good information for us, In my understanding random 
> read/write performance can not be greater then sequential , 
> Am I right because I have seen in LFS on SSD  sequential and 
> random performance are same , Please correct me if I am 
> missing any scenario.we will measure performance using perf.

Without knowing the internals of the SSD, it is impossible to
predict anything about sequential vs random performance.  It
depends entirely on the design of the SSD.

However, excluding the effect of hardware, file systems are
likely to give better performance for sequential I/O than
random I/O.

> ----- Original Message ----- 
> From: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
> To: "Brijesh Singh" <brij.singh@samsung.com>
> Cc: <linux-mtd@lists.infradead.org>
> Sent: Wednesday, November 26, 2008 5:19 PM
> Subject: Re: UBIFS performance
> 
> 
>> Brijesh Singh wrote:
>>>   I am testing UBIFS and JFFS2 performance on OneNand 
>>> with iozone utility.
>>> Interestingly, random read / write performance are 
>>> slightly better than
>>> sequential read / write.
>>> These results are consistent across multiple versions. 
>>> And consistent with
>>> all different record length sizes.
>>>
>>> Correct me if I am wrong, but shouldn't sequential 
>>> read/write fair better
>>> than random read/write? Is this expected behavior? If 
>>> yes,why?
>> For log-structured file systems on flash memory, there 
>> should be little
>> difference between sequential and random access.
>>
>> That is true for UBIFS, although sequential might be 
>> slightly faster,
>> because it is slightly more likely to find index nodes 
>> already cached.
>>
>> We recently introduced a facility called bulk-read that 
>> offers improved
>> sequential read speed.  It has lower overhead and benefits 
>> from OneNAND's
>> read-while-load operation.
>>
>> We are thinking about something for writing in bigger 
>> chunks that would
>> benefit from OneNAND's write-while-program operation, but 
>> that will be good
>> for either random or sequential writes.
>>
>> With regard to iozone, you need to be aware that it hides 
>> one of JFFS2's
>> weaknesses which is how long it takes to open a file. 
>> Unlike UBIFS and
>> other file systems which just read the inode, JFFS2 has to 
>> do lots of work
>> putting all the file fragments together.  The bigger the 
>> file, the longer
>> it takes to open.  If you compare how long it takes to 
>> open a file and
>> read it, our experience is that UBIFS is faster than 
>> JFFS2.  Whereas
>> if you ignore the open time, JFFS2 is faster that UBIFS.
>>
>> In mtd-utils there is a simple performance test program 
>> called perf
>> which includes the open time in calculations.  It is in 
>> the
>> tests/fs-tests/simple directory.
>>
>> Also, if you want to exclude the effects of caching you 
>> may want to use
>> the -e and -U options for iozone.
