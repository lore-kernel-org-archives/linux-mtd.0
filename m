Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0089C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 19:26:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A1E2083B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 19:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/y85pxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84A1E2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msXSsoeV+K7BniXC8rvky2ANEeZeVVkDoEn27Pt6GVM=; b=c/y85pxBvUxnYP
	cg+Sn+tNAEvs8rySyKX6+5Rw8i7KLGTPpZQwUhM2W6rFCEimVmXNrVBa4Q6VtcYAtNyM5kHORQWFb
	CZGzTd0siPliX0a38X4lqe9FpR7ojtojcYhvDpCNHLAhb6NKCp/opUTiH77iwazJXi0YSWUdcP6jt
	hvxBFjzASLsh0d5q9HfUsTYEhk/hIk49xiQC5zC1SnfL3wrUmy7RLqeEeWMY8GclPMue0BZG7+Kal
	SL60PQca8bRrDn+tkujm7HPH5XjBqhw1DxyrlcwJsvXc8vt7OaeL+IOC6imj7VzEnNGlLRgCUdE/D
	MJCptNXjAxM/2T8xitlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKSSN-0005lI-KN; Tue, 15 Oct 2019 19:26:07 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKSSK-0005kq-JM; Tue, 15 Oct 2019 19:26:05 +0000
Received: by mail-ot1-f67.google.com with SMTP id y39so17971051ota.7;
 Tue, 15 Oct 2019 12:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bMN7HsXxW10Z/AXt6bsUTKC+n3cllPgUCAnFiYh55f4=;
 b=mMvonymWHPvVOIg9nzD8cqa+Y4ZTB9cxNZmMBTV6x4uxK7l/h3QCSSV8YIJBKn06tR
 RDUkMSvBy06VNxMvWB6CGt5w5fp43kvBj2Y1W1JNft4nAqU/yZVNLxeon9P8QKIrFo5h
 URYTzLU1cqMv3NkGfJJKkrJXsZPQz1xEI5ZKmvAmAQY/KV1dYquVbpl1DunyVXo+NsHd
 jcnUEJHZ1nQJY1OQw7Fxz6/g21ATLAPmItU8r8xVYA6u1zqdlARDrLCMn+nrZHrodZmZ
 pzRpvAQ0+86TtPzxAnNoWEmB5fxsSY0RY5DoCbrx6UWkQfjCLwE3W8qIYjY/gTuL9n3P
 Fh1w==
X-Gm-Message-State: APjAAAUHV0PpYf39XByDSthyaV9KGo0GUIte8rPQJUP9pBbuU9LzyrJz
 9mEvgOl1Vo1IvvGDee2j6A==
X-Google-Smtp-Source: APXvYqwlp5+8r2qKOXYzE3/Ug0686nB0PMhOBNsopPiUJRsFnUZMpsYTSVwqINAlrTQju3xmJY1Q9g==
X-Received: by 2002:a9d:66c5:: with SMTP id t5mr30074981otm.225.1571167563870; 
 Tue, 15 Oct 2019 12:26:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i2sm7329212otf.19.2019.10.15.12.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 12:26:02 -0700 (PDT)
Date: Tue, 15 Oct 2019 14:26:02 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 11/16] dt-bindings: mtd: aspeed-smc: Add new comptatible
 for  AST2600
Message-ID: <20191015192602.GA2299@bogus>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-12-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004115919.20788-12-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_122604_636150_F927E256 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri,  4 Oct 2019 13:59:14 +0200, =3D?UTF-8?q?C=3DC3=3DA9dric=3D20Le=3D20=
Goater?=3D wrote:
> The SMC controllers on the AST2600 SoC are very similar to the the
> AST2500. The SoC has one Firmware Memory Controller and two SPI flash
> memory controllers.
> =

> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  Documentation/devicetree/bindings/mtd/aspeed-smc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
