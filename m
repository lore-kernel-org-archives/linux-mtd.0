Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D879BD111A8
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Nov 2025 22:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZdBqYyd/QWAlz1ycetC30uzPbTXltuXRFoVc8Uv4Ao=; b=gnMzGf2nxZisIJ
	9+lQcODYfAeYEJU9vXlE/LWs2nmleAs6YI5GZPcQPGrf6vvDd/Wl+E3Ytmw4cm9mWlbNkXnALrRvQ
	ZngchKYuoWLNMNdICu8HaNJWTGBs7iCkKRp2jDd9VI/vPS9yup9YmYMzSt4amTUzMO9mS+g6l2ZrH
	U7p5CcqrJRICAFdFVPAr+Apt4C9sqKzaqvqNaqKMtdGPcQNWgQYdp35vVTuibWofqf8cgOLptl/Nh
	BFnHDrSkGwsA1Xx20pA+vo8hSGobECRWzi0xdsvRCWA4K7R9NIT3VPWloMz6XCypQ0MYLP7DQ9/zr
	MN50wT0V3rDnufkutBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOk5Y-0000000HFnl-1092;
	Thu, 27 Nov 2025 22:03:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOk5W-0000000HFne-2stT
	for linux-mtd@lists.infradead.org;
	Thu, 27 Nov 2025 22:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACA9060242;
	Thu, 27 Nov 2025 22:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC32C4CEF8;
	Thu, 27 Nov 2025 22:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281021;
	bh=zmGqLytRZby4owN8iTnbIG9QtDWsxgRKExAp/iyG32A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UUHxuxKrkEpUJcSgNslQrLDR6ouE+5g3AYpeOjauhuzHbPXfRD4nRkGiIrNYYIcm+
	 gjq1rwyKpiliq0wO99yQCJKNgnl79jClro6F+Szv+GvbjtSVOGb+TQjJmr3xRTSWcn
	 SzOj0eWJ38znFR/eGhYe1WiIZPQA3OYy3pj/7LfzOeQjOtXzOA2l2FkXoetSiCCgkn
	 2jMU/vG84afuXoGnKlVxl/Hr8MfVfDJuXoahD9XYxGDmWOBDmky25fXZZRupMzAE1l
	 miTGpXSG1S5my9wTYcLTQub/6kJrwZ7Ox+gJz2F4L+ccLeSvZ4hRF7r0hdHwzG8rmQ
	 /M/0eOlT7UckQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
  linux-mtd@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailmap: update Pratyush Yadav's email address
In-Reply-To: <20251125173151.29430-1-pratyush@kernel.org> (Pratyush Yadav's
	message of "Tue, 25 Nov 2025 18:31:49 +0100")
References: <20251125173151.29430-1-pratyush@kernel.org>
Date: Thu, 27 Nov 2025 23:03:39 +0100
Message-ID: <mafs0345zw2tg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Tue, Nov 25 2025, Pratyush Yadav wrote:

> I will stop having access to my Amazon email soon. Map it to my kernel
> email.
>
> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>

Applied to spi-nor/next.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
