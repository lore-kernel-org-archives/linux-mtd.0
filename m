Return-Path: <SRS0=vhf6=CV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9218C43461
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2020 19:16:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAC2207C3
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2020 19:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ws0AKxN2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HamHtK5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AAC2207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6qAnufbpIpWtO0bHFCWzez/O18g72XOnv/OulxAi1Ws=; b=ws0AKxN2WMf6lNbzZquXCuw/S
	yi/Mbkpe8D6wPG7X5AG7+3U1ZpOJGyWys0jFKee1MfdrVepJBOQvaByt+GbuUkAeKvUaJNpjP0QS2
	rypzbWhEoStsPQBjiZaF14Z4wtd2s8KfsX6rrtY/D2c+pZ+INCyssnHjBV0csuBotYRBR3PoBS255
	ysNIcHTAIQ25cFAZ32W+5r4GkpU+BYVz7zbqYVQwwEFz+yxI6WDKhEKUDPHxL41UEunL4SQaUxl9j
	qwfg6z76e73hMyS7xAfHbgRinACvKydRdE5UQxDQc59JtbpXsMNRcIwJpe/IHxMrUMn3Y9VfSyM9T
	SdCsVWzVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHAzj-0005kb-IN; Sat, 12 Sep 2020 19:15:31 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHAzc-0005k0-H0
 for linux-mtd@lists.infradead.org; Sat, 12 Sep 2020 19:15:25 +0000
Received: by mail-lf1-x142.google.com with SMTP id d15so9234523lfq.11
 for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2020 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8yHCv0b0fW6rDM8DUybqp+cwZoFFFMMJ3RL1iOztMpQ=;
 b=HamHtK5ej0QuEuzVWZJ17zCu8KJwvIc16Pls/FksaWh4SPWwVNVMm+uOHeIJFkBaZv
 P6zPYKRwbzMSYCRUyteC1RHn142iLVjbplOaMMtdF8SNgi4O+77QJwLHEvIUFE2juezi
 ML5CdwNFECA1gBneLkRc7/yJI+U6AtNCXrvCs341HCsIM073bMK/4isJfaM0Jk9pgdXw
 WOHUDrTn9n+hhbPXSv9KBA1HvPEuPLFOIf8EEdXzCwksovctLqwPCkOMJ4hb2gzvmmFR
 pOI09Y9XDihncg5fgHsE6bSGjntkKltmIxAjuPF2p/4m93rMpED3iQbOEYhQDb1/l7t4
 4o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8yHCv0b0fW6rDM8DUybqp+cwZoFFFMMJ3RL1iOztMpQ=;
 b=Q3FmSQsHc+KthLRa00oKuRvpwZm+PVse5wA0bhs6SCne2j4Sm5Ayk548CCHGa1z8hJ
 DJzF2N657rJfvfKH2wYAaFb0hysrTa48ji7KqqMEb/zD5/rsIien+JWpmw4nxLwukEw/
 c5jFbt3tx3dYxqzOZFKKCE6Eg7Vi1tC+LN3drkNV2M9lX0JYsTP140DtWoIm58WlqRGC
 7sOq6rdjYmIHPJVo3+QdbpKMUA4H2JgD4tE7YcltPjXV2XgqBFxFgTd1I+1wGhGsgGHu
 XjymYbHwKdILMwom+3/190TVgQViauKBN+dhXm2/8G9qXp3yXql4rljDMK0Gmq0gf1UX
 nWQQ==
X-Gm-Message-State: AOAM531yFk/RX5/NBBfHeYYW39R7IyA9OmIiyY/RA0EmuzzsR3GVCEY7
 IxqiA3MLMruSpW4qcQc1Bn8=
X-Google-Smtp-Source: ABdhPJwjJKT7+mR0mjsp8GgEEywR9RF/e+OtUgWORLZMMKd/WCfdvHeCElFCjMJhQyTv2S02MfqNhA==
X-Received: by 2002:a19:8316:: with SMTP id f22mr2183552lfd.239.1599938121031; 
 Sat, 12 Sep 2020 12:15:21 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4d6:7ed6:3459:448c:c62e:5144])
 by smtp.gmail.com with ESMTPSA id n4sm1309993lfe.246.2020.09.12.12.15.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Sep 2020 12:15:20 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
Organization: Brain-dead Software
Message-ID: <6018716a-bd95-867a-df99-c9c543a19f5a@gmail.com>
Date: Sat, 12 Sep 2020 22:15:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_151524_592604_7152432B 
X-CRM114-Status: GOOD (  17.44  )
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
Cc: Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 05/13/2020 11:43 PM, Sergei Shtylyov wrote:

> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
> driver using the "back end" APIs in the main driver to talk to the real
> hardware.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'mtd/next' branch of the MTD 'linux.git' repo.
> Requires  the RPC-IF main driver patch in order to build/work:
> 
> [1] https://patchwork.kernel.org/patch/11283127/

   That patch has hit Linus' repo in the 5.8 timeframe, so it's high time
that this driver is merged as well. 

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
