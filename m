Received: from mail3.deltamobile.com ([66.92.131.124])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3aub-0000R7-Fq
	for linux-mtd@lists.infradead.org; Wed, 27 Jun 2007 13:02:39 -0400
Message-ID: <46829827.20508@deltamobile.com>
Date: Wed, 27 Jun 2007 12:02:31 -0500
From: James Graves <jgraves@deltamobile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: File system testing
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello all,

We're running into some possible data corruption issues with some log 
files stored on a JFFS2 partition.

Our current configuration is admittedly a bit unusual.  We've got a 
2.6.11 kernel on a PowerPC processor.  However, we ported the JFFS2 and 
MTD code from a 2.6.21 kernel.  As you might guess, there were some 
other issues that prevented us from just moving to a recent kernel, 
though we're still considering that.

To start with, however, I've got some general questions on testing the 
system.

We've got a script that will write a series of files to the filesystem, 
and then read them back, checking the contents.

The script will then unmount the filesystem, and re-mount it. 
Sometimes, when reading the files again, we'll see a problem.  For 
instance, seeing nulls (0x00) instead of the expected characters.

We'll also see at least one message indicating that a node has invalid 
size (would go over the end of the erase block) and after that some 
"magic bitmask 0x1985 not found" messages.

We then modified the script to sleep after writing each file, that 
seemed to help, and the test ran longer without seeing a data corruption 
problem.  Though we did eventually see one after a long time.

So, questions:

Is this a good way to test the filesystem in general?

Is it possible to push the filesystem too hard, by reading a writing a 
lot of data all at once?  Will the reads block the writes from being 
completed?  Or block the erasing dirty eraseblocks?

Thanks,

James Graves
