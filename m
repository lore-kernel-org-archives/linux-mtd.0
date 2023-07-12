Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DA4EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMldmIu6Oi+2j2W48+yzxZNkvElUiN5BzCys9oXX18M=; b=2Pv0NDaUELIsAC
	o7Z2QEMbzGCi+alZNyAGHjnJIONgdM+UOCn7nLOBMRLtabSdNz+Jdl8uB1PzYZCfb9pESfoI8pX7C
	KAlvVwCOOSi6DwIe84LvTFVanbs8gUA2NGqzBff29xDXst8Z9gJYSc978FLFJ8sbsXl9A77iybHHI
	otAm99TOrbhhJvWufSy3FT3ku2mi8xh6ASGrPd7QNBOpoc+ek1X0PkKqfExYhFedo13orCROH7dtA
	RN8dpHE454oIaxyhHNf/+0CsS935PLg+7hBCba0T79TR4AczcakbBT27udUIrHcqbqAVhJpmqL4LF
	mN7As9cJuYDKELgP8UsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaWr-0009O3-38;
	Wed, 12 Jul 2023 14:09:17 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaWo-0009Mx-0X;
	Wed, 12 Jul 2023 14:09:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C1781BF208;
	Wed, 12 Jul 2023 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689170949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbH1sJuZS/Xc5s2+qd80MXtWIjOqIm/V2jGSfoumZkw=;
	b=fcmgIrDuRZOw3vQEbHsrPT0Ya1VKzHREHrZfWbB56FDykrhoZKwPfE+I7c3jBqv4UDDIQw
	TQrLqEeIOml+Cfr/hKL4/WfObvvUI5F6g5+H9L3muLRY57dsDMLNg80Lex+1fNXCk8pg19
	bHO+VbJn4Nv/MgKwrb6qv/5N8KoZcbfTJOz07qz20QI4hC2NNMxhmEJ2gUzoHHiyTi+Kao
	LtHLQ7B/ofNdpReJoX67vU87KbP3gW/kqVvA8JEv7mzmHYZxuxXMCX/+e3AfXkIDcBMGT5
	lWPXrrRb1crMg6BhSnKUXTIJszz7M9E1+JseXZjcXD8DBR9QYSzIlY1GR+fSXg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	Stable@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix OOB available bytes for ECC
Date: Wed, 12 Jul 2023 16:08:53 +0200
Message-Id: <20230712140854.284151-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705065211.293500-1-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7e6b04f9238eab0f684fafd158c1f32ea65b9eaa'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_070914_371228_7D70D231 
X-CRM114-Status: UNSURE (   6.65  )
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

On Wed, 2023-07-05 at 06:52:10 UTC, Arseniy Krasnov wrote:
> It is incorrect to calculate number of OOB bytes for ECC engine using
> some "already known" ECC step size (1024 bytes here). Number of such
> bytes for ECC engine must be whole OOB except 2 bytes for bad block
> marker, while proper ECC step size and strength will be selected by
> ECC logic.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
