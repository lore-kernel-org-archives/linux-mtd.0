Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6A8C83F2D
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Sep 2023 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cFkOOTMkA03jcjt/TKZu5ZMngVTva3Kz0JfFuPJs4Y=; b=c4vG5tkG7Uxalk
	eW1lLAjHXPjgETFtJvGOMZgCvXpQYDRHV7CUjcpn/my1nuhFIaZUnqeZOw7gluG1kb4BE2hmQwtiH
	L41/qduAJmFSlQwI1ElJok/MkbKHum7YhmhakWP/X2jJXbcwA6AkU+HZ3Z7+7Kisbr5izUcewli1y
	fTDMpFX8hVg/Mgs7A5+TMg8JeBZI7LbsNwkMj4PKBy09qc8b1LBiET3NFso7vqQ2ZkotgEH8q3AyI
	Pi0jYccMYSrEJltAMpTxAWo5H1q1KW2mKWzCGCfmpArBPxo4H8B/89kLWLVRBRJDXVE7l3Q7CRD9T
	RjuIUfl7carnohtcn1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcqcu-002kDY-0G;
	Sun, 03 Sep 2023 17:11:08 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcqcq-002kDD-0N
	for linux-mtd@lists.infradead.org;
	Sun, 03 Sep 2023 17:11:05 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3c8adb27so117448966b.1
        for <linux-mtd@lists.infradead.org>; Sun, 03 Sep 2023 10:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693761062; x=1694365862; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MaJOEVNOlbi7frFT5+gMv19F3TfpMzKX+hhM1T9BpOI=;
        b=efnzB1meC25PTWL10exi1xYXJxvDp3zjgt9y2LqNbXTCGQ993bBp50pdMZMbbd4K+w
         u2cffII6z8Ies+e0CgiuSb/Wd2jWqeiMTpQfNaq0Eg9GSmpJ85/SPcxkg5UgsTsxuObz
         Biq03oSvbzo0xa3pZ2QXuCroFe4dsfQMx8X1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693761062; x=1694365862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaJOEVNOlbi7frFT5+gMv19F3TfpMzKX+hhM1T9BpOI=;
        b=GKLORFKRZ/vrKjIzIQPn5tvTORsekbWxSQ1fK5FnKhbThXoW27E4Ro00ldjrRqbtfc
         d+/1xCHTLLFQEfKG6e2raJXu3/4oYp33DiCxT1he5SV3VO2Od0hKhDHPlFugVJIhW7QA
         MQ43W2/To5NHJMK6wa2y4BMarAIp2yH0qZkqxauWpfMe8TffH60EkAZeNIx0klUZiajk
         XAo6HSux47QXrKCWxpsToyKt+2mt3HBQJvQElEqmLcWd5JJ3qeCHVBAtsXSxJYXQ7dP7
         9xrXmnVnm2Pkh3u8KD60E3gc6jn0BqJphJkjLozc83Twdz//lItubfLi2Fu6hup8mAMn
         uZsw==
X-Gm-Message-State: AOJu0Yyes4P1HwxET5whHdpbTiDlM/Bc2SebYlGZv9AdXxBONAOZwbZo
	cPXnyFO4Rr6S3VscswoFq24hZ8iSpm4WIyUAed8NbR4h
X-Google-Smtp-Source: AGHT+IE8gDKNI33SXYNql+RoqaKCPtulewXZAIgTOk06NO9eXDkPfHUDcSmXRUKoQJ6raTTcpOc54Q==
X-Received: by 2002:a17:906:30d4:b0:991:37d2:c9f0 with SMTP id b20-20020a17090630d400b0099137d2c9f0mr6482661ejb.68.1693761062190;
        Sun, 03 Sep 2023 10:11:02 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170907984300b00992b2c55c67sm4982925ejc.156.2023.09.03.10.11.00
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 10:11:00 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99bed101b70so116665166b.3
        for <linux-mtd@lists.infradead.org>; Sun, 03 Sep 2023 10:11:00 -0700 (PDT)
X-Received: by 2002:a17:906:301b:b0:9a1:ec69:23ec with SMTP id
 27-20020a170906301b00b009a1ec6923ecmr6805520ejz.17.1693761060082; Sun, 03 Sep
 2023 10:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230901184136.73b2833e@xps-13> <CAHk-=wgUntc0u-6WQ9U3OmNHTqB=cZQoWcTOXaipB+gixV5NPA@mail.gmail.com>
In-Reply-To: <CAHk-=wgUntc0u-6WQ9U3OmNHTqB=cZQoWcTOXaipB+gixV5NPA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 3 Sep 2023 10:10:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDaQos9fWrmGewWg_ECPNSKXDy+155T+YpjpzO+P0B2A@mail.gmail.com>
Message-ID: <CAHk-=wgDaQos9fWrmGewWg_ECPNSKXDy+155T+YpjpzO+P0B2A@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for v6.6-rc1
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_101104_260235_6ADEEAA4 
X-CRM114-Status: GOOD (  10.23  )
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

On Sat, 2 Sept 2023 at 11:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So I pulled this, looked at the "summary" in the fag, and decided that
> it's just not worth it, and unpulled it.

Bah. I came back to this, and tried to make a summary of my own.

I might have missed something worth noting, but at least it's now more
of an actual overview than a listing of details.

            Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
