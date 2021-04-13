Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB09C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:49:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C486261278
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C486261278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BR1RodzhP/x8luwPYn5OACv8bLI8y1PXN2ib97bQ9gY=; b=nRATUyb5pMrIJ1cOavJDvXGmY
	2qb5dPnVheYmT52KtNGZPAuK8j4TF0IzOyvHm2uQyKSAh+CiLzT986r3L/IfLEaUbFIq0lxwZSXsf
	sMWCXBxKp0zNqDSNmet7uEaeH+o7+I0Y1rs5PzJx4WGeSwZFhqmWBgZ+fKu9se8WWU0hFTNApZcz4
	KpGqoGn5hebVcjd4O5K0I37m4lYU8JWqz8jI5PXlSjgHoWgN0YS+ACrsDcqnfKsxZJp1u1l706W0T
	JVLoadnN4Kwnho9n0drO5pG+G1k9LViU6/0Yk8W7+7sOC4P5850+YN38CqxD3WoktT/SQRQLY25gR
	YoVFUuL7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWITN-009Hmf-Fd; Tue, 13 Apr 2021 12:48:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWITJ-009Hle-F8
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 12:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cjG1rGnnXw1UO7M+t4Y8XCCbBrRNVbmoiz4eMaBw6L4=; b=oSE5OlDO8P+a6YbIzmgeYq+CW1
 kzZIqr+rTcEaM5z74WiD+Jqf/eJSNOchyrvIky7ez1tp/62uj7nQbMJMn6KLvDviQS/tIifzv1zoO
 hH2LR+hkAkMz/sRNQ6TEitjvB4K25t/kE2m5CKG3WIi05hISfxG/xlc6uajUzJe/wjWDV6Kqmypej
 ucrGDrtGIptO4+otuhMdDKAB38wxN91av79bXA9ePU55qJCYfJp/uluCRAAYCJOQ6NrDg3tIMQRji
 LUt2G7j2pAjSoe1u7J3rwyu61gVNpvsXe2HsSsGLvegFV6aZUyNuQ8+04Z6dTlp3EoBpmEtawUDQj
 nttr8dLw==;
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWITH-0072HY-24
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 12:48:48 +0000
Received: by mail-io1-xd33.google.com with SMTP id v26so16910650iox.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2021 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cjG1rGnnXw1UO7M+t4Y8XCCbBrRNVbmoiz4eMaBw6L4=;
 b=u7dxRl4yqyzVm8V89aoRWmd04wY2iLDbbWmDUA4EAaThXmx+l9Rc9wGqXYK/ArIQx8
 1YvUhdP+vxtKdze28DZAOQcWBwggxi44iOO00j76oTfH06RyqRvXjx5kcnIPEpUDuB5i
 414WbOgpBJ6vC+xvwgJVHzKHVHh/bfo1m9fjNG2HaknWWKM5w6xKGBQU48ONYO4xpMZI
 FHUfxcZBy8/G0E2tJdFJuyMEbcBr+kGwSuDrjMVb0fGnH7+EgEPbDlxtDTw/QceWrZBD
 x0mf4R3Qsy7BGCvUnhoFZYgy44KwSOdQPdzbe6IqXeFk955tzonF/m2UAaKmVH8pdgKj
 282A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cjG1rGnnXw1UO7M+t4Y8XCCbBrRNVbmoiz4eMaBw6L4=;
 b=WRZO+FojpFx+Hs5y0ZvG7H/TCwqaavnOFbBtNxZtsQI34Sz4RoPJTsJLIrRvJ8dIe8
 v08M+N6Qo8ZDJdXOq+sphH5czm0Bh1Weigo0CoK6cXLAEq6mIWp5zGVtwZooBe7P+WLv
 KZ8iBPuhIVpweSlqhIM6vpxLT/uvZoZLplF/xr1PhoX4lPL0qfInAte/yj06lqNonMRn
 +oJ8rSknIl81rIIJSK8EgLRUu+qCwYvRzsk1b231g8TaIWgss828+WkxEdWnx2/mirhS
 ObQaNMHHnDWqXAzase0jZYw2m6E70AA/VP8hpBSWOyypjJv/9wEcCNW997VcIOHbGU/B
 3jMA==
X-Gm-Message-State: AOAM531Ori0qn+d7itbzv4d5IiV4IdTxdKBkxvZj3/8yuP/4mm8ylgem
 CEWjejg0DyKqUndfZ3PW/1Dg7L+9gi4=
X-Google-Smtp-Source: ABdhPJzziIi9j7QgsTM9SaGJSoYeN0nLac61O5+NwN3N0amwxuwBEQMM1Zn8j3TLbHu4Km2dFDFacA==
X-Received: by 2002:a05:6638:2254:: with SMTP id
 m20mr12702322jas.115.1618318122608; 
 Tue, 13 Apr 2021 05:48:42 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
 by smtp.gmail.com with ESMTPSA id m8sm3715084ilc.13.2021.04.13.05.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:48:41 -0700 (PDT)
Date: Tue, 13 Apr 2021 08:48:39 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI issues with lpc32xx  Was: UBI issues with 5.11.11
Message-ID: <20210413124839.GA34377@localhost>
References: <20210407190302.GA12280@localhost>
 <20210407202356.GA31407@localhost>
 <20210412022946.GA38534@localhost> <20210412180233.3c7148d0@xps13>
 <20210412180531.GA27730@localhost> <20210413120034.50dbe7d0@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413120034.50dbe7d0@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_054847_144080_F430FF3D 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Miquel,

On Tue 2021-04-13 @ 12:00:34 PM, Miquel Raynal wrote:
> I tried another version of the patch, please tell me if it works
> better for you. If yes, I will have to copy this fix for 4 other
> drivers in the same situation.

Success! Thank you :-)
Your v2 patch works perfectly.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
