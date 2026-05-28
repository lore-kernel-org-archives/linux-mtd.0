Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAABCD6E49
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Tgf4Zbw/rN0xZSNcFUVx5JHwb5tPkIcaibBn0R0q+k=; b=4Vu8sLQxZtJ60P
	8/4Vn6R0vZREhAHMxwdeQL3bx/wJlyHvsvimFDmmFcPoP0e/6AGTe1owWimIfkQAjvwWnTiyj36ux
	eHA+A5FgQnX4a1B2DmkRai7eW7nJ9j2H38OEdmFmLU6GPOVkyxvoPyXep8Aw9E9QEKVTT1RkE3UxV
	wXYQLD7C02/1D1guiBZCoAvhlXVOPEZoebk5lqoRKCsdj+ZIWdp9SrasQd4L2UQKD3VCdnmTlPant
	XkZGwivibWAsGFb2qkZV1J5MeV6SD9rsXuIyYec9XeGp6K/plTcA1N7JIi431i6/qVs3Uq0IQ7DE5
	qKN/REF2qEQX4Wqarsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbGK-00000005okv-2rEA;
	Thu, 28 May 2026 13:59:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbGJ-00000005okn-34k0
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 13:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D94C6054B;
	Thu, 28 May 2026 13:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD211F000E9;
	Thu, 28 May 2026 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779976742;
	bh=yizJo2pvoDURIzc8VIfWuM06YJ/ZuC8eY6rRtWBhoBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nuB+iwzPQjO5raRpXX0s+8LMh1sfIHJVWewzoA3GPQ3ofPxhaQkxCf2YuzcT/MaFq
	 B3vHQUfPoMU1Si3v4tkdICAoS9ep8Pwt77PSl+CPCF9UOzOrBtJrj+8UEAHkDgXDpt
	 xokjpsq+vqNOVZzoI0ZZzbM5NFzTZ/6/VHrOPSh9/8P6KoJ0MyBgFEZaYHrsVck64O
	 tjqoBsx0aoy2JWo15UZvnQb7Zcnn+SUigC6rrhtm5GbvaobqedP4Z+Gnkfn4mTl5Hp
	 6Xvmyh3n6KnVNlotgsDgRBpt94a4RqWUB4zaYDM0iWWMxgThkfFaqqLTzYmXoDnHWL
	 gydmOeLgTx2+g==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH v2 0/2] mtd: spi-nor: spansion: fix die erase support
In-Reply-To: <cover.1779872008.git.takahiro.kuwano@infineon.com> (tkuw's
	message of "Wed, 27 May 2026 18:05:38 +0900")
References: <cover.1779872008.git.takahiro.kuwano@infineon.com>
Date: Thu, 28 May 2026 15:58:59 +0200
Message-ID: <2vxzzf1j3aak.fsf@kernel.org>
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

On Wed, May 27 2026, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
