Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76972C3DA6F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcFL++32GKOedZpF1GlZik//IEk9CZGBQI4HUL1DmzY=; b=FstuRK/DQKZ1UY
	V32v5DM57854nlEBbREoikAniAPFY9+wOWdGj+/vnSGAJTry271Y0pZWt9Afne+DhTqhiZL1hzGMK
	Zs6ivz6/tt48PLYHYKIQ3WZRIjFOlIC2gwnYAkb4DKJrtNq8XUnZQUfoZAd3YS52PeYtdVy4bge/p
	3hohtTlWaeyE0cL5mra5EtY8sK2OCEcAyYKTA2zcy1gx1rxRBnrJXjTza3WMRxi+wHjr+RyKoT9wn
	6HVEEWWcFZxa2stuPE6koeeetHBeJS7PsinCGYec9iU2W9Re+MVJHXKReMzCnz77NgclLiFm4GfQI
	CgEp1ZNO3wvGRcg4G7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVer-005Lcd-0h;
	Fri, 25 Aug 2023 12:11:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVeo-005Lbp-2c
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 12:11:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B3FA63962;
	Fri, 25 Aug 2023 12:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB353C433C7;
	Fri, 25 Aug 2023 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692965477;
	bh=w9irN07rzpmcVFq+/nXz+ItXfH5K5JHFoVhhyoLEr4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgwsQk83JEE356qZ5CIds68Z0EkxlmZZ7w/oW3RFs/1XfQUQ+cTThp2PA+jNR14p8
	 D2Ky8aafAffwGCP0SDYiTJIGfK+CEolD7oM8MUdwGyRLsbPT2LFDHXD4vqNEvf3thT
	 K8lRSq3fcE1UnMWgmxFCX9PKX4aUvxVJpothuvekxhPNI4P7wWhtzcchzl7HLrYV+v
	 +aN3gW8+CFoR6RQ9xYTh0WEGnw7krHbnGf9dmVF22u2u2i6QbD0QoeQ093raBKQwLy
	 oCPgHN9WOH5QI504GG9NVeK127lhQmshRebUjM+txQf8JiAQZarxxcy1K6OIbryq34
	 5bXJKcz4OoDoQ==
Date: Fri, 25 Aug 2023 14:11:12 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/29] mtd: block2mtd: Convert to bdev_open_by_dev/path()
Message-ID: <20230825-danken-erklommen-042e5f8678b1@brauner>
References: <20230818123232.2269-1-jack@suse.cz>
 <20230823104857.11437-12-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823104857.11437-12-jack@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_051118_890555_573A7160 
X-CRM114-Status: GOOD (  10.99  )
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

On Wed, Aug 23, 2023 at 12:48:23PM +0200, Jan Kara wrote:
> Convert block2mtd to use bdev_open_by_dev() and bdev_open_by_path() and
> pass the handle around.
> 
> CC: Joern Engel <joern@lazybastard.org>
> CC: linux-mtd@lists.infradead.org
> Acked-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
