Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE69AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqmWwcBn8i/Yvg8/lXB6ihlQtKZfpnXU85nC1E2Hydo=; b=cLhPmUiDFKtulx
	VvUIkk4hCPD1acWctOSng822a8Ly8XtniTAho8dasPalWaqtdqY+lVhvHmhUllKuy11bxSc2kgUdK
	tujt0F4Vx5bHq5RbmKwnVV6L09zHLQl9FYS0Fs6SMvzTvUFxVtUsek7cr/jKBUW0L0edmUUxnHP8T
	2qdnc3s+fU4xHD6L0+ZstIrhBf9D/vILuwY8Dopoj70bUds3MzOoLkbQoBmxZKWibb3J+pS5R2FOE
	vLIBZSLohmIWjW4RuufxoxmWSRpssjyEcokPgCF1QCAQw59PWxQvz+KGN0AbJLdS9Stp6ZrRyLPk6
	eStNh6VUbCcf6z+DeEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZO7-002J65-HR; Wed, 15 Dec 2021 18:52:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZO4-002J5P-OD
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 18:52:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 13FC81F458D6;
 Wed, 15 Dec 2021 18:52:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639594343; bh=lSwTdglEMsehkWcc/2vunjShV0vV91Td2VrKRQ2w2kg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RQgRkrRIewXQqdMgE3ppN8+4gqpvBNXnUCdCTQxT7AoNGKPPw5/TA2iaV3NvUUf1P
 zk9HZr22FDLdonis3ZfdWdqwWch7vK48zojXZVxflIsKFvYXQWvXizcmX+x0ZzfOm+
 M7OtDtw9n6NYH3dsOsg1niF+9XktzyTz9Q3KujJhJJ1+ZmJKKVkdzzqq0/1xkgrz5T
 g8s8keo9U34NJ3wdavxOeCVj3bXFTs2kwix0gIxpHpplhMiqhyEREvlfUHFsSxlubj
 S0/uAZGi/6NNHIGgIB7uZehY46X0nKM3oZiXph8LMCaJ9MQCiMbm3NLPITxOeRcsB5
 HZR4PlGS+5pYw==
Date: Wed, 15 Dec 2021 19:52:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211215195219.0d34cb77@collabora.com>
In-Reply-To: <20211215184426.67fd3912@xps13>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_105224_956520_54C42C56 
X-CRM114-Status: GOOD (  12.04  )
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

On Wed, 15 Dec 2021 18:44:26 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> In order to keep the series easy to review I decided to go for the
> following approach:
> * Introduce the spi_mem_generic_supports_op_helper() which takes a
>   capabilities structure. This helper gathers all the checks from
>   spi_mem_default_supports_op() and spi_mem_dtr_supports_op(). These
>   two helpers now call the new one with either a NULL pointer in the
>   former case, or a structure with the .dtr parameter set to true in
>   the latter.

Is there a benefit adding an extra NULL check when you could make sure
all callers pass a zero-initialized caps object when they don't support
fancy features like DTR or ECC.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
