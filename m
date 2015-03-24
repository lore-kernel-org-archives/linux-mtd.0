Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaIis-0003Y5-35
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2015 06:53:58 +0000
Date: Tue, 24 Mar 2015 07:53:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Subject: Re: [PATCH 11/12] fs: don't reassign dirty inodes to
 default_backing_dev_info
Message-ID: <20150324065325.GC3159@lst.de>
References: <1421228561-16857-1-git-send-email-hch@lst.de>
 <1421228561-16857-12-git-send-email-hch@lst.de>
 <CAMM=eLe6Tt+g7dLcnn5a1fQboDknkasazsMiOFBziWPZemnYtg@mail.gmail.com>
 <20150323224012.GA29505@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150323224012.GA29505@redhat.com>
Cc: Jens Axboe <axboe@fb.com>, linux-nfs@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, device-mapper development <dm-devel@redhat.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, ceph-devel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 23, 2015 at 06:40:13PM -0400, Mike Snitzer wrote:
> FYI, here is the DM fix I've staged for 4.0-rc6.  I'll continue testing
> the various DM targets before requesting Linus to pull.

Yeah, from looking at the bugzilla it seemed like dm was releasing the
dev_t before the queue has been freed.

I don't know this code to well, so this isn't a full review, but it looks like
the right fix to me.
