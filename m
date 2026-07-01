Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FF1C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEgGiXk/IgvuFVUfLhgW52MfSuhkToZmmJkOw1kTGPA=; b=NKkLsuC+ZBa1WBAnZ9dCE+JNAM
	18dHWB9XnXfac9MzTgesalQtSRx9z0wLiR4PRSKMygVLMZCmkg6b84seObUfEe70rTKSVyQea+y0L
	4jQQSy5yvHeHjBTQ0vS8TkXziuMRru+GSaOZUlWQVrm6qLixU8hRvmAtzgLyhWts1FXQOZjgor44E
	muvuvQBSynwLVixV9N5mr5jyc0hxnnv63Ai2ksawA1uD49p/D5Y5bH3HUdDXNDFQedNl2UpV5tBgm
	L6hN9QFBD1rpqoODLUJpesEujLSIGsiqcEexHYZlC5DsLhrEpqICj3o6AjZSyrHeQ+8ER8wVwlc2I
	AJcBLY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepQk-00000000uPB-1VON;
	Wed, 01 Jul 2026 07:32:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepQj-00000000uOj-29hh
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 07:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46EA943892;
	Wed,  1 Jul 2026 07:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E961F000E9;
	Wed,  1 Jul 2026 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891141;
	bh=P5Bfbip9qYctWAn/GXf879mOOovT7syPqx1kyDWbY0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SDF8cHbHUzt/D40qAuHIsDLs1MOF5o4TXzaCJJGiZRS4iDzNfdw4LCfLF7a6I5Wh1
	 sKFungFZbeYPb+PoJKYPe8b3iFg/+1SCB2/Gfb4H7uZB/09ZMa9djgTown6C08oPZj
	 1gakyB4yhSHEnRfjRM1OPgaw5V9BPw9ClCGsMIYEbbywheeZYp1ayR6zro3YKUTacE
	 l9Myiz+QY7z3txeF5Yx1ZXJcSm/AngCCK1Q+OVtJ1vne7PsUnzz0wj/XFtvGjgZOYE
	 tQR6elowwpBxrkRyuU/ZRmXIIev3dehoriyheBcFXWTu5eu//DVrCVojQtG3auUwos
	 Vc2l8cT9izXWQ==
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 09:32:17 +0200
From: Michael Walle <mwalle@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <87pl19s7ng.fsf@bootlin.com>
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
 <87pl19s7ng.fsf@bootlin.com>
Message-ID: <0fe3140096bc48a8e71838362220d9f8@kernel.org>
X-Sender: mwalle@kernel.org
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

Hi,

>>> https://github.com/sashiko-dev/sashiko/blob/main/MAINTAINERS_GUIDE.md
> 
> There are a couple more questions we should answer regarding e-mail
> delivery:
> 
> - Shall Sashiko reply to all/just the author/a list of individuals?
> 
>   If we go for e-mails, I'd answer to the thread, so "reply_all". But
>   I'm open.

I'd go to let it only reply to us, which will review the comments
and forward them (or mention them with a link to the webinterface).
But I'm open to just use reply_all, I just fear that a submitter will
reply to useless/wrong suggestions.

> - Shall we set an embargo?
> 
>   I'd be tempted to say "no").

Whatever that is and how it will work with the reply_all option?

> - Shall Sashiko send a positive review in case nothing was spot?
> 
>   If we enable e-mails, I'd be tempted to say "yes".

yeah probably.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
