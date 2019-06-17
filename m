Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F9DC31E5B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 22:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875882063F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 22:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrzGrESG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbZ2WVJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 875882063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kR6jxdFxIl/cWv8dGXJ8WhKTZ2806BoPUa9j4cEaqvQ=; b=mrzGrESG11msIQ
	hs2aa3ptJ2O5W2poAM8uAj4XvDDtc07lRzvnGBfFTKywJRE/KuU0I2umiB8OwVitO/koLb43ni+IY
	tg9Otfc21DN8Yba9jApeLnXYcx1aW/2okAFG3lWGHRJj9WvP2SJyWODOGfVTviY6gyO9eRqI4rEHr
	Wnk8OOVZ2PbBpuiobCIZ3Zk3RnCPE14n5tvTcPPgfHW7S2cdy4ZwbxuBGLCVHiHGYXHwlgeJCpv88
	WOvpR2az3yj+JgtOELs7vhmsvPXCmuYfIq3n+iF/Ds5hNFGgLZRuUO7QHOdBdorBscyEh6jxNy3+a
	OVciS86POgxWVcP4Dfog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcznG-000071-L5; Mon, 17 Jun 2019 22:08:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcznD-00006M-D8
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 22:08:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id h19so910137wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2019 15:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cq3xBrs71UY77jcBkTVh4FMBqjMhDVmcFlATy07xl4g=;
 b=PbZ2WVJR34XQFcPuUzs458hR+8YmZWdEqmgFSzPWSFIlsVDZL06pJ3uu6mRjk90ijM
 Ee8SeuFeQB+HJC7TOCcuol0gC8EHJ/NDkb1Yj3HJH7fQXsBcYEInOndleiRmubwEHElP
 7jUyZlHaPY1EVbCrsfXv+5ZixqFnRco3DWxyGfSNlyOcWHhFyI0YvfQVXQePgYDQC9St
 Tu4rlUr9z8I52MyfZ5eAvJ7SyiMgOOcjtPv7NktHvOimQwKHX2CjGQPUjJXhRXk2xuEp
 UiA/oBZokE4JtjUJcY9nFy0HxjBPtOAGcvYAZ9pbkKWKQXERHt/Lcq0XxVR2kDyOgMIc
 2NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cq3xBrs71UY77jcBkTVh4FMBqjMhDVmcFlATy07xl4g=;
 b=ZYyUhybSwQ3WiKmhZILDLWt5VE8XGZBbPdv41NHHv8bWSoigOaGAH0UWmtyp1B2PaM
 mVvlgxQRFDI9XtME8A6xXTP1Pf9AFGowQUVP9/IEdINhME47BPSwsVqi2/4m2IxF83aD
 8oj9GtFQqVcreDoxludmUNbiXELjQjO0Ehdo1Pey6/EF1N+jIpbKlFzNKI+9RJxCckkV
 Lh6HE0BRD6bqEmWfp3epO+L8iEClwSRSF5zgBzYZvEas/HXxcPN7HKmoob/jmM97dM3F
 Ar7rViXtGu6G+iK5+KTuExCgD0jZA3xL1+Ay7qqz8IHLneZimrH1gq8TUxSSqNepq/l/
 uMdA==
X-Gm-Message-State: APjAAAX2MFgd0Xb3cv818nQLcbIIvBi83HQ7JTZghSmP71m9T+t4IlqO
 5S+X4o7+FritACNFzMnBDH2I/uKSyyE4/Fa8k+8=
X-Google-Smtp-Source: APXvYqwelkyoSXZXCs+ok0tAtv5XZgf/Y6CcbjhsQi64NXLvqgTSPnIY3I+Cf5Q+rm0J5C/KRhsnJkYs40tFDWHIiFA=
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr456126wmj.109.1560809276561; 
 Mon, 17 Jun 2019 15:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190522231948.17559-1-chris.packham@alliedtelesis.co.nz>
 <355dad1321ed46baa98ca6f47b4d00b5@svr-chch-ex1.atlnz.lc>
In-Reply-To: <355dad1321ed46baa98ca6f47b4d00b5@svr-chch-ex1.atlnz.lc>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 18 Jun 2019 00:07:45 +0200
Message-ID: <CAFLxGvwNNWKzbfKvDjAK6rujbr5qtmVAWCDD5aULO4BVKutRKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: concat: refactor concat_lock/concat_unlock
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_150759_472990_4E72F541 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 14, 2019 at 5:26 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> Hi All,
>
> Ping?

Your patch is not lost. We start soon with collecting all material for
the merge window. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
