From: David Woodhouse <dwmw2@infradead.org>
To: jmrobert5@mchsi.com
In-Reply-To: <041420041712.17158.34@mchsi.com>
References: <041420041712.17158.34@mchsi.com>
Content-Type: text/plain
Message-Id: <1081965021.6169.19.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Wed, 14 Apr 2004 13:50:22 -0400
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Losing inodes in DOC2000 w/ext2 fs?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-04-14 at 17:12 +0000, jmrobert5@mchsi.com wrote:
> I have been having an issue with a ext2 fs on a DOC2000.  If I overwrite a file
> being marked as used by a process (such as a lib), the file is cached and then
> later flushed at a reboot.  But then there are many unused inodes hanging
> around.  The result is my flash upgrades leave many inodes marked as being used,
> using more space.

This is a symptom of improper shutdowns with a non-journalling file
system. The space taken by these inodes should be reclaimed when you
fsck, surely?

> Is this another effect that is talked about in the FAQ?  Or the real question,
> is this a file system issue, or an MTD doc driver issue?  The FAQ leads me to
> believe its a ext2 issue.

Using ext3 would solve it, at a high cost. Because ext3 does journalling
at the block device layer, it means all metadata changes are written
_twice_ to the flash.

> Will using JFFS2 solve this problem?

Yes. We need to update the new DiskOnChip driver to handle bad blocks
(and preferably hardware ECC) first, but I've had this working.

-- 
dwmw2
