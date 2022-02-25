Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F153C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EFDaSmeA7+b4aB2hOUiOoS3+EAYCvVR0yGIYmlaVfzc=; b=CJdKdY37VeZtWwNh+/7Ro764Z8
	xkSiwhWLHbe5t3leg2/Zw9x5eMZ7qVwZwquo8Dkgm1J7+6Ak2xZ63b+5lM/z8K9hAyJSdTmxZobAA
	FFytmgSrHSww7V4VVYS0WhwaGEqc0A9xxeK2e9uZlfGQ0/VrJk1ZWeH1G7hd5LYc1DPOrSl7YFsri
	rdMMbbuKrGRonYkz8zHT9ZiLiAF7RNtG14J7tGoWO39ChPCUDG9ff9wLwWZvsPY1M//b2A9XTQ5ze
	7zWPzs4/M9p4ayfaYLtWW9HmzuIi+SSHtOqwUPsR7TFQniDgJsAjmHDilix2PZl7ldZ+8pjAsNSMm
	//6cETNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbPQ-005MYt-7K; Fri, 25 Feb 2022 14:17:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbPL-005MX3-PP
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 14:17:21 +0000
Received: by mail-lf1-x136.google.com with SMTP id w27so9705680lfa.5
 for <linux-mtd@lists.infradead.org>; Fri, 25 Feb 2022 06:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:from:subject
 :content-transfer-encoding;
 bh=rJ92aLNU9wPv3t6R7fBex7IEFcF5Iz2GGNs181fIDJ8=;
 b=poQKUZ/gwvpRquf/bgVD5PGUouiiRJ7wHBt7eIk8mZmGujIQuzfaUNOQN4zmTDrsga
 xG7qLRGroHpRM2nKdlc1lh5HWBtnhwJCerLLHBL9uutempmmsiMoqubwmZkUZ0bX1OYf
 WvSwEhsf0s9WISG8pqtQyLUjbBYtZciGEsF1qa/++hxvrdgx/hbkkPeOKOGVLd8aqfHd
 E0S9tKq4LgR+RgdQVFZdVCWLDTVUOFqKgT0pZq0HSIUSjMCdYlI5+fPnTOInyriO7n0h
 tlv/r2iolf1D9iXsT1CLc60eQHBoluNQnMDZ05ApVI2YuvWbACg8xL4tfcxTCweA4h81
 Q8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :from:subject:content-transfer-encoding;
 bh=rJ92aLNU9wPv3t6R7fBex7IEFcF5Iz2GGNs181fIDJ8=;
 b=QzXuzVWm4wJ7FJoI7QQVvKheAHPfl0XpUHngWw7OMtSB21gM0Jv4RR41Y9oSFmHF1R
 nMhPf3KidQ1LgWzX6kJF9k7VX4JbhtD/rrun2Jr0fIlZW3J7gL4zT/fC/lnPNNeg1F6o
 eDM+EAU/8LAuoCC7B43JVX1xraViyXTA6qski5nTOLDbmQhX1WfHUjmcTDwUxTuqb3dM
 sFwVypS0EdN+Hiy1gdTNY/6uHTlQCsGny1qkskLYdpcLCKnwOirdytLAP9NIHkKlJIf6
 Z/cwKABNnjpsEOUDTmcVR+vkjBaCaNoROKlVYUoNlkdo6EHR9ed49B2XNKl3W8VjP5pK
 zzJw==
X-Gm-Message-State: AOAM530K9Jg2guY3EP7DXcjhTH1c1/gvzVlpq5kw9C5ZprakSW9JAqoF
 ZxWGD8Mrs7di6D0YCayBGR+RnM315tU=
X-Google-Smtp-Source: ABdhPJy81crmg+fOh13iafRjcyh2INnj6EQtlCHk/JUpjO4RellPVy4Kc7ixCabFvvKXuuYCseBnBg==
X-Received: by 2002:a05:6512:1155:b0:445:8430:57d1 with SMTP id
 m21-20020a056512115500b00445843057d1mr1423721lfg.393.1645798638265; 
 Fri, 25 Feb 2022 06:17:18 -0800 (PST)
Received: from [192.168.26.149] ([194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 j10-20020a056512344a00b004430ccafa60sm213037lfr.253.2022.02.25.06.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 06:17:17 -0800 (PST)
Message-ID: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
Date: Fri, 25 Feb 2022 15:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Cc: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: ubifs: handling dirty data (writing back) + power cuts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_061719_874680_6424678D 
X-CRM114-Status: GOOD (  10.33  )
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


my system is setup as follows:

# mount | grep ubifs
/dev/ubi0_1 on /mount/ubifs type ubifs (rw,noatime,assert=read-only,ubi=0,vol=1)

# cat /proc/sys/vm/dirty_writeback_centisecs
500
# cat /proc/sys/vm/dirty_expire_centisecs
3000

(5 s and 30 s respectively) and I'm currently debugging some data issues
related to power cuts.


My actual problem is related to ubifs behaviour for power cuts happening
between 5 and 35 seconds after saving a file:
date > /mount/ubifs/test.txt && sleep 15 && echo CUT POWER *NOW*

On the next boot test.txt exists but it's EMPTY (file size 0).

For newly created files above behaviour is not the worst one - however
I'd expect such file to not exist at all.

The biggest problem is when dealing with existing files. In such case
power cut means loosing it completely. I don't get *old* content nor
*new* content.


I noticed this behaviour with kernel 5.10 and also reproduced it with
5.4, 4.14 and 4.4.

Is this a bug or some quirky feature? Can I do anything to avoid such
situations except modifying all user space to call fsync() when needed?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
