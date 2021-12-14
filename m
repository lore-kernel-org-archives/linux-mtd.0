Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C37C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5Lvx34XMEO5EXnvOXf4iblAOr7q9FiWX0WuvuPKRv8=; b=2rHl8tKW5CGPcW
	MemS6cKKBeed6XrBQCOLIsQUwRCgyxZN1dhykmWH1BBK8YTk+r4rVNIXEuBignGWRb2doPfHcGj4K
	T5cgTYg+iSmUr2WnBQ0O+qTNzPb2gRPznjqtqzKWqq6Hk2qqpm/A0r2FeNRqY1VHmiIj3UB8qA5o2
	HKFbc5pm8vqbIEfmkrk2ideogO4TblOPdh/fRtrxTec0ny4ZIoRZwBpDwiVaqNlbzPXQvQnQ0Atw2
	Jf6VWIo0zeZ6CvNQz8aCDYXgbehQB/Mxi6jDyk7NMeUJdox+72d9qkGns05ZRO5E+sgpug7QYDR9B
	coZQpf/Je4wsUoXduXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAhA-00Et3z-6h; Tue, 14 Dec 2021 16:30:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgV-00Esb0-2x
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 16:29:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4D4801F4510A;
 Tue, 14 Dec 2021 16:29:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639499385; bh=sD8RcvWISFDTFZlYrC8HhC7WB4mL2HFouLE2Z3Yab/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aiz6URABrHkAw/GeqTF1COX6XSS2TgOgn5h3zPsppV9/9iKxkCZvw/eEUq+ILOb7b
 +AoY9suC+GWRkS+ie9KYryWTyYTQ5rKEZuZqedun7larxuh8H0lSESMCBZs54rBCnL
 e+Eb7gjqCi/fOevVhW9gg/c5XOq5AaM4P4fCn58/0fUInrjdbB4/PVPAj1i6szqB6j
 7O0aYqY1MYH1qJxydwFnifiF3fGSqWObxEW1hh3IbtNbcYlL8WEmtbJ8A5HUd5fwiS
 jM8TUZY+u+SDPr1JUPUWc01Z/Bjqv7KkqrLGiRbQPMCtMFNDQ1lodM4baZKMimL1e4
 l/oqorpl4E3Vw==
Date: Tue, 14 Dec 2021 17:29:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 06/13] spi: spi-mem: Add an ecc_en parameter to the
 spi_mem_op structure
Message-ID: <20211214172942.4647532f@collabora.com>
In-Reply-To: <20211214114140.54629-7-miquel.raynal@bootlin.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-7-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082947_346752_C78E4CEB 
X-CRM114-Status: UNSURE (   8.92  )
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

On Tue, 14 Dec 2021 12:41:33 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> +	if (!caps->ecc) {
> +		if (op->ecc_en)
> +			return false;
> +	}
> +

Nit:

	if (op->ecc_en && !caps->ecc)
		return false;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
