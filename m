Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED7DC282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 23:10:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492F72184B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 23:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMTHYcOO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tj/mjyUv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492F72184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpbJ0i7weJoId7TdQXkwI79v6GVg0qgOhNgoYjLwvgM=; b=gMTHYcOOyntyHD
	C3iC5NWl431+/cR9F8T+pSk1eILx/LXx2TnetUxo0Sp7Hgtjxt55U8bc2DX2CCKb+p7l7wJwdHZ4+
	rj7yXvirwwEWnVuM6BEAZ7EbYjfGs83TX1b8QWk5cLpkrz8XtK3oG5vU74AshsZ6L4oHAjJSBGkGY
	dTAOYbwTS4MPXyjbWnDkOiSshJRjqRow+vdyqHqCqMJB6cQJVFm12FGhvEDISdOeKt+58YNGF48q6
	qAbXAMt5FlFqzwLtGuMFwc5SASBDxYhbDEMvOPw0dXpsv3RCIdA63TWbQ9qLTamvjeKCAQQNHdn5T
	T7W9u65h1hT5cOlIjHiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGtgz-0005uF-Op; Wed, 17 Apr 2019 23:10:13 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGtgr-0004xW-As; Wed, 17 Apr 2019 23:10:06 +0000
Received: by mail-lf1-x144.google.com with SMTP id d12so82689lfk.6;
 Wed, 17 Apr 2019 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6w3zue5X4ss1i9XwPCmZZh7K7NlmRcPYFqdH4lUvRc=;
 b=Tj/mjyUvr9jfgRhCZlNJeeMYEB1aUyvlVjPHhoz9McyDdZtgvf2qptNn5di/2+2AHl
 0CXBQNPXXi3qSva7yTWVY1xfk8s80IXeRa5LtwPrkJAuMNNuDXwRmPND/uqVP/MYFKAI
 DIqsSAufmpNegYC5kjWL66orfVPyzWFIJbEIfxH9PvS2PxDjVYLHHD/gVf7NJt+1KXXN
 xADds/mWJOnKvwbdWYV7wy41V9sI6OWRKXHvWcVKDWSeJU1NDw15ORTkTjG7CDsixmK/
 OFNYvBzEB14ueKxkuCgkGjI+KdLOGpLF3ihkEvcJLbkybzuUlARn+wQ3SHfqqq2Zg/4t
 pBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6w3zue5X4ss1i9XwPCmZZh7K7NlmRcPYFqdH4lUvRc=;
 b=oeAm3Qv+y5g+ZxhJnS+nnMc+D4XiJZTrtGs54qy4jk3kTlZs/QDWx6qCLJcXP+jX2u
 W1NyqMfNV1/WWCN10le0SQiAl2EdkwXK0Y2RweG04gpHLD+kYMdwj/fDN53l5yqQQt6s
 lh0v7uwy+lwPq6AgFtXmQvm6nfjz5zZfNcLc6hRacyVDlGTKIotYza44tAwvRoUetJxw
 THxV1A9aU2kQEsjYkk3UngXB45FqWtlh2ipMz6dpbj8JRwVXIgYz9siRY22l0iL8vX7Z
 2TibhMWSTZ7AsREEbj8bTPRy+R77gSU3NIJ9riUiMaoVdohD3nM3eOfLIFnVYOOL/vLe
 XBDg==
X-Gm-Message-State: APjAAAXnCPVq9aLNEQqMMxwmEbrI+5t2qd6UW5Q0ugeCjQ1GInRopG3c
 gV5Zo7DMixpTCPw8/2nZWNI=
X-Google-Smtp-Source: APXvYqzHnumzJ7s9XZ5BTvVY1IhFTlq5xEJOTTPGBVeSqYaZ2kg+b/ehcVg+QqfJfG3vVG/muZjv1A==
X-Received: by 2002:ac2:54a9:: with SMTP id w9mr28612306lfk.125.1555542603114; 
 Wed, 17 Apr 2019 16:10:03 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl.
 [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id x2sm59290lfg.59.2019.04.17.16.10.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 16:10:01 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2] mtd: rawnand: ams-delta: Drop board specific partition
 info
Date: Thu, 18 Apr 2019 01:09:59 +0200
Message-ID: <3638685.4RdFRBT8kZ@z50>
In-Reply-To: <20190417114010.774693cf@xps13>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190324223344.24590-1-jmkrzyszt@gmail.com> <20190417114010.774693cf@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_161005_404924_50DA867F 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: linux-omap@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Aaro, Tony,

On Wednesday, April 17, 2019 11:40:10 AM CEST Miquel Raynal wrote:
> Hi Janusz,
> =

> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Sun, 24 Mar 2019
> 23:33:44 +0100:
> =

> > After recent modifications, only a hardcoded partition info makes
> > the driver device specific.  Other than that, the driver uses GPIO
> > exclusively and can be used on any hardware.
> > =

> > Drop the partition info and use MTD partition parser with default list
> > of parser names instead.  For the OF parser to work correctly, pass
> > device of_node to mtd.
> > =

> > Amstrad Delta users should append the following partition info to their
> > kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> > =

> > mtdparts=3Dams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params=
),\
> > 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).
> > =

> > For their convenience, CONFIG_MTD_CMDLINE_PARTS symbol is selected
> > automatically from that board Kconfig if this NAND driver is also
> > selected.
> > =

> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > ---
> =

> FYI I am okay with the change but I am waiting for acks before applying
> it.

May we have an ack from you?

If still not convinced with my clarifications, I can add a comment to help =
text =

in Kconfig, either squashed or in a follow up patch, on the requirement of =

appending mtdparts parameter to command line.  What do you think?

Thanks,
Janusz

> =

> Thanks,
> Miqu=E8l
> =






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
