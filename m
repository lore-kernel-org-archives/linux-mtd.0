Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7379C00144
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 23:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbKI36PxczIUswDvSuBwgvV+wPKg6agrOxTONJO9E2s=; b=wL90MCzUIhqDTP
	b52H/2soPgEECH9bp7Ga0OhTZ3IKhrljHpUIhG+lwWEh69XsafkAJd9RocoyRl28IEaR8MMcRWkrB
	eIeST04t+uQJEhGCa1fR/f4XokmMvrWO3H4X6biO6bE9eD/pyExcyZpp7l1neuthJ1vlSI6eei/PP
	MhQEViGHpIVZeAoMGyKvJxxe93O4CsxL5wNom939yGrn5ArlKyTdR9rBmphCGa4CuV4LTPjpq58Sc
	F66E0U15mkTk6+rRYWKysHXJqJ3imWWOn91e2LjVU8BsO7wj2TlLlYBQg1NhfuKldAayT2DIgS2s2
	+t6dyLA7rPE8bKWZbb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGUBk-005zBE-K9; Tue, 26 Jul 2022 23:42:08 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGUBf-005z7C-34
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 23:42:05 +0000
Received: by mail-pg1-x535.google.com with SMTP id s206so14473461pgs.3
        for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2022 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dGH3qFzh7142lQz4z3uuh5FEAq1YCKuXhD8gTq8Wv9o=;
        b=jw77WZsx/pqONraLzY7S7Om30Dy23eEzwf3gwh67jG+4Bt8oewkXkZfewyUyDbSux/
         78NMnQFG0g7o1IfO/GBs3yyFgojB6rMDFnxInnTLJN56ZvKbZFWHVAm1j5T1J0fJ5dnb
         oZT25bEUTj08EwEg/9vk0CXnqbPoZGTIOjx3whGKvUiKiJEjCuQaL+gv9sCCa7WLLmyU
         13Ggu4CXecU/6QwKB203FGwa7ZyIo9Pux72qickqTrv84jkgMe9SLr20quD6ts9anRss
         uaHCeYcVZHlA5ZK8ICkQrCYr2Orw/F9YpMa2NXpNSPzAT8STPqs8fYYy/okcpop9bsge
         Potg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dGH3qFzh7142lQz4z3uuh5FEAq1YCKuXhD8gTq8Wv9o=;
        b=t0KyoCP/K+N7tCKkIKnQ+nQQC6w0Qx8gbVguB5p0NZFS6v2u/YnnIHSpNtn7hp3d8P
         ANopBXYN8WPpY54lAxCdQYjD+PGP2+E45QFsPIlibvRjys4w3J2fCceVLtzRS14/0+Mi
         jtAGIMyYIPYf78IhfrVY4gk4f1mKiJ/Ocjwp3aNkj1f2Dmz4HgujgukBG7yu2J/rypRA
         aRdXjt6qT97M2U8+RAJOouE0CCpQmyDL8j+2J2RtK9oBFH+a8OFgK18tJALOnLXp4ruv
         i7Gx5HzrT2UlPqyIpd0DNwJ4G6+yaEabrLRifxBH9CliQGBKKXPYD2xHo6w7pR7ssf6s
         ov2w==
X-Gm-Message-State: AJIora/vm4GKKaZeA41m+Ht4I1Pe69YfLFOZVdcJGC1ZeKeuUt0jGIwJ
	l+g/mp9dsByFNE4SI3faHnY=
X-Google-Smtp-Source: AGRyM1stuefJK9kAz9r4wv0P8V9jheLIWcFpwYHQv/iGNJjcOQrHNDFP9DPBxROXTQrW+z/8MMxYwA==
X-Received: by 2002:a63:8bc8:0:b0:413:9952:6059 with SMTP id j191-20020a638bc8000000b0041399526059mr16255399pge.61.1658878922294;
        Tue, 26 Jul 2022 16:42:02 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id gj13-20020a17090b108d00b001f2ef2f9c6fsm129676pjb.56.2022.07.26.16.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 16:42:01 -0700 (PDT)
Message-ID: <9380720a-a5b5-b2d9-757e-7b5b604310d0@gmail.com>
Date: Wed, 27 Jul 2022 08:41:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] mtd: spi-nor: move function declaration out of sfdp.h
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220513133520.3945820-1-michael@walle.cc>
 <20220513133520.3945820-5-michael@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220513133520.3945820-5-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_164203_183636_1E5C6F59 
X-CRM114-Status: UNSURE (   7.44  )
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

On 5/13/2022 10:35 PM, Michael Walle wrote:
> sfdp.h should only contain constants related to the JEDEC SFDP
> specification(s).
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

I think sfdp.h can contain declaration for a function implemented in sfdp.c,
but not a strong preference.

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
