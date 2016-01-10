Received: from sabe.cs.wisc.edu ([128.105.6.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aI47c-0004fE-Me
 for linux-mtd@lists.infradead.org; Sun, 10 Jan 2016 00:44:41 +0000
Message-ID: <5691A934.8020000@cs.wisc.edu>
Date: Sat, 09 Jan 2016 18:43:32 -0600
From: Mike Christie <michaelc@cs.wisc.edu>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>, mchristi@redhat.com
CC: linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 konrad.wilk@oracle.com, drbd-dev@lists.linbit.com,
 philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
 linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 osd-dev@open-osd.org, xfs@oss.sgi.com, ocfs2-devel@oss.oracle.com
Subject: Re: [PATCH 01/35] block/fs/drivers: remove rw argument from submit_bio
References: <1452027218-32303-1-git-send-email-mchristi@redhat.com>
 <1452027218-32303-2-git-send-email-mchristi@redhat.com>
 <20160109133409.GA26660@infradead.org>
In-Reply-To: <20160109133409.GA26660@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/09/2016 07:34 AM, Christoph Hellwig wrote:
>>  				count);
>> > diff --git a/block/blk-flush.c b/block/blk-flush.c
>> > index 9c423e5..e092e13 100644
>> > --- a/block/blk-flush.c
>> > +++ b/block/blk-flush.c
>> > @@ -484,8 +484,9 @@ int blkdev_issue_flush(struct block_device *bdev, gfp_t gfp_mask,
>> >  
>> >  	bio = bio_alloc(gfp_mask, 0);
>> >  	bio->bi_bdev = bdev;
>> > +	bio->bi_rw |= WRITE_FLUSH;
> Shouldn't the |= be a = here and in many other places?

Yeah, I was trying to merge bi_rw and bio_flags. I am not going to send
that. I will fix up the patchset.
