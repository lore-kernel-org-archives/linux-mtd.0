Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C200C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPRDo0F7COlcG3J6gYuRFAc7to/79hVsQgpGGwkmdvQ=; b=jHrfJBB5Kjdxlj
	oOgAfoZepqBskSInuIkCk/tqBzz/LTQkn9EwXQuLR7+ztwYiDRl1ruC1LPLtOctLOqSovZ3fpj4Cp
	fIn5xTHnKqGAQSLjpl6xygLvcrJmkmChHy2VqCkgBbEjnaDgfXr3deP28e8KBWe3kVK68vu9q3ytl
	GqkA31h8Unxn3m2nnD0AQuGEUtXmwJDO6Dsg9gdsmXfU3wQqHT0bfgUNj8FjJTbjZqju54ati3xIg
	IRowMnuzF6G1I8TVQbE68X6e4Xh/lCy7ht57IB9+vcCYBOQMrcgVvji3Eq1jtBjyLnI485qtzS0g+
	mrySMh6JAswZtU131gYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndR1t-004IWQ-W4; Sun, 10 Apr 2022 06:26:34 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndR1q-004IUM-Pj; Sun, 10 Apr 2022 06:26:32 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E057168AFE; Sun, 10 Apr 2022 08:26:20 +0200 (CEST)
Date: Sun, 10 Apr 2022 08:26:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Coly Li <colyli@suse.de>
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Message-ID: <20220410062620.GA16234@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
 <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_232631_021111_4D311942 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Apr 09, 2022 at 10:15:33AM +0200, Christoph B=F6hmwalder wrote:
> On 09.04.22 06:50, Christoph Hellwig wrote:
>> Just use a non-zero max_discard_sectors as an indicator for discard
>> support, similar to what is done for write zeroes.
>>
>> The only places where needs special attention is the RAID5 driver,
>> which must clear discard support for security reasons by default,
>> even if the default stacking rules would allow for it.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
>> Acked-by: Christoph B=F6hmwalder <christoph.boehmwalder@linbit.com> [btr=
fs]
>
> I think you may have a typo there: my ACK was for drbd, not btrfs.

Indeed, sorry.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
