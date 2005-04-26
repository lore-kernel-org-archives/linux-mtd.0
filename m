Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQYsC-0006NR-BX
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2005 18:49:45 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: eddie@embeddedx86.com, linux-mtd@lists.infradead.org
Date: Wed, 27 Apr 2005 10:43:10 +1200
References: <32985.192.168.0.136.1114547639.squirrel@oz.embeddedx86.com>
In-Reply-To: <32985.192.168.0.136.1114547639.squirrel@oz.embeddedx86.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050426224942.92AA3160C8@desire.actrix.co.nz>
Cc: 
Subject: Re: Bad Blocks...
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 27 April 2005 08:33, Eddie Dawydiuk wrote:
> Hello Yaffers,
>
> After running some stress tests on a 128MB NAND Flash I have found some
> strange behavior while using the Yaffs filesystem... The stress test
> creates a ring-buffer of 5 directories, each directory contains 10,000
> files with a size of 1248 bytes (Please find the source code attached).
> When running this application on a 32MB NAND Flash I am able to fill the
> disk and then delete the files as expected... Although when running the
> test on a 128MB NAND Flash(with the same kernel) I find that after
> creating slightly over 35,000 files I am unable to write any more files to
> disk(my board hangs). After rebooting the board, when I attempt to delete
> the files only some of the files are deleted successfully(on the first
> attempt). After attempting several more times I am able to delete all of
> the files but I find that I have hundreds of bad blocks(there are no error
> messages when I attempt to delete a file and it is unsucessfully deleted).
> I have provided the output of /proc/yaffs below(after running the stress
> test multiple times) and am using a 2.4.26 kernel... I have read the other
> posts refering to bad block management
> (http://www.aleph1.co.uk/pipermail/yaffs/2005q1/000955.html) and have
> ensured the fixes suggested have been made. If anyone has any suggestions
> I would appreciate them...


Hi Eddie

I have not tried making 35000 files on a Linux box myself, but all of this 
should work fine.

The core problem, it seems to me, is the excessive number of bad blocks being 
generated. nRetiredBlocks of 2397 shows that over a quarter of your blocks 
have been marked bad in just one run.  Anything over 1-2% in a product 
lifetime is unlhealthy.

Sever block failures will cause flow-on failures like garbage collection 
problems etc.

Block failures are generally a result of ecc errors. I see you're using NAND 
ecc, so make sure that is doing the right thing.

I suggest adding some of the low level tracing (eg. YAFFS_TRACE_BAD_BLOCKS) 
and maybe turn on more mtd tracing. Feel free to add your own too :-)

-- Charles
