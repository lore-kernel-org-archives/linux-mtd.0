Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F8CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5Ep7UFXcXnhQpYZbeYu1KRTgX1h2LBaSBJgTyWXnpk=; b=S/0sQcl8dnFmlS
	3fDHDZaoY2fpuuGth1E8PQYbOMEPOPrKr9kFyu9pZaNDlLXWXxAXbPytp0nwxNGR4BLNIRQyhNyPf
	Mb1GSLJLQ4jzFY4H7puCQ4djEB0vyNYFd1DtoAKO0uMeIDHZuG1Mye17uiYQfw9YfUOiEMxbrSOcF
	2gZO4eOM86Lub9hEguNPhqAvhbT3rnUZ+9fKjTaCbsE6oZi3592Os6lGxTcDNbKm4F6Kzf0OzkM4e
	iB56zmx7xbv8h1TL2AOvgi3dKbTLiUq7dJsS93b4JmxeDgoF/H6ECLPE9KKqJYE970XJID6w+ZN0f
	gyBEFSIW+Eo+PtwwTs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlXL0-001QdS-UD; Mon, 02 May 2022 14:47:46 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlXKt-001Qc4-Lr
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 14:47:45 +0000
Received: by mail-qt1-f175.google.com with SMTP id h3so6618921qtn.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 07:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bBfiiwYo4Xq/ApeCnkPpBPWFOXt+GLuICqGMpoEEEU=;
 b=L3cfR5Q/05G9a5BMilRIC6lwQhK46P9D9EuwSQTgAMxRmIKObnKZ1LPMFv2BrD0Li2
 AEcgJ63Qg64l10eFG2qQJYr3QRLt/riEJ+2u/dpgEqIvD55WDCYIGme0gV9vh8/MD+cY
 DssjjZv/ZQt9Vfy63qO4l2JRLF5LR1GhMy7csTAlMYGWI+Vvd28fUib3KRKVkrfSsnt9
 NKJKRVrxx8VHMiB0oCsAinwNwVLAPvmE+gc4YRz1ZMnnnBfekwP+G2FRuRcP66hkMT/g
 RfkZUw2+FmpNB4c4gFybtCM1YfE5dulc44tQo4sOngXiLy8J0U2xyf855Ef8Ccqb1lVZ
 zuKw==
X-Gm-Message-State: AOAM531QuGAnS6VHURlBFz7/r83hjJQNyr4qvq/0D1ngP+apQ5CpReGu
 zXNHysU9f9AF8p316B8VQMLxvpDMTLd1eg==
X-Google-Smtp-Source: ABdhPJyD8FvPtx+NHJPSMARABd3NoDokRdehK18yfOrgCnJhwV3ryeNMSQWBYwW+DGOzOzWqwdkR8A==
X-Received: by 2002:a05:622a:d5:b0:2f3:a3a5:ca7a with SMTP id
 p21-20020a05622a00d500b002f3a3a5ca7amr5199895qtw.560.1651502857260; 
 Mon, 02 May 2022 07:47:37 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05620a04e900b0069fc13ce20bsm4397236qkh.60.2022.05.02.07.47.36
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 07:47:36 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g28so26391756ybj.10
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 07:47:36 -0700 (PDT)
X-Received: by 2002:a5b:482:0:b0:646:b85:ad4a with SMTP id
 n2-20020a5b0482000000b006460b85ad4amr9954943ybp.89.1651502856331; 
 Mon, 02 May 2022 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
 <20220429105229.368728-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220429105229.368728-3-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 May 2022 16:47:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxkH2nHxxiKeNu3Uo_0_fDtyXbYuwcc+QWaLh-nN_y2w@mail.gmail.com>
Message-ID: <CAMuHMdUxkH2nHxxiKeNu3Uo_0_fDtyXbYuwcc+QWaLh-nN_y2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r9a06g032: Fix the NAND controller node
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
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_074742_097403_D71A2041 
X-CRM114-Status: GOOD (  17.19  )
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
> Add the missing power-domains property which is mandatory.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

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
