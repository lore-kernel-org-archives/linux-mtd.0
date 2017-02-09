Date: Thu, 9 Feb 2017 13:12:12 +0100
From: Jan Kara <jack@suse.cz>
To: "Dilger, Andreas" <andreas.dilger@intel.com>
Cc: Jan Kara <jack@suse.cz>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 Christoph Hellwig <hch@infradead.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "osd-dev@open-osd.org" <osd-dev@open-osd.org>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Petr Vandrovec <petr@vandrovec.name>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>
Subject: Re: [lustre-devel] [PATCH 04/24] fs: Provide infrastructure for
 dynamic	BDIs in filesystems
Message-ID: <20170209121212.GD16825@quack2.suse.cz>
References: <20170202173422.3240-1-jack@suse.cz>
 <20170202173422.3240-5-jack@suse.cz>
 <C01BF300-AD67-4A3E-810F-AAB2EEB90B97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C01BF300-AD67-4A3E-810F-AAB2EEB90B97@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > @@ -1249,6 +1254,50 @@ mount_fs(struct file_system_type *type, int flags, const char *name, void *data)
> > }
> > 
> > /*
> > + * Setup private BDI for given superblock. I gets automatically cleaned up
> 
> (typo) s/I/It/
> 
> Looks fine otherwise.

Thanks, fixed.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
