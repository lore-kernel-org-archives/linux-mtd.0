From: Russ.Dill@asu.edu (Russ Dill)
Date: 24 Mar 2003 15:17:31 -0700
Subject: not enough blocks for JFFS?
In-Reply-To: <3E7E6DE5.5000003@interepoch.com.tw>
References: <3E7E6DE5.5000003@interepoch.com.tw>
Message-ID: <1048483100.3593.3.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-03-23 at 19:31, Tim Wu wrote:
> Hi! Everybody:
> 
> The system I'm working on use a 4MB NOR flash.
> The block size of the 4MB flash is 64KB.
> It also has eight smaller(8KB) blocks at bottom.
> Since, on this system, I don't have much data to write(less than 10KB),
> a CRAMFS(readonly)+JFFS(writable) combination should be pretty good for me.
> 
> Here comes the problem.  The bootloader has occupied the first three 8KB 
> blocks.  I have only five 8K blocks available for JFFS.  It always fails 
> when I overwrite an existed file on the JFFS partition.

Just make a quick user space implementation. Create a header struct
including revision, header crc, data crc, magic, and length. Write these
onto a block until its full, then erase a second block, write to that
block till thats full, then back to the first, etc... When you look for
data, you:

	a) find the first magic number
	b) check the header crc, if it doesn't match, go to a
	c) check the data crc, if it matches, record this revision as 
		the most recent revision (if it is)
	d) jump forward size + header size bytes
