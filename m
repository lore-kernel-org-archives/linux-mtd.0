Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CDAC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 21:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779DD222C9
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 21:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VyimYkjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779DD222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQhASuhJIBq4Sg9hti0dteYzmyWSpz5zycfg3q1sh4M=; b=VyimYkjRmol9nV
	J16ROapnwLG3iCydJmhGCUA/82vlz7UFZdrP8PV43d0/6FhdFfP+2j+REZg3q/UYfiD19nVH9sFhz
	Bzd5A/b+m9D5+yHzCeBPRXKIsKvyoMZsazQsSsLFyhjfGLW7spWxN1DdA0ESQuJ3CmfUHz29WtU8S
	NRl3fVVrzHdouH1ygezsdKzs/+Yw4NTpHd4Sg9Q8kFYKBtB6zT/AUnR/JEpqVryXpnEKlhWM5BuSo
	jb++2R4moHrowa6HzGmQUZf++jejZ0NaKdLdmL3sf2Q+oxQfgW0oVhmdIky01VTRv3DuGMujor4DV
	JTWMJZ4kyU3JmFgocDog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu2Lk-0000f9-DW; Wed, 13 Feb 2019 21:45:48 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu2Lg-0000eI-GS
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 21:45:45 +0000
Received: by mail-ot1-f66.google.com with SMTP id s5so6973008oth.7
 for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2019 13:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H7YA8SsV+JE3KW+xHVg+h1GsoWrNebHSkR6Ga8KTla8=;
 b=KV9oCnzF51vezCYtdrK6hfeXvd984dEXMnkbDmtSZ66MBUmeBiNPTaFxIyCH1VVAPN
 rYnuGnF7PnPCj2K3cQPNKK4efiWgSxKK+vemORDpYJgK82zGM9ulCE4+USeVRkBa2f2f
 lNr85o76z7fseDkBQYq2z4u+Sr5MDhNTh7KDy0FbUmJoZ3SqLTUYaWPxKyv/eaF5z/go
 7PfpcJUlukyNquRQA2QZdG0hVJP2JQTiXIlJ3TujmfalYE5eQ7gdJylJZfV4EI4EYgT3
 D9gZ//0RuQevJfwxFk88+34NpuDDPnry/0Nq29N4vBzL7h4O9eHIMU95UZdVnTs9XFyc
 9GwA==
X-Gm-Message-State: AHQUAuYF2SPRKSBE9y4i5XSsh1ahuc+LWdex0RMIp8+V3LCAo8uixq3W
 uuIOWcwzOm5cWcHmP7s08Q==
X-Google-Smtp-Source: AHgI3IbSfKujagTw6XadtsrYjRPx+duyQndJTOAOaHb2JbhgstkhIaUiUUVXQxgw1cyNdt6XSYZOtg==
X-Received: by 2002:a9d:6195:: with SMTP id g21mr214946otk.76.1550094343744;
 Wed, 13 Feb 2019 13:45:43 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a68sm226871oih.28.2019.02.13.13.45.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Feb 2019 13:45:42 -0800 (PST)
Date: Wed, 13 Feb 2019 15:45:42 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
Message-ID: <20190213214542.GA2102@bogus>
References: <20190209192305.4434-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190209192305.4434-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_134544_551118_FEE56DD4 
X-CRM114-Status: GOOD (  16.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marek.vasut@gmail.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  9 Feb 2019 16:22:57 -0300, Paul Cercueil wrote:
> Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
> from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: - Change 'ingenic,jz4725b-nand' compatible string to
>       'ingenic,jz4740-nand' to reflect driver change
>     - Add 'ingenic,jz4740-bch' compatible string
>     - Document 'ingenic,oob-layout' property
> 
> v3: - Removed 'ingenic,oob-layout' property
>     - Update compatible strings to what the driver supports
> 
> v4: No change
> 
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
