Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173CEC624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KE39CwzMLwjnRI7FGFYzfjURHwFdB84NfSJvkjT4NXs=; b=aGczjCRr7xtG2p
	5HMqrIJ7diAg+udS6P38aY7oweEI4N4zeWjvLcHRZr3sScXGT9Ix5dZLufCgN5rMgl47P9igoAkdN
	6DCjxF+g/PjVF7QEa+vCgOd+B2U7FWdtLvke/d+L9zVbNUL8HGLGLrm61Hx96LdGHJd3aLvr2FKVq
	1w9VxFq43XzMvP7ngw4AGTmcego2QHz7VSrmJAeJBQ2t1XsomtpnF6O4UWgVZt1n+4UTj139rjV2e
	kmNQlvdtcdqJ2Lhjg3kq9+iwmXbkAIDlyX4Q3ricyMkvcWkKSBzAdMroEGcU7BhQFk2IrRnppRas6
	5CKvWp5+/UypcROz6jNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9m-00000002FsL-01v2;
	Fri, 04 Sep 2026 13:40:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9l-00000002FrP-2797
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 13:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D06406A2;
	Fri,  4 Sep 2026 13:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB291F00A3D;
	Fri,  4 Sep 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529237;
	bh=xTPV7lTpc7c2c1AVQyRzJ8VBjOgJlpzZPhcxPzeE5iU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ijU2MkHxl8Hr0e4IPPiedEvNTmWsoUO7MnI2tsbq/cw7NuYbtVOEAxVrDetrE+10s
	 aLeppAXf4eildOCH41aPRyIrP9MwY19wvRF+uf/OLj++WUHWV4jMdW9m/6lQ3FDRJu
	 77eb5xT741kR4WxQ/bBUVCvvYZji63A+C5iXNWAOVLum0sg+rjk8XHDkddbEo6JyCz
	 N0qsJYhPZvtt0zdJvDzzs31tjVVmtV5bw0KNgYVJtMYQLCpSsbeNr9oUJGSJ2sKbr/
	 hBsyTHXKiIVc6eQq+2wP1pFCqcK+y450gBHYSYA226B1mC2kE7B/I6Wp4pu/P15dNo
	 DRTi3Q0nzC9zw==
From: Michael Walle <mwalle@kernel.org>
To: pratyush@kernel.org, tudor.ambarus@linaro.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: takahiro.kuwano@infineon.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260720141104.2054417-1-sammiee5311@gmail.com>
References: <20260720141104.2054417-1-sammiee5311@gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: spi-nor: sfdp: bound two optional
 parameter tables
Message-Id: <178852923504.3340372.1775017146035395867.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Mon, 20 Jul 2026 23:11:02 +0900, HyeongJun An wrote:
> Two of the optional SFDP parameter table parsers size a buffer from the
> table length the flash reports, then index it at fixed offsets without
> checking the table is long enough.
> 
>   spi_nor_parse_profile1()  reads up to DWORD5,  never checks the length
>   spi_nor_parse_sccr()      reads up to DWORD22, never checks the length
> 
> [...]

Applied, thanks!

[1/2] mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
      commit: b9f34a95a81021fa1f3c9cb8cfd458e66824cad6
[2/2] mtd: spi-nor: sfdp: check the length of the SCCR map
      commit: 1413f38f37194673502e61cd3749e091c031370b

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
