Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A16CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WFYSmFUo6xYAGk4nKyki8eQoi5Ehts/JOtERLB9ixMw=; b=D3zSKCKxmv78rNwUlnbbRFrAog
	V6d0XHC1c5SBE/N+2TkKy5Mc8Zi4uX1NJ+VSYFHt16vEAsaJo1QVFtem52wNZxCjGfzIbRVZw/XxD
	QmwvAAhz4ps+nRSQ9TpLv4fXCuvfi2vYR/IahfpyZ1+EykWc6LIOWWHgTw2XmXdh1bi5dlSodVTto
	cRbT1DtoU8eCiv4n8voy3l7wahllwaJ/kBKCmXPU4gALfTVo0VYoqkthjAYd2PeOfcJ3/KLAkGmtW
	dMbiYHHkvXyf8V/YPQL5lJnZEGdrhxL6j9+hyGzMMMbDkMFFqhY+N8thJHQmqhVdF9To1DGz1eTWA
	PvCciRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLGH-0000000BKFW-32ni;
	Mon, 12 Oct 2026 19:00:37 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLGD-0000000BKAw-3wXT
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 19:00:36 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1791831620; bh=9qT4pGwMl5qAprIis0C7lQM
	f6kSOU9B9EOhw6jhLpXM=; b=J2IXgqFDKOY7TeBaT5atPBvHlBiinqoV3cwwCIMAFlBf6ob0vq
	bkmqsAww27QnQbKH6yKs7QR3rRHr2Qx8jzDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1791831620; bh=9qT4pGwMl5qAprIis0C7lQM
	f6kSOU9B9EOhw6jhLpXM=; b=qGJSOaJNMueT2sk2GzWHcRpTX5Ta2kS/HdLrGPGQ3kFQ10kukq
	QRQgf36aMMQmZC/WOwZpriAEsnNwKYNASMOoXzc92uzXAWBM68l8dtScC6NA4XJA+uFVOB8M5yy
	KfU7lQdJfBMRreuSCRmvtA+nFUuSlsKm4wtqO294Tr+6L119AZf1LH8+DrqMCFhiuKiULhRQGyL
	GfbZbx4fNH6IB5mnetRiZzC4Daq0Tsn0kODWyxJdveF0aiDOqiaM0m8AYdOTIl6MXIIpxzlb4H6
	jDQEzVmLGPl9qRz+LCi0FQEyR3LkgDsE69JABUe4KiTOsltGkmxMF1GDMawOCXJ6ekA==;
From: "Richard Weinberger" <richard@nod.at>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Ruslan Vagner"
 <rusya92266@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: AW: [PATCH] mtd: fix comment typos in UBI and NAND headers
Message-ID: <mv5ma6ni.40cc29fd-f63c-4372-9536-1b22e4b9b833@nod.at>
In-Reply-To: <87wlrmzsjf.fsf@bootlin.com>
References: <CAF9RqJ45HPa1HpJdZp3=G6QAxyNSFo4D1cpkPQhN5YmHbSdmSQ@mail.gmail.com>
 <87wlrmzsjf.fsf@bootlin.com>
Date: Mon, 12 Oct 2026 19:00:20 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_120034_143518_0A03F84C 
X-CRM114-Status: UNSURE (   7.24  )
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

Am Mon, Oct 12, 2026, 20:24 schrieb Miquel Raynal <miquel.raynal@bootlin.com>:
> Hi Ruslan,
> 
> On 15/09/2026 at 05:55:58 -07, Ruslan Vagner <rusya92266@gmail.com> wrote:
> 
> > Fix the spelling in comments. No functional change.
> >
> > Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
> 
> Sorry but I failed to apply this patch. Since you'll have to resend,
> please send me the mtd bits and to richard -in another patch- the UBI
> one.

Well no. Just send one patch, fixing all typos in drivers/mtd/ and then start fixing
real issues.
Maintainer bandwidth is limited.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
