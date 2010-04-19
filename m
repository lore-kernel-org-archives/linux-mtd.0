Received: from a2s40.a2hosting.com ([74.126.24.200])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O40lr-0007iD-OT
	for linux-mtd@lists.infradead.org; Mon, 19 Apr 2010 23:52:56 +0000
Message-ID: <4BCCECC7.8000006@fosstel.com>
Date: Mon, 19 Apr 2010 19:52:39 -0400
From: "Pedro I. Sanchez" <psanchez@fosstel.com>
MIME-Version: 1.0
To: twebb <taliaferro62@gmail.com>
Subject: Re: UBIFS and MLC NAND Flash
References: <4BA7A183.7040206@fosstel.com>	
	<1270714961.6754.107.camel@localhost>
	<i2odbdb2ea61004191457s58e5b816i1efdf694a1e2a24@mail.gmail.com>
In-Reply-To: <i2odbdb2ea61004191457s58e5b816i1efdf694a1e2a24@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

twebb wrote:
>>> 2. I have several boards with MLC NAND flash running the Linux kernel
>>> 2.6.29 and UBIFS. I am seeing a fairly large rate of file "corruption"
>>> errors, files that all of a sudden become unreadable. Curiously enough,
>>> they have been read-only files in all cases, program executables and
>>> shared libraries.
>> Hmm. Do you do unclean power cuts?
>>
>>> Would upgrading to a more recent kernel, or back porting the latest
>>> UBIFS code, help? Shall I expect better support for MLC NAND flash in
>>> the latest UBIFS code?
>> You did not specify whether you pulled the ubifs-v2.6.29.git tree. If
>> you did this, then your UBI/UBIFS should be the same as in the latest
>> kernels. Please, do this, although this will probably not solve your
>> corruption problems, but you'll have other bug-fixes we have made since
>> 2.6.29 times.
>>
>>
> 
> Pedro,
> I'm seeing very similar issues with MLC+UBIFS, though not only with
> read-only files.  Have you made any progress in your investigation or
> while trying Artem's suggestions?  I'm about to start digging into
> this and would be interested to hear about any issues you may have
> come across.  Do you have any opinion on whether this "corruption" is
> related to the information posted on the linux-mtd site at...
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc ?
> 
> A few notes:
> - I do occasionally have power cuts, but my understanding was that
> UBI/UBIFS was very tolerant of that condition.
> - I use CONFIG_MTD_UBI_WL_THRESHOLD=256
> - I'm using linux-2.6.29
> 
> Thanks,
> twebb

I haven't had the opportunity to use 2.6.29 with the ubifs backport yet. 
However, I run my devices over an extended operational test and couldn't 
reproduce the errors. In this test I avoided any power cuts on purpose 
because I wanted to verify that the boards' software was not at fault 
during normal conditions.

I still see the errors in the deployed boards and these ones are subject 
to random power cuts. After analyzing the logs I conclude that there is 
a strong correlation between the power cuts and the corruption errors. 
The typical scenario is a board running fine for two months without 
interruption, then a power cut, and then upon reboot a myriad of UBIFS 
error messages show up (see sample following my signature)

I'm almost convinced now that power cuts are the culprit. I will be 
conducting test in the next few days to fully verify this. I'll post my 
results.

Thanks,

-- 
Pedro


Mar 16 00:58:22 blazepoint kernel: uncorrectable error : <3>UBI error: 
ubi_io_re
ad: error -74 while reading 2560 bytes from PEB 376:213720, read 2560 bytes
Mar 16 00:58:22 blazepoint kernel: UBIFS error (pid 1507): 
try_read_node: cannot
  read node type 1 from LEB 322:209624, error -74
Mar 16 00:58:22 blazepoint kernel: uncorrectable error : <3>UBI error: 
ubi_io_re
ad: error -74 while reading 2560 bytes from PEB 376:213720, read 2560 bytes
Mar 16 00:58:22 blazepoint kernel: UBIFS error (pid 1507): 
ubifs_check_node: bad
  CRC: calculated 0x5edaa128, read 0xacfe20eb
Mar 16 00:58:22 blazepoint kernel: UBIFS error (pid 1507): 
ubifs_check_node: bad
  node at LEB 322:209624
Mar 16 00:58:22 blazepoint kernel: UBIFS error (pid 1507): 
ubifs_read_node: expe
cted node type 1
Mar 16 00:58:22 blazepoint kernel: UBIFS error (pid 1507): do_readpage: 
cannot r
ead page 261 of inode 3463, error -117
Mar 16 00:58:22 blazepoint kernel: uncorrectable error : <3>UBI error: 
ubi_io_re
ad: error -74 while reading 2560 bytes from PEB 376:213720, read 2560 bytes
