Subject: Re: File system testing
From: David Woodhouse <dwmw2@infradead.org>
To: James Graves <jgraves@deltamobile.com>
In-Reply-To: <46829827.20508@deltamobile.com>
References: <46829827.20508@deltamobile.com>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 20:07:22 +0100
Message-Id: <1183057642.1170.197.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-27 at 12:02 -0500, James Graves wrote:
> We've got a script that will write a series of files to the filesystem, 
> and then read them back, checking the contents.
> 
> The script will then unmount the filesystem, and re-mount it. 
> Sometimes, when reading the files again, we'll see a problem.  For 
> instance, seeing nulls (0x00) instead of the expected characters.
> 
> We'll also see at least one message indicating that a node has invalid 
> size (would go over the end of the erase block) and after that some 
> "magic bitmask 0x1985 not found" messages.

Hm. That's very bad. Can you reproduce with CONFIG_JFFS2_FS_DEBUG=1 and
a serial console?

> We then modified the script to sleep after writing each file, that 
> seemed to help, and the test ran longer without seeing a data corruption 
> problem.  Though we did eventually see one after a long time.
> 
> So, questions:
> 
> Is this a good way to test the filesystem in general?

Yes. We have a test in mtd-utils.git which does something very similar.

> Is it possible to push the filesystem too hard, by reading a writing a 
> lot of data all at once?  Will the reads block the writes from being 
> completed?  Or block the erasing dirty eraseblocks?

No, none of that should happen.

-- 
dwmw2
