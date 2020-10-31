Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089F0C388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:11:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0F5206E3
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cm3iGDVX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HszznYnF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F0F5206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Phnxrih5O8XpNPhhFtjeGcKE+m8xk1ooSCqPYDoIIUc=; b=Cm3iGDVXiL9LE2YD44wOpP84N
	uhJTct2MaH0MzhG5yceUyyV8/bYDk3jCHzXw2cdIvNoJLfYUorzjT4wY/OhNQdRSVHNaHDD9MTQXY
	pnS304vY0oRxLB4bTLyJoUjoA1sQPOVpgyl+VAcx9P8xyLZWkwoaivuOYvC8RggasFZawQ0WDyPtV
	gJofWrGBnDlOutD4vJ+PniSO3hs/BvapLHbg7gMvU8eY7mwSvsMXJrppmtR3SRsB12w98OZ2XLCjG
	nkI8Ey+p85dHHi5hvkY7SkNfYBgc3MiUe1hXhGgquEk2j2CvCg5A3spk6/Nw4ffjLRoAjzTZsRXEe
	KlMdHFiUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYy91-0003xn-EF; Sat, 31 Oct 2020 21:10:39 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYy8z-0003xD-TO
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 21:10:38 +0000
Received: by mail-qv1-xf41.google.com with SMTP id d1so3852625qvl.6
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2020 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LwSpkjnjjMh57z8bZoBzBdN9xlI4+ylhV2Kzl8NJvEc=;
 b=HszznYnFNo/eEueS4nPbcvXCI7kGWSxOjJ+sSgJD4td9mnA5M7X6jSzuBAchdSt3Sa
 2vY8Ta0clhRDNhD79/ZErvkQu1a8hrCCfGcYS78FDVm6EOlbcRzu3eIPGkbehvwRPNrS
 I2c+ufJwlDSlH53QftXc2i0lZ1upHfr/Q6dRYkA3YzP2zsCFcFVsEF4tStD3+dNu+DmQ
 TZOWVLxk2AXvWuLg/YDuQTlq8aKB+7V+ZfSKahFGQqYAUat8S8HHYJKH0F2YJHk2//uP
 GkDpYfuMweA+XkN0OE6ETya1NzlGZ9lh2W7gg+tI9NnDXvQaU5uBtwj6apQWsQMtmM4a
 DUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LwSpkjnjjMh57z8bZoBzBdN9xlI4+ylhV2Kzl8NJvEc=;
 b=OXtCsWsbQDiTzT5k6RlQz5v/8DY8XATOnM9VnT3QMr3xq8/Bi31g5ewF1GtsmXK9Gm
 p/9UDqGfRcINxZvhURTgJhjwdx887PhdBnr80LohZqAI9AcdplimgYOVsb115r17gSNW
 Ba82F8WMD1VZOL5nG4jA+Ff2HVx5/l0miR9lawaW3jqfKmkDmInbvPqDWsZZyJNbFB8r
 ak50y7n52yktylkdOnHV3P3ljfa3k4YpNQqF0Xtrf5HMlnrRN0ewcPkDBYMsyr9Ega6K
 97T2TcF0QXJPKxawtDA+thRxHbQL2bnmCgLNwJd64Fca6X/hLzqaYE84KW5Q5a82ztBo
 fOnA==
X-Gm-Message-State: AOAM5301mfOoNFWEIzp6JGs8Kz9WQYJQt26cWkdi1kwenliSUdw22FY2
 n2jBVIb/jgYFTKbXPv2ARuEMhXL5rQnGAex2nRGrJgTSLF0=
X-Google-Smtp-Source: ABdhPJzDLIuyj8SHNKxKGcNofGSZ7W+dFyFTJJ47RWfT70GgyfpV6XJW8tJYbRsSBv9JLgUQZUYM8Zhh/eQkIgD5/nA=
X-Received: by 2002:a0c:a261:: with SMTP id f88mr16083709qva.56.1604178636265; 
 Sat, 31 Oct 2020 14:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200630130438.141649-1-houtao1@huawei.com>
 <e2a0ddaa-402f-a4e0-ed0a-74ce7d620722@huawei.com>
In-Reply-To: <e2a0ddaa-402f-a4e0-ed0a-74ce7d620722@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 31 Oct 2020 22:10:25 +0100
Message-ID: <CAFLxGvxHiFuHpwUOWxbf7djG0__-Z9qB5eG1oBYwGzY3FKSDGA@mail.gmail.com>
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_171038_015052_9F273A94 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tao,

On Fri, Oct 23, 2020 at 9:25 AM Hou Tao <houtao1@huawei.com> wrote:
>
> Hi Richard,
>
> I have written two xfstest cases [1] for these fixes three months ago, could you please
> check whether the proposed solution is OK ?

Thanks for your time and reminding me about this issue!
I agree that this is a problem but I'm not sure whether the lockless
solution is the right path to go.
DId you try the locking approach?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
