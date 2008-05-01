Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <20080501204820.GA5951@infradead.org>
References: <1209670979.25560.587.camel@pmac.infradead.org>
	<20080501204820.GA5951@infradead.org>
Content-Type: text/plain
Date: Thu, 01 May 2008 23:44:58 +0100
Message-Id: <1209681898.25560.613.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-01 at 16:48 -0400, Christoph Hellwig wrote:
> Yes, and get_fsid would be extremly useful, especially for those
> filesystems that already have an uuid in the superblock
> (*cough*, XFS, *cough*), but it'll need some co-operations with
> nfs-utils on when to use it.

Why do you need to co-operate with userspace? Userspace shouldn't need
to do anything -- we'll just generate a suitable fsid/uuid for
ourselves, unless userspace deliberately overrides it for the export in
question.

> Patch looks good for me except for the few introduced overlong lines.

Bah, don't you start. A less onanistic problem with it is the deadlock
with NFS readdirplus (->readdir->encode_entry->compose_entry_fh->lookup)

I wonder if we should postpone the calls to compose_entry_fh() until
_after_ readdir() has completed. Leave space in the response for the
filehandles, but only walk through it again calling compose_entry_fh()
once we're done in readdir. That would allow us to get rid of the
various icky hacks that file systems have to avoid that deadlock.

-- 
dwmw2
