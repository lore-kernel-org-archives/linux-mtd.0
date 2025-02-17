Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5AEC021AB
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8WJPEFD4m+hBVYTt/R+K5jjrmYOXufJpCt1Lrvsd1k=; b=GuuGoI8SFvrizN
	SA3feamOocD0FL0zoKzHVxrKObKk19ZRjK77ohaskHJhri9EOPabtNDAoNGy6VsTMyiFWVg2PNKUF
	/drvxuarAItaMxKgcI54a/CHj8rXWdZOIif8+cHSGhSE73DFVUWqywt13miu2rDWpZgA6tO9DrsZx
	M3QiTxJxg7XhtFAOHvhb3CFN3MlCt3BLlAQKyXVv2+27LRS1iOi+cTNSB+4TfxZM3KlBj8BJWuw82
	08OfBChZPYVAEpdcQNmxKAeB8PffpAQcHeGQKVYK80hpaQM1T4NZdg8JP4XEbYyu69NdumyAoLkdn
	stzymdIjg94NwyPTmTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3oE-00000005ET2-1Uwm;
	Mon, 17 Feb 2025 16:17:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Ir-000000056yH-2Nnw
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 15:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C13D2A41626;
	Mon, 17 Feb 2025 15:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEA4C4CED1;
	Mon, 17 Feb 2025 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739807100;
	bh=IPYw2VXJR1m/MTKARa+CpyvmDGyxBZpwTEkXm+G38Gk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z2trqlLhYkU6xJKuWtaNkd28yP3SuCoZ7JbGHIQDdxDn32i8e6Awn5NrOkNV3N5Ev
	 HeHhrGLdAGhFrmzM8W3QibRP+zp74FUORro0kQE5j5e8JVbimrs0EMs/LxcV4dBLRQ
	 fto5W2G90RBmhRgov4xoLGhVXdkFWYPWr4Lc0i9KdmgXR8+DzYSyyftj/KB8oRp0Ye
	 ZgYFBbpAKDLZ5L9N16B4ZVFdnPPWEcjmocc5svL/Pw27fEOQcmbj3pA+ZBaPe287ad
	 LzQ7OxCHfVfHlIJC73+1BO3+WJcBh6SfS3jOM/4b80PrJv5Azj6x3hBj0z5Wc76TGl
	 G1HSdPrvHHM0w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: fixes for v6.14-rc4
In-Reply-To: <871pvwvb4f.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 17
	Feb 2025 16:34:08 +0100")
References: <mafs08qq4myux.fsf@kernel.org> <871pvwvb4f.fsf@bootlin.com>
Date: Mon, 17 Feb 2025 15:44:58 +0000
Message-ID: <mafs04j0smv7p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074501_671298_0058D36E 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Feb 17 2025, Miquel Raynal wrote:

> Hi Pratyush,
>
> On 17/02/2025 at 14:26:14 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> Hi Miquel,
>>
>> We have a regression with SST flash writes. This pull request contains
>> the fix.
>
> Sure.
>
> In general you can just let me know when you want to queue patches
> to mtd/fixes, I know making a formal merge request is a bit heavy, so
> for fixes both ways work fine with me.

Okay, I will do that next time around. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
