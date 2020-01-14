Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47687C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 22:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D75D24656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 22:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oUcvWSLe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S74dWuBq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D75D24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrHwoCKer7c+G9hWo3hbu8+Yhp1QnhrnHMnvyMReWUU=; b=oUcvWSLesJi92m
	jklPeXOqtzyTfg5cy5s0F7CEG3lZNMTzNU/uqCommrHtJucDCF7eOjUJxcemKPcpRnY+ldZdTssli
	Lcld+VUnhCslZXk2o04u0FnC9FdhfYr7iN1Utax/VhS86FuoyWz8UNLrAXpkP5HaJkO1XvbvV19Am
	HmHBu0yn2flHnu0Ey50Eg5iH6wBOCPHAeYhvX5sHxCEgTa0IhOEcS1SKl0Q63WXNVvShtwTZlhRc2
	O+IYMnzeOP8DAztHvIUIpzrtZ6uCZkUhs/Zd1hOAkJFx68LG4PCGeOuL5YzqojNEFM5vo1gJksdKe
	dMoBEvUEDDYMasBw+8lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irURd-0000Qa-Iy; Tue, 14 Jan 2020 22:13:53 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irURV-0000Jl-OK; Tue, 14 Jan 2020 22:13:46 +0000
Received: by mail-lj1-x243.google.com with SMTP id a13so16179291ljm.10;
 Tue, 14 Jan 2020 14:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cm+CoTM0+jhOXDNc30YUOsZAT6IC0O3DFYyTQEFb64Y=;
 b=S74dWuBqv3AbnCdv3dgeQq/lxdwYTrhinVamWcvPdDyekZU35ibKEMhjrC5G+zJU/a
 HLvEGMR5spesjlGfGtswHQrvcUedM/E0QwkgCcGHEz5tdVmcQvuChLd+2a1uB3ZFZaJW
 wu9dVz6659OdbEOu7cFkes2SeGnaufGc476swME+HHtu5yMszvN/se0TdjWTLtbIRXxo
 HgvgZchckDeg53Slmdr+KNMjHzu0z9iJOeSn5l8f/c/UjvfHf6G574NbUIwE/Yqj2KTV
 msXk+SbQGsqdU9RD04fTTdIPguj48HAMKM7EtqeVav72zAg3A+kizc66ghVrGcwRJAu9
 OXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cm+CoTM0+jhOXDNc30YUOsZAT6IC0O3DFYyTQEFb64Y=;
 b=NfAR/0AoYVg7nJZBzgtdQ4RWq3dDdhxCyzuNmr6/1wKGrXonaw7RAWvOrLtuLQqSbM
 1pEEtlwfrPF/AD+n9Gw+o2Y5XG4lUJLsBO7MePYII42i+3YEIm+C1WcsjSXyceurCTvr
 9jQxthLEVtsDv558/ehkUWml/Nbfxc83miA6kLMhvDUn4py2Adsnd9Q3iVdTOWSGa8W6
 lLd4OZt4X6J26y/gOSOBLRMaKoKa0U2cwVxW6WFrynId4wiG7ngevbaLmmF0Vz++URZs
 fplfoLL2NYQNV6xmV2iH2TQcOf+z/2aBwCCaAvST7Z8yNosixyrC/N+T3bp1toks7Sxo
 GLEg==
X-Gm-Message-State: APjAAAUprdJjCk37ox4bcBstv1iWc3+BN0Ge8eBxoFe8CwIJKoCh09fG
 VmqGx4PKmx0s+xuA4uYuJVy1Kx4lOeedFAFYYKo=
X-Google-Smtp-Source: APXvYqwN82PPY2p/a4NKRmOqyvi3rbYFvy/BLp5c2pkHMed/zTaGeP3v+iuRDWViPLXh0eZZNQcY0U7v9CZ+YZhZJXs=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr15595800ljg.250.1579040019756; 
 Tue, 14 Jan 2020 14:13:39 -0800 (PST)
MIME-Version: 1.0
References: <1579038243-28550-1-git-send-email-han.xu@nxp.com>
 <1579038243-28550-2-git-send-email-han.xu@nxp.com>
In-Reply-To: <1579038243-28550-2-git-send-email-han.xu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Jan 2020 19:13:26 -0300
Message-ID: <CAOMZO5D0LoE8-kJbJ+7AEHJ9PODmCD5Ttv3MUSk7=feWPrdN1Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dmaengine: mxs: change the way to register probe
 function
To: Han Xu <han.xu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_141345_791899_C677F45E 
X-CRM114-Status: UNSURE (   5.79  )
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
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod <vkoul@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 dmaengine@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Esben Haabendal <esben@geanix.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 6:48 PM Han Xu <han.xu@nxp.com> wrote:
>
> change the way to register probe function for mxs-dma

Please provide the reasoning for such change in the commit log.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
