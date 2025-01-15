Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A8CC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vy1B+UnIdtnp2sebnZ/aOO3x257U4/H1xgeASImlnEM=; b=4kCmPI58KoCai3
	NZcTQDQkWplE7t0PiHaZxJMk57naFPnFLpstyPhW7Z6ZYrTOGGaj8k44/lqnlT6cadKnme5+BkZ1X
	zt+qvRiH4jXdAMjr0laBG3mfsislLb8mo8z+Nv0yifDSs3MfRoHVMjtPdMG/aSD9TcKzxGxlsnShx
	7N5tAbQvW78G3yqxs1nRSO4tBvF412HyiOkzsvkf8JmiL790ldmXoiduJiwgyRQQCOA2gNZZA00N0
	y/aveC9Cpi+7h7DVUv/g7KE2Nh6yVNSUqwozekpc8kVxtvC7R2fmFiHwlpNKP0Q+CE7I2PMPdgG1z
	FRpcWHBYCumroHQaaj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwt1-0000000AmkI-1PgQ;
	Wed, 15 Jan 2025 06:28:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXws2-0000000AmXd-2hH3
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 06:27:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso1088147766b.3
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2025 22:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736922436; x=1737527236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bdH9utNFE6KJeqwnxFBJA5Qizh+vNGgqoqSH4K14dg=;
        b=cKBQKgG5m+/1WCTdf6AkQLvDoqdSNWoVJR3Vm5m0Vrs/fuyrGVvnOU9KBxS33TI0l3
         Ya1hguuJYGD0Q7aBpx1VhgYgXRdRDYnNqvkhKuGw1N0HQjA1Uq6IXgMbItWDAVtzp8Iq
         Eb9iWur7EGUv/7osLbB6se+dqXcCjlbfiitx9FNVLUddhx0ytZChp74KLaBo4arNeYLL
         N5yySpwGB2ox6IvNh5X3Q1ghvl8hkEY0p0VerG4jc3ZukeRooJfjodSPdJsvwR7IbKbk
         5hTQotyvYOMTj59fD2tAnhnIIi/ZXt6jf/kVGH1QfaO9HUhqXaYvZ0BT/exsfCOguZ9R
         6BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922436; x=1737527236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bdH9utNFE6KJeqwnxFBJA5Qizh+vNGgqoqSH4K14dg=;
        b=ISiFKwDxbpUtAFh0Y2oIcQUtU4lMq3NgvoGDW1ZNDHopY12zq9mSSSxf637Qv4AmDr
         GXNfDlf2z8oODonZqUfVl/e+M8v+YTVcj7Liu1zkHcXtjwyzQq6g8Pjvd1Z30CokgbYb
         j+Q4t1RP61ivKxXKaq+QKIJd1OyxgsTz1+Wn2V0WhcZR0O9LPw5nnmBmUgpOK1K7p+wk
         +nJ+Z/+R0FvYLXDZBwHl7ZZfEq80kvU95fzrkdjSPZz855KW8yEs48PSv0Pbjh992Xy8
         Y1RnFAuqYPxKeGWotzJ4O6CEEElvnU7uJasG8jK6LTFjeUzLbyJrJ5FG62Vth1XE4mP1
         vWng==
X-Forwarded-Encrypted: i=1; AJvYcCULiJ9T5ZFHLQejg7syr9mWqVg2eMm6Jr7RqHcKWqJ3l28VlCBbXutG2JzIIM7oCUJv6kBR4lgbhQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVGHmGVgePtMLjzkWN8TgfFiLZ4v+LXdohJeamGXMh5OgNg/DJ
	9fD1JkCTBQVdU2PipPZUkLJHJWs7haLSu63Xg1VrN5EHzbMX+ZtVT44mY0eN6rs=
X-Gm-Gg: ASbGncvCt24dI9jIeO6GdDLYRYVfd4X11LfmvcurXommd/LiagrIVMVyiJFC4s3CRvL
	dDdY+TrxJhWuR5Be2pIn+goxb9U+Qf7Q9emOlyU81qqMqwE0hzlvVj6R6nVtY3ej0a90FsjAyre
	PT7MhFsV81autVpOK9VoTMTzi0DPX5sgChFJtcsncGcCoTTjNY78wN1KKSo2M/T1TR0H85f1rNC
	N/96pDIX3YB5R0gmnT/bVicjpTbh+ngjtqV9kMG/SsnRP44IRy/HaAeHoxWxrkEUw==
X-Google-Smtp-Source: AGHT+IFA1Yjzod676tgBpT+pdawUDG6xVmkvVZy+3MR/AN2mwfOhAtphEeoSb0u6+N6EFLjRGfjdGA==
X-Received: by 2002:a17:907:728e:b0:aa6:a9fe:46e5 with SMTP id a640c23a62f3a-ab2abde568emr2595107666b.53.1736922435733;
        Tue, 14 Jan 2025 22:27:15 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b06sm722100566b.100.2025.01.14.22.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 22:27:15 -0800 (PST)
Message-ID: <7df1ea9b-5fc3-414a-b0bb-595296537d01@linaro.org>
Date: Wed, 15 Jan 2025 06:27:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, mwalle@kernel.org,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org,
 Cheng Ming Lin <linchengming884@gmail.com>
References: <20241112075242.174010-1-linchengming884@gmail.com>
 <20241112075242.174010-2-linchengming884@gmail.com>
 <3342163.44csPzL39Z@steina-w> <mafs0zfjt5q3n.fsf@kernel.org>
 <87wmexp9lh.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87wmexp9lh.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_222719_648766_CFAECC9B 
X-CRM114-Status: UNSURE (   7.92  )
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



On 1/14/25 5:51 PM, Miquel Raynal wrote:
>> Tudor, Michael, Miquel, what do you think about this? We are at rc7 but
>> I think we should send out a fixes PR with a revert. If you agree, I
>> will send out a patch and a PR.
> Either way I am fine. the -rc cycles are also available for us to

same. You could also temporarily fix nxp driver by tracking RX, this way
having both macronix and nxp happy.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
