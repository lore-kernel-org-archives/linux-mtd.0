Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C55C10F14
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 07:54:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DB021D71
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 07:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AimF+IXo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESGbK5ho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DB021D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xb6oCVwseaBWt5zLZ+/YbaAvNhvccziMx1fZa2YRpos=; b=AimF+IXobgOmFx
	83lsxBV0/7BZ9rwhvXYBBYWUL+3OVlRK7/AHm4G+3+r3cVwO9rhaIDPV2g3IeBGUP8McHBTYCLdbn
	GcGEdF6kBL9B1gARkO+itrO+kGxqdngRhX1ueIEDh7sXoLxTKbXvuTOomFKmOiPTmdXBe2Z4OndDZ
	5mdXB8wWifoysdjnMlbEqVHLdjfylqKa4ned8mB6/eCvCfyjrwfyjuq7v9aGAUA0veLak759r2Avu
	GVKgiqKxUUEbbO8oe9+AP+O01sx6iPgPjtNx6znh5WGsYBVJuJHE/n7YORBvvdMPIRKltV+cJMyUE
	E12IjOLtkpAudgd+btiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFvwu-0005gq-B3; Thu, 03 Oct 2019 07:54:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFvwq-0005gT-Pk
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 07:54:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id w12so1857088wro.5
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2019 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxM+OdQ7LhOi5tdqcCfqYU8f4Qp37f6TEUQsygGuS1k=;
 b=ESGbK5ho8IFe1IO5m1WtDIUqROsHjU/k/8qUDLribpBFNoeUr05l4n64pCDP8dO7ZQ
 N6JJ9ab773vXB7x+T4LxjXkGYuC4VJe+J2av/y+1WsR8nNgbV8CHjEH2ddayiGwDoZ8K
 /9JCXooIiKZM0CT0xoy5VTL+ruRZA1p4tlqOFquOT0i0ka3OKYWgkw1yCfJWi2l3i1UV
 dHEqbEp47KADpNyaUOJoZh1HsobHoxZnzjvj5zDHUaXLOB9doKzjYxe2R9oDpqh7ZyH5
 ynlYE7BUKzq55hkEE1sJ7UiN47AULOwLkvudzHdfcg3XWj9T5q5WhM5pVVLnhLbbnJw6
 WylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxM+OdQ7LhOi5tdqcCfqYU8f4Qp37f6TEUQsygGuS1k=;
 b=ZCsrRP50od35E9TDAPUuTGWDvx8e94mjXoJpFfG7pFJL+0xAvRbC/57rh1EpXhTejc
 mu3v2YA+NZEOHuMRwN7eIAhlf3yuMGBRQUIOx5ij5ShIcghkACd3qWSOpXWEB8aursSo
 q57XMIwN08Bwgd7rJqD8zMk8wb7rY+LwY5lxZtcTg198+TdIauG7RHB3JBIukaIbzhwr
 Xw5JDrl/T+bwnbHqT4/wdS0ZfV1O1JVs2YfdhmoIHjgR11pe4zaxhhzPhUORGaLc/jHo
 +MzdBTZm8r+vyh7hFQd0Q+gVw6BmrkUdf8MzMl1G5iWiePulWz6ks5nJR4PtsiyvfIwJ
 Vv5Q==
X-Gm-Message-State: APjAAAUVoTuLDORpatUgaL1661b3Zbn9z+8jZ+YqQEMcylAppMDbKCVR
 ieq5xXXBOJWjCvkR4rm+D2F+S7vU0uoAveLMMtyjXI98
X-Google-Smtp-Source: APXvYqw/yohaGb2F/DHzgatmNyXOQ3wQ4ZXf72FoHc0tJ7jL9iNha1V5lCOQZWh/UXx2Wxzbb9+dpJc4oOp1M1GlE/4=
X-Received: by 2002:a5d:5352:: with SMTP id t18mr6172472wrv.72.1570089291041; 
 Thu, 03 Oct 2019 00:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191003063501.18421-1-post@lespocky.de>
In-Reply-To: <20191003063501.18421-1-post@lespocky.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 3 Oct 2019 09:54:24 +0200
Message-ID: <CAFLxGvyG-RCvwiAU-T7k4a2u36t470mnotWmJu4WW7F-2ahQ-g@mail.gmail.com>
Subject: Re: [PATCH 0/2] ubihealthd: Fix options
To: Alexander Dahl <post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_005452_859721_0EA81798 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 3, 2019 at 8:35 AM Alexander Dahl <post@lespocky.de> wrote:
>
> Hello,
>
> I started experimenting with ubihealthd, first thing I did was:
>
>     ./ubihealthd -h
>
> And boom segfault. The first patch is about that. The second about
> having the usual -h and --help options.

Thanks for fixing this.
Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
