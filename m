Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4E5C55189
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 09:34:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8572076B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 09:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xk+g5Yw8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8572076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+Zrxh0Mvd4PxHold4zPmKMzyNfxDWUupQz5ftWAGOA=; b=Xk+g5Yw82SYu6s
	GnDi36XP319mn7D7yuBJHRx5u9etN30jYTEry7s8DRil1udwCGaQSEzTRNxdDhAtXdyyrh8wlipxy
	YYBK+nRlmyG1G0nquC/q2PXTFC2bwmezU2GEsKTlSyC5OgRWDllb6rHOn+iAmxCI1xa1ttmrg4qjm
	15eyG6EDDOTOhfSSlpHotkGp3l9BylYvdM5IPh89OIzTeYqL2lQbUGIyhOYGFoBxRKwQAfz6zoqFB
	V9MGE7+v67ZQlhghNAd1lSpPsqr3jSXBU4useOh12QCSOI/O1TZclghR/lwjEv2+a8CYhF00j+3AC
	dVFZZSCdQIDiKHD6lMqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRBlP-0006E1-Gs; Wed, 22 Apr 2020 09:33:51 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRBlM-0006DV-NJ
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 09:33:50 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8FDBD200013;
 Wed, 22 Apr 2020 09:33:42 +0000 (UTC)
Date: Wed, 22 Apr 2020 11:33:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 7/8] mtd: rawnand: jedec: Use an intermediate variable
 to decomplefixy conditions
Message-ID: <20200422113341.2e3d4611@xps13>
In-Reply-To: <48d1d11f-2271-0ece-e433-0dd2770502c7@cogentembedded.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-8-miquel.raynal@bootlin.com>
 <48d1d11f-2271-0ece-e433-0dd2770502c7@cogentembedded.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_023348_893906_B847F727 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei,

Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> wrote on Wed, 22
Apr 2020 11:49:14 +0300:

> Hello!
> 
> On 21.04.2020 19:46, Miquel Raynal wrote:
> 
> > Before reworking a little bit the JEDEC detection code, let's
> > decomplefixy an if statement.  
> 
>     Decomplexify, maybe? :-)

Oops :)

> 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> [...]
> 
> MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
