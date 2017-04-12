Date: Wed, 12 Apr 2017 01:09:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 Petr Vandrovec <petr@vandrovec.name>, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, osd-dev@open-osd.org,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 ecryptfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, lustre-devel@lists.lustre.org
Subject: Re: [PATCH 04/25] fs: Provide infrastructure for dynamic BDIs in
 filesystems
Message-ID: <20170412080928.GD9830@infradead.org>
References: <20170329105623.18241-1-jack@suse.cz>
 <20170329105623.18241-5-jack@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170329105623.18241-5-jack@suse.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +	if (sb->s_iflags & SB_I_DYNBDI) {
> +		bdi_put(sb->s_bdi);
> +		sb->s_bdi = &noop_backing_dev_info;

At some point I'd really like to get rid of noop_backing_dev_info and
have a NULL here..

Otherwise this looks fine..

Reviewed-by: Christoph Hellwig <hch@lst.de>
