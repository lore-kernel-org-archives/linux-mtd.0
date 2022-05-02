Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE17C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGn5R6M2lR4J2l90zl3JK3XCQ+kHnwdwRReF37XXl9U=; b=ikY6FjgFD1QxD+
	E3vBZ0VBPbDBug6gEn9eYMMyAQZ/UcK39AaNdRp784wLlR3amPlp5jJD6hoqjDJVrrliVuiNRztNP
	m7JNVu3cgsxvnW0+z0RNfnx3kRIMKoH++8nFNPc7Lhy3tUtKDTX6ylLE5+HryjqRB7crsO1B6hmgz
	JwcbAa5NbPVqWGB2c7eXPONn7wxrMu1LR9oNzjKv9yBQdJTbgcVPwuIwk9yLKabNWNYWWFQ9NLsBB
	2aACizsJInE9c9fX7D2htB9iU7MNgSKnCzfxgu6qBz8+3k1veTH1Ct8T+jmPw9rzvLrTi7Y4uniL0
	T29QQ1t8b1qtajMRaXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlXKY-001QaO-5i; Mon, 02 May 2022 14:47:18 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlXKR-001QYY-F6
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 14:47:16 +0000
Received: by mail-qt1-f170.google.com with SMTP id t11so11201465qto.11
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 07:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0HUcSw8jego8R/dUhSvUXBNvHBL51wNAgnKctgcWREg=;
 b=ZHYKjv4rw7iRSy1X4BXeE4tlsxPMAYpnw3qPY5zbI9UoIoMEAfwgyF+t7VbWOCgUpz
 QVlOC83h4SKZnOzeK5c1Z3bTc7ThFTlhHj1fqrv3Jt7De5y02hcP9n+ERQV8vcoFLIut
 CRlVLH/YsWGp265/AVBw78qJDDMvuRE3MZ2nvT5XOgm2rzxOTeAimjZNDh5/9+0/4gmF
 IXiJYIS6F0xgxQj8dsWwzOfHTjhD32jpYppqEF579XZ5hV+mngfrfQsK4dFaIgGvSAH6
 bZ9D5kwHduhYdL2InuvAmHXSByYg/Xq21bQJzDjxlj6wX1V9LzDjQrvAdDS+vKAjz3LH
 s5EA==
X-Gm-Message-State: AOAM530NvgglKw32MpmsUuCPfbf1wRWlP5KeuFPUfNKM3RKtupRR1dsj
 8NXL5Z7F72ebCcL1Iuys6WVf46Cpj0OiDw==
X-Google-Smtp-Source: ABdhPJx2zVQAiHdhE6Oix6xrtoF1Lsm/2AEWgTooGNb40drgnKhjaBZQoV7z8Ztg5Puapl2uC2JRyg==
X-Received: by 2002:ac8:58cc:0:b0:2f3:944b:9b01 with SMTP id
 u12-20020ac858cc000000b002f3944b9b01mr10530844qta.581.1651502828186; 
 Mon, 02 May 2022 07:47:08 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 d137-20020a37688f000000b0069fc13ce223sm4590639qkc.84.2022.05.02.07.47.07
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 07:47:07 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2f7c424c66cso150599537b3.1
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 07:47:07 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:2f8:b75e:1e1a with SMTP id
 z130-20020a816588000000b002f8b75e1e1amr11689177ywb.358.1651502827327; Mon, 02
 May 2022 07:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
 <20220429105229.368728-2-miquel.raynal@bootlin.com>
In-Reply-To: <20220429105229.368728-2-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 May 2022 16:46:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWLy-RUoJG2pcoFqwds_f6HZWrwro17hUEE-3q_5fdGA@mail.gmail.com>
Message-ID: <CAMuHMdWWLy-RUoJG2pcoFqwds_f6HZWrwro17hUEE-3q_5fdGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: renesas: Fix the NAND controller
 description
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_074711_538978_7C830DCE 
X-CRM114-Status: GOOD (  17.45  )
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

On Fri, Apr 29, 2022 at 12:52 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Add the missing power-domain property which is needed on all the
> RZ/N1 SoC IPs.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
