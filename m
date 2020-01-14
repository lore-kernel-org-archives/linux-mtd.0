Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C60C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C482075B
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gEzYi9rW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhYUIhUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C482075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWq8n2OVmBVudFOZWyY4yjTU5vVH6NhibCO2vxcDgn8=; b=gEzYi9rWCUXkeI
	w2wTruNgb/VZZaiLtALI8LIg/amdmnocWy/swy/Dqr4hHrhMFuuHImy9eaXEXVOKKovjcuRUGM+w0
	LBHxEaZu+XaL9sb56Yi9Y4nsXYhWApirsXsN+AorwZGWw4H/Faj3+gep02GE6OsQY8PUNosNHHy4c
	3pKEN2TEsvYDPW3FmNJVfnZx1h0deFUQpAwkJC472V6cxxUFYf/lIh12uxFYD8E9adcLVtWTtPkmr
	ONpzjk0OUsimcPPt1mWGVY/jXTISRfq7O+JsuGqmpPyFMpboeeEhAtFc5TQT+iST/4CORC49xG7nW
	/p1dF2OlVLBZwxSyWVeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irQ0k-00059d-Da; Tue, 14 Jan 2020 17:29:50 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irQ0S-0004vQ-4m
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:29:35 +0000
Received: by mail-lf1-x141.google.com with SMTP id 9so10456369lfq.10
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2020 09:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D3B/9aAIWWnv364Zdiyih/Gl8h6mySqmdy33Hg58LGc=;
 b=BhYUIhUoKB7SRVYd2bSsqiHBdlJIU/BmbuUfx4cjq5BR8tTiQlFZiw92dUOExmehBE
 acZbdC+n6PxtmRkMsRGkL/SXUXCzZvnGTCoUodHUgUytkERb9HZHCBt7Zpi2kDfCMjAL
 Itb2e/FZ2j8tBEj0edHat63pEE51wATTxj7MAXx2pJBOaMAA2oWDLi3XzgzSfBCTnUH2
 awyMulGQN3ztYUlSoqBhhEuzXtmqqU1YaDyENwHIGsSlCMXMCosY0lTMhB02JraTelCQ
 r1c5tyAwtXABIgSux03mpyT8nHKs/WfG9CijOfGjoWnue+6sgCUOV289/vF9QRmvJzaJ
 fmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3B/9aAIWWnv364Zdiyih/Gl8h6mySqmdy33Hg58LGc=;
 b=q7OMV7OsB5kdukZfNRu3ABGEpPgEqwgIGDKU3+7XLk8cAf6KwLO/2xr6e9Uk2J+QRQ
 lij0agZAyTr5nr3AI/P56NobM9wYMp8/Jh9uzJ/4rzTbGuvj3jtkKUyXrAHqtac9pOyN
 Ph5Bit/c0apZGZeh7b6emOu8O8snuYGTykGcy9hdIdxbQWSBnz4w2jjfGti33ZmbqTUF
 K+btn4Szv7DcosoXvxOMvcLoPoMSA/DYIlvyTZQmhG/Jprzf53mjGbiNyQ2ZtQo7TdSp
 A4MsWbDEzOSMb2dNPDrHju/QZ/b0JivtY75RVg4UDrHS3mSZl60E4X1x2f+b6mTHTJNy
 TKwQ==
X-Gm-Message-State: APjAAAWabWEM46CPxtqG7z/9IJW5IRPCnvss51a5S79xvAGc0wk8rRkP
 Fp7BgglBWcywb3pbIJQPYfCIJdn41z2GZEZAxLA=
X-Google-Smtp-Source: APXvYqwfPKF5OMZHuufaTixaCnnXaruPdAwJCsGvVD5BrQFZBaUSTmI6ZZnTc2OwayGMYXgnlg6aPdoevHFt169WX6Q=
X-Received: by 2002:a19:7701:: with SMTP id s1mr2445708lfc.180.1579022970006; 
 Tue, 14 Jan 2020 09:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20200102130826.170647-1-esben@geanix.com>
 <20200114170354.918-1-miquel.raynal@bootlin.com>
 <CAOMZO5BvO+rSqc8pPkzC=dEa1SkokeDNtgK=W87amWsOUODBgg@mail.gmail.com>
 <20200114182557.00b0c6ac@xps13>
In-Reply-To: <20200114182557.00b0c6ac@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Jan 2020 14:29:16 -0300
Message-ID: <CAOMZO5AELQV8q=k6hcHoEZbQp3EmXzPda9Nxw+BC6+e5EyqKUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_092932_238214_4A0B233E 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Esben Haabendal <esben@geanix.com>, sean@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 martin@geanix.com, Han Xu <han.xu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue, Jan 14, 2020 at 2:26 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Does this has ever worked in the past? If yes can someone -Esben, Han-

Yes, it works.

Adding "Cc: stable" plus the Fixes tag makes it to go to stable
kernels automatically after it reaches Linus' tree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
