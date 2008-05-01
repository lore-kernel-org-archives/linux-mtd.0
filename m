Date: Thu, 1 May 2008 16:48:20 -0400
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
Message-ID: <20080501204820.GA5951@infradead.org>
References: <1209670979.25560.587.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1209670979.25560.587.camel@pmac.infradead.org>
Cc: linux-fsdevel@vger.kernel.org, hch@infradead.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 01, 2008 at 08:42:59PM +0100, David Woodhouse wrote:
> On top of commit 27c72b040c0be8f3704ed0b6b84c12cbba24a7e8 (in the
> mtd-2.6 tree if Linus hasn't pulled it yet), this provides
> export_operations for JFFS2. 
> 
> It doesn't yet solve the readdirplus deadlock described in
> http://lists.infradead.org/pipermail/linux-mtd/2007-March/017663.html 
> 
> You also still need to set fsid manually when exporting it -- I'm
> thinking of adding a 'get_fsid' to the export_operations to allow the
> filesystem to provide its own...

Yes, and get_fsid would be extremly useful, especially for those
filesystems that already have an uuid in the superblock
(*cough*, XFS, *cough*), but it'll need some co-operations with
nfs-utils on when to use it.

Patch looks good for me except for the few introduced overlong lines.
