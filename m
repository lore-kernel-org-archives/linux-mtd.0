Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3659C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HX7rtisApReCTbutu2wqhSU5zkvIKfNMDSXSxNeVwWE=; b=iV/EGwwr5Vr0eZ
	Fh+Xk8YErA8T/Hb9ngyaQbC0CIAIXMg+3c5UCIrRjmXq3z5Zqn1IV9pGqPoCCT+Eal+qDeWsNpkoO
	POG4wgIx3WNfzaSLaCxl3RldPjqikkdChzsUhkX4a9SP9bBi/BENvZgyiMIDFhGu/Sh2LPFHw3o5T
	MEPA11wc/jfq/JuzQ1+yJRJBO9j+OsFi4jpxYqzWBXE8sBzkjIef3GKphLlBMyPpzH14SQ6zLW9L+
	WVlPUZp6dNAMwVmP7Nvh9senRP2PiYSJlevhGG0oh1wm8RGX/sAG2HnG0h0xdIt4lGP1m9DPEGYgU
	EY7hIfUF1BozHO5lhyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw4Q-00AyH5-0Y;
	Wed, 06 Dec 2023 17:52:26 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw4N-00AyGD-1z
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 17:52:24 +0000
Received: from cwcc.thunk.org (pool-173-48-122-214.bstnma.fios.verizon.net [173.48.122.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3B6Hodj2022646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 12:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1701885052; bh=VZDVHdtsTza1iBjsN4e9taxM8QQIzumJOYNTH51fhro=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=BH8TRkxS2KVaitLmv0fUh5MfTnRi8kxhm2QxRnobVHqRnCkm5tdQJ4YU7KzmgN2o9
	 OrT5ijrdbqD+8Tpl+UWv5WlzoZ4FfBRwcoZtXGHipfp3BKDuVw8Wb3OV8JHdDL++WR
	 fchowN0SphtUdvT2S+alJWDJDljYoM4HhCP8Oe9wGQPXflEuR9UupnRUlKWI1Qe2kg
	 kWiBMGCDi9IQPUcNW0bRqxHb1k7h5ks+vYGOrOHkVBn6CgZz1YTgrm04q9GDpzs5AE
	 AW77xm7xSTCpwyFB4QBf7egNa0Hpu3J4Iea+sXKNE2nV9yZ8sAlE3vS7vnXmXBUfDj
	 Vli7wjfFyI1og==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id F04EC15C057B; Wed,  6 Dec 2023 12:50:38 -0500 (EST)
Date: Wed, 6 Dec 2023 12:50:38 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
        colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
        dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
        adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
        konishi.ryusuke@gmail.com, willy@infradead.org,
        akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
        linux-nilfs@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
        yangerkun@huawei.com
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Message-ID: <20231206175038.GJ509422@mit.edu>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXARKD0OmjLrvHmU@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXARKD0OmjLrvHmU@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_095223_813628_C7F899C9 
X-CRM114-Status: GOOD (  19.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 05, 2023 at 10:14:00PM -0800, Christoph Hellwig wrote:
> > +/*
> > + * The del_gendisk() function uninitializes the disk-specific data
> > + * structures, including the bdi structure, without telling anyone
> > + * else.  Once this happens, any attempt to call mark_buffer_dirty()
> > + * (for example, by ext4_commit_super), will cause a kernel OOPS.
> > + * This is a kludge to prevent these oops until we can put in a proper
> > + * hook in del_gendisk() to inform the VFS and file system layers.
> > + */
> > +int bdev_ejected(struct block_device *bdev)
> > +{
> > +	struct backing_dev_info *bdi = inode_to_bdi(bdev->bd_inode);
> > +
> > +	return bdi->dev == NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(bdev_ejected);
> 
> And this code in ext4 should just go away entirely.  The bdi should
> always be valid for a live bdev for years.

This was added because pulling a mounted a USB thumb drive (or a HDD
drops off the SATA bus) while the file system is mounted and actively
in use, would result in a kernel OOPS.  If that's no longer true,
that's great, but it would be good to test to make sure this is the
case....

If we really want to remove it, I'd suggest doing this as a separate
commit, so that after we see syzbot reports, or users complaining
about kernel crashes, we can revert the removal if necessary.

Cheers,

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
