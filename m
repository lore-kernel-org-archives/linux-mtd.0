Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8E2C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcneh1V0RKUDzWYLZCbak3rjEKNlSfGniNquCSxH9sc=; b=zDDElWXkpZ85Uk
	oZdWiF+uHvKclfQRZ0C62KK+nSx49k4HbcYgh+CkVqxHl8xq38SxTC4pNLNYLSqT4e508HAhEbKZk
	WRTUbjsWg0fSRAoCT+6JhYtd47UtD51GvW/+P6PIfi9UHKE0gotWkTGwr7OFK+Jz0J2o+6DWnz3zK
	re5shvBgB8Zk6bHv7SIqkJHU8kziZR2onATp2I/mQ3BWHOJaeI7mHS6+W1bv2EHT031vfQJRAd8h3
	NKIrxfz/3/+yToEfHE+2YdNftuqNAVUEve5s6YmNqTyxju0kyT0U8OPeqwFieQdcKqm0h6pt9frrV
	JUkB58OUp/MzNPWyihtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDigy-00HQo1-0M;
	Thu, 14 Dec 2023 10:11:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDigv-00HQnA-2O
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 10:11:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d367e7092eso3993195ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 02:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702548699; x=1703153499; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3OfCmQzEE/FCdnRnJbp9oZ0U5jE1cjDw1nVdnjvi1o=;
        b=kbpYdS6yJUljgS0VWQzUQ8iVsfnfY2Xj3c6sAiSaoqDX4ksrixgPgMba7GGSfRq4R+
         3M3NHFMa8AiKSFfg8Avn5phF6E1AVXKDT38IO8YbNqwD41iSBNHcp2vNhYN+JkpJGv8U
         XzsYWNLmyHtIbcQbEga9ZJRMeICqiI352UUvTYblj9tjNXdjDNSAyYQ84bezkjglHtFA
         aR7qQ0qi7DBRbxCvrgQ68uYfSeWz1EOGtDcuOn9gD+o5xlHHD9WHGmTo+610tb/hAUPo
         LnqzvhtdKjcAKAI37buT5zLhH6Tjturpspdnu5BXE/DHmQIo59XPx1Htq/u0+DtlMtlt
         7WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548699; x=1703153499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3OfCmQzEE/FCdnRnJbp9oZ0U5jE1cjDw1nVdnjvi1o=;
        b=VEozw7Cc605kfwKVDIYsSXFpn8rOu/mBJdlMTTt9sczVZvdKXdz66cvWBB9+TWTy5V
         5VWBfN4gtFA3dtW02yxLfsoeKjJiKzd4h8t3Nq71OvLdTlryqRZrGdSLkBFGAeyg82k+
         v3H4sd5PbVdYQikbEmdn+lId/tQJiEzjs85jhMXfQUddP3x2Dwl70PJ9onKT5iwhrpZK
         k0TNQw8pXyKfD7tjtfLVxxvDzKUbQ5wjkVu66961sRuKmnjGbn+mO7OnEU0rcK/K2X6i
         aLxPU2qr/y0Numvuqn135mAR9i97arvgMcjbFvElh6Sf2d2SsDBnDXiZpUbleGq+qaXA
         dchw==
X-Gm-Message-State: AOJu0YxDMq8sKYXCkwAwLqVsgYwo/nesvOIsvH0Yv+Hz0sdGadE6/vGR
	iDLMgIa0M1ERV+Qkf7qcDedzgZpYCzYXF3vBvsU=
X-Google-Smtp-Source: AGHT+IEKm442HGKsIN3pgIPXYcNq5ZMKuKJvqimF/5OmSzXmSpCXnVWHa++v1tMfB+J+LkEi6pUFQ7OZCWj+lcqVQ5k=
X-Received: by 2002:a05:6a20:6596:b0:18f:97c:8a37 with SMTP id
 p22-20020a056a20659600b0018f097c8a37mr9385935pzh.98.1702548699445; Thu, 14
 Dec 2023 02:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com> <d0d1171b2fd3e77774cffcd7112653aa@walle.cc>
 <CAAQoYR=+gEwUuw-CbWio7-h9jAP4ESQshF_Ao=Q+pU5jhpejDg@mail.gmail.com> <7eae51cda742c5e36d4a615a03bbe198@walle.cc>
In-Reply-To: <7eae51cda742c5e36d4a615a03bbe198@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 14 Dec 2023 18:11:19 +0800
Message-ID: <CAAQoYRn3Zud8ohmjQryw=v_JuZuqm_QbV7NCHBJOuWVdzV2sdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021141_783482_272C032B 
X-CRM114-Status: GOOD (  11.76  )
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

Hi Michael

>
> >> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> >> >
> >> > BFPT 17th DWORD contains the informations about 1-1-8,
> >> > Parse BFPT 17 DWORD instruction to determine
> >> > whether flash support 1-1-8, and set its dummy cycle
> >> > accordingly.
> >> >
> >> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> >>
> >> Reviewed-by: Michael Walle <michael@walle.cc>
> >>
> >> > ---
> >>
> >> no need for a 0/N cover letter just for the changelog. That can
> >> be included here below the "---".
> >>
> >> And you can also keep my Rb tag.
> > Got it.
> > Would this version be accepted or should I send a new one?
>
> No need for a new one. Just for your future patches.
Thank for your reply.

>
> -michael

Thank
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
