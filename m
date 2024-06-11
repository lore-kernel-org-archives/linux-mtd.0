Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD97CC27C65
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2024 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWNrfCXG/sVMo2UiBProhVcMqj5zzfqfMtrB3KQALFM=; b=aipTfW3OZOO0QR
	pYCKSu7jANUVA3eM+DcPxaaiD9z8XdBKSG9gq43IKd/0nw+NJVc4blL6E2Kv3116OqyjIQnsMuVfM
	5QMuEUR5BXpb4BGp/x/TKsmBP7e+llwGxsP6X1Qj7ba87fNNC3GfRU7ciIz82CkeVtvpt7l+hfOkk
	Q20DtRDLF5PCwolQkw3AjsQ3urRkhhHcw6pjfvqUub/RIscX2CoOoNa/n6zZ5GJSRHmrOJJ3jc17k
	pzZofvxq/q6K2j4NUxLk4wFMYeU64UEXJfai7g6zSRI9Lu2DTDTNCvfdIyEdAQ/6/CSnymbkpeswY
	W0psvptYtbRuA8yneeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwnl-000000085Vy-3NCj;
	Tue, 11 Jun 2024 08:24:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwnc-000000085Qw-3DO3;
	Tue, 11 Jun 2024 08:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD28C60D2E;
	Tue, 11 Jun 2024 08:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2C5C2BD10;
	Tue, 11 Jun 2024 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094251;
	bh=EFLCVdoWVXgI8x+vDqpH+KGLXZNaxOUmiQChqNs4meI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q/kBEFZ/0xrAI2sEu9TaynLfxDXFSelXwQfPVhceWBMJF67rXnsoSf0WPmrSssyjG
	 wAyQEjvNKOSDuGTW99P/n/USyXBpEs/hJPBtWDhhYK8Vw7vkoUePhP/xVsLzFkoqW6
	 lvKTjjxF0YRUZJg2F6zMuxFTCUXMjyMw9CECUZorzcdjTlaZUCv5Igv6ct9+LSc3ef
	 11G6zLnpcAxQhEGJrLPj98OB8egVZFZCicz/XL1AiLWkTGFK+0l5ihYD/pd34iBMBZ
	 L/cJqhcyVqLZ5BGlUzg23fH/c4iANFyH2WwiPuUXno5waidx9DiZljw1OQFE15jkSs
	 eG4YOkLzWNcuA==
Message-ID: <cb865b5b-ea4d-49cc-b41b-7f46b62b9dd0@kernel.org>
Date: Tue, 11 Jun 2024 17:24:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/26] block: move the zone_resetall flag to queue_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-24-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-24-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_012413_054261_7445079B 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
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

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the zone_resetall flag into the queue_limits feature field so that
> it can be set atomically and all I/O is frozen when changing the flag.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
