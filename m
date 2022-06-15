Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA53C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIwQNvnimrpcsTKGxfq1i3zOREMZSR/shDbYMJCIqME=; b=CHPNGL9hr38PxI
	vS+cSo+S37AzI5RC/LNdLsMVQtcH6F1mXN3ls/ifSCnoRNHd4PC6kIuMNRr2BXDM40w8jEwNsvfkL
	GRDCjmaDxPqh/IC5j9COBCFxoE4Jc4d6CpjNBWrqsfLNTtLjoLVQRkfVt/iB41p5VlOgGmHtSqrDM
	IApRiNM4anEyhoGnkgpxw6a9FlfnNpoGtNI8f2E9XeEToN16J/4o9h0ky2JOPoMYb6rd88kFPcEr/
	op/dDybOQj+yTCkzYRC7kiRSnfRMnTNkgy4UsYH63aOWZJBjXBiA76BbEmx2QRR6KHw7W1OMhG0EC
	zCbqIABg6bQxl6cmy6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1O81-00DC3j-RJ; Wed, 15 Jun 2022 08:11:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1O7y-00DC0B-2A
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 08:11:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1403361727;
	Wed, 15 Jun 2022 08:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353B6C34115;
	Wed, 15 Jun 2022 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655280703;
	bh=G8h+IDpJR0CvhZVQBHmA8xXUGMUALrZIeamkPUOOwAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6Y3XOcwoC/TgUHQEi+SmCxARb6tPwZNqAYZg5XUTUI3Q/ll5OApOdFtKbROVKu0J
	 G3wBk9/2zrpVCGzGGdhz1ESbgkoh73YGsKSRIOJUxvsHV+/K5Zd6avT4WMepRjY9H4
	 wamp6FUhQPTuGWEhQiYvx6IJuRvj3n1pbZp2ZHUm41s47toXZ4TP69nqNoX31VqQXs
	 PJkwswu6LBuH667SA02KF13mHrfORzWm/2zDlI2HgW90bjJCTh4CmOq+CyWlVyareR
	 TNZ8wmpjenOnCxxJfBdf7GMJYbuk/uABYuIiv48owX1ckCCiZaFExYBEBPHV4h2PdO
	 DbPuKfjHUQGOA==
Message-ID: <5fdec03e-efb6-554b-55b3-49e7e7f2be5e@kernel.org>
Date: Wed, 15 Jun 2022 16:11:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [f2fs-dev] [PATCH v2 14/19] f2fs: Convert to
 filemap_migrate_folio()
Content-Language: en-US
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-15-willy@infradead.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220608150249.3033815-15-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_011150_208543_DD17A4D8 
X-CRM114-Status: UNSURE (   4.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2022/6/8 23:02, Matthew Wilcox (Oracle) wrote:
> filemap_migrate_folio() fits f2fs's needs perfectly.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
