Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E7EC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 07:49:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D485B23330
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 07:49:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="becB5z0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D485B23330
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:References:In-reply-to:MIME-Version:
	Subject:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PLmhqb/XHS01bAbwLkhQM9sRTSE9OpRisKy8GYN4HUM=; b=becB5z0AyXAiHybUFN+3PxAgh
	doC/uipxZIdLBIgXOl2Sq2w8yo/4FWf/b29kqbP2tqz2BplDqQVClFOkkxhx4sI2u0X8XJN7q6mc3
	NM/Gq71H2fnR/heLh7Z9mD6t6ayDFrr697cH+vzCEJAlbxFFGG/iX55m5Fugimnbdp7H89ELGA3uz
	kSKCtE1MYUNs4PuLRoMO1WX5w8yuKejNEkAd4TdKA7yQIbNjykekM7mUf5MKGO/uF5rsdmrgsNOBj
	daiC+TW7j2CijV82Jditf1cPNK+b9A3V1WpifdbE0XTqRkD32ewZi+2aefiHTyZ5VPl2OwjBuQYIZ
	MPabq2IgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpoWi-0005Ak-MS; Mon, 29 Jun 2020 07:48:28 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoWg-0005AQ-3L
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 07:48:27 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49wKNk33kkz1rryf
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 09:48:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49wKNk2w6Vz1qqkj
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 09:48:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nTKtcwOEhUnX for <linux-mtd@lists.infradead.org>;
 Mon, 29 Jun 2020 09:48:21 +0200 (CEST)
X-Auth-Info: WBmQM0ILbH4eUVcvvGbL7320iI6xCMOdw9/upcSAU38=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 09:48:21 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 108)
 id B2DA5A0156; Mon, 29 Jun 2020 09:48:20 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id F019FA0091;
 Mon, 29 Jun 2020 09:48:14 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id CBCA12400D6;
 Mon, 29 Jun 2020 09:48:14 +0200 (CEST)
To: Richard Weinberger <richard@nod.at>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
MIME-Version: 1.0
In-reply-to: <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
 <2117676.Cu8v49ySxQ@ada>
 <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
Comments: In-reply-to Richard Weinberger <richard@nod.at>
 message dated "Mon, 29 Jun 2020 09:04:47 +0200."
Date: Mon, 29 Jun 2020 09:48:14 +0200
Message-Id: <20200629074814.CBCA12400D6@gemini.denx.de>
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
Cc: Alexander Dahl <ada@thorsis.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dear Richard,

In message <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at> you wrote:
> 
> > I tried to find out more about using UBI static volumes in general and for
> > that usecase, but neither http://linux-mtd.infradead.org/doc/ubi.html nor
> > http://linux-mtd.infradead.org/faq/ubi.html point me in a direction where to
> > find real world examples to look at. Are there any boards in the wild using
> > this? Maybe with defconfigs in U-Boot already?
> 
> U-Boot choose the UBIFS way AFAICT.

No, U-Boot does not implement any preferences here, i. e. both
methods can be used out of the box.  It is just the preference of
the user who decides which way to go - using the file system seems
more flexible to some unsers, while others care about the additional
boot time needed to mount the file system or the additional memory
footprint needed for the file system code.

Your choice.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Have you lived in this village all your life?"        "No, not yet."

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
