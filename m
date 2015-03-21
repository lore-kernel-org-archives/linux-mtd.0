Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZL44-0007o1-EE
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2015 15:11:53 +0000
Received: by iedm5 with SMTP id m5so9144314ied.3
 for <linux-mtd@lists.infradead.org>; Sat, 21 Mar 2015 08:11:29 -0700 (PDT)
MIME-Version: 1.0
Sender: snitzer@gmail.com
In-Reply-To: <1421228561-16857-12-git-send-email-hch@lst.de>
References: <1421228561-16857-1-git-send-email-hch@lst.de>
 <1421228561-16857-12-git-send-email-hch@lst.de>
From: Mike Snitzer <snitzer@redhat.com>
Date: Sat, 21 Mar 2015 11:11:09 -0400
Message-ID: <CAMM=eLe6Tt+g7dLcnn5a1fQboDknkasazsMiOFBziWPZemnYtg@mail.gmail.com>
Subject: Re: [PATCH 11/12] fs: don't reassign dirty inodes to
 default_backing_dev_info
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Cc: David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, Jens Axboe <axboe@fb.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 device-mapper development <dm-devel@redhat.com>, linux-mtd@lists.infradead.org,
 Tejun Heo <tj@kernel.org>, ceph-devel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 4:42 AM, Christoph Hellwig <hch@lst.de> wrote:
> If we have dirty inodes we need to call the filesystem for it, even if the
> device has been removed and the filesystem will error out early.  The
> current code does that by reassining all dirty inodes to the default
> backing_dev_info when a bdi is unlinked, but that's pretty pointless given
> that the bdi must always outlive the super block.
>
> Instead of stopping writeback at unregister time and moving inodes to the
> default bdi just keep the current bdi alive until it is destroyed.  The
> containing objects of the bdi ensure this doesn't happen until all
> writeback has finished by erroring out.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Tejun Heo <tj@kernel.org>
> ---
>  mm/backing-dev.c | 91 +++++++++++++++-----------------------------------------
>  1 file changed, 24 insertions(+), 67 deletions(-)

Hey Christoph,

Just a heads up: your commit c4db59d31e39ea067c32163ac961e9c80198fd37
is suspected as the first bad commit in a bisect performed to track
down the cause of DM crashes reported in this BZ:
https://bugzilla.redhat.com/show_bug.cgi?id=1202449

I've yet to look closely at _why_ this commit but figured I'd share
since this appears to be a 4.0-rcX regression.

Mike
