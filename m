Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1085C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jun 2022 05:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNALOUlnGYst4WVQ52Fcz6WQEN1wyyLwGKu8tgfMya4=; b=4tgpCvNhHwusUXElHXTeBcPVc2
	pZeSbXDjXaoIm3yaeL2TyhwfHyCuOF2JJd1OZXDbnj19vinwG9Jo687ZqaL+F+QQivcVUatDkizsA
	4boea/7AHyLHj8/fQLDCyDQx3wzZ35OjKKn9jDDzBaqqTFXRWNVwW439D38OgQJ4rCkeUyi7FWtnn
	g/LW6tf01e5PSX0AYVhCKoWxhfRCIliBX1sSGM2guCzKykZThGEgz1NY3xRoKvOCrisYrHmxqo1x7
	Bu1ITyzs+sqoSo47Oic5q2XUBNqnyJr2wTfesFbVxiHZ3qlS+ib+6gsL/0Nl/gYEJ1B3kPEwZV0rj
	oV1gQoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39ba-00GDrf-Fu; Mon, 20 Jun 2022 05:05:42 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39bV-00GDrB-VF
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2022 05:05:39 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u12so18775441eja.8
        for <linux-mtd@lists.infradead.org>; Sun, 19 Jun 2022 22:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=2JA6OF5giONCzBIvAT6R4r7IVTuA+8tJsxC7EPk7bcA=;
        b=pHSqPOyXXx2BiygSHZBjLaX9v8btiqkaqWxXvw2oY49V9hwOrzM28Iy5OGzsdF6X2t
         noOSJfoDU3kisqf9Cs2XKUDdAYW+oNyO6TUQ/TTKlINIRsvbS8PDcOw1OYqNkScdok/F
         NSe3+ClrOUUL3Yu0efqPzoGnwTUV5c+8N9/FXyNBNQs0axQMAV7cAz/DvQ+kBIExctKD
         Q8emA1d6QpcmQaqej/ZeSQZmloLgvGuAHzYzBmy4Odtj69RCNB+D/3D03BD+oYSpc+Jb
         V1y8HMpxEjvVQpiHa2weetk2NOm1LJ+rnxcx5xE+A+kXW9OhactzmD/nSUH6Ag1oNEJY
         Fg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2JA6OF5giONCzBIvAT6R4r7IVTuA+8tJsxC7EPk7bcA=;
        b=EUoNvZym2emBytRm7XlA2up8Fpw8/FfPML10Yj3q7yCE3kRRdHeV7Cyhx8jJRjAs54
         F9X/GludQ519cRPW7J6eOgfQllqeQyyiYC9RuyTf2pTrJxqtk9gMPTr0c/4EHpeEJYjT
         Sshd+/uxzn9jkJ7q/qPTknp3S5WoS1nEy02hahQRX+MAE8qvnVSBqlBrtiLAM2n93E5h
         nY9yo7O29CeVuQgbcJQlSqvvquuQ2+xZLV2AmYJUtqp2kMPViPrb1cwOQQhhTnA5MXPK
         v+HALvKDa0ZtdlAOxt/HkpkQFvg0kFSq5SRpkB4oTmveq7ozSsj63p9FKCLcPoG2hZPw
         idzg==
X-Gm-Message-State: AJIora9NMEP2VRGrDRYb54yUZeXew6NhX4RzhzwqbRKwU0IoNFlvSDDA
	dvlf/fYBjyglbgZx+q/j1WCIPbNauWjnYEdbO5c=
X-Google-Smtp-Source: AGRyM1s6crufN8qkE/9l77vycAKIZcjhetIjzD+AoDRNFBQ+BVygMb3aVZP67MKDuQg3bW9CwZCrTA==
X-Received: by 2002:a17:907:6d0a:b0:722:b0b5:be69 with SMTP id sa10-20020a1709076d0a00b00722b0b5be69mr4635750ejc.76.1655701531526;
        Sun, 19 Jun 2022 22:05:31 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id z7-20020a05640240c700b0042617ba63c2sm9481800edb.76.2022.06.19.22.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 22:05:30 -0700 (PDT)
Message-ID: <ba554562-8c43-555b-6585-e1e195dbd6cd@sigma-star.at>
Date: Mon, 20 Jun 2022 07:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ubinfo: Fix --vol_id return code for absent volume id
Content-Language: en-US
To: Andrew Mellor <andrew.mellor@casa-systems.com>,
 linux-mtd@lists.infradead.org
References: <20220606063846.2061-1-andrew.mellor@casa-systems.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220606063846.2061-1-andrew.mellor@casa-systems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_220538_355478_B91DD6AB 
X-CRM114-Status: UNSURE (   5.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
