Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C9BC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbKQOlvScMFIqMkUxvHaGiGGIQ6iUVH/VypXcaK1a7w=; b=DsyVuun6uhX54d
	ZJHPRMFRVxcl4kcTOmaTuzlZXAHkNrTXOZlDCLZuN5e/j6EMjJ4K/zJIKxfBkwWxk5DdpK6ipZ3ej
	sz9qVjK8bHaxmBQU2SGDvego7hrH/CgOUDhc5gy7D9q4PTmnCzXTdzw0Bq04BQMbk3v4VeuGAbcg8
	ch9uRpiFj/cIsQE9OeU89iwo0XcwG9l8zrrVqiDQ93WQ7VCqsBWgtdLMbz0uEm9v7Kn0AYEsxgbqG
	eTT9ci6XvA3J5Wm85j2L9mNZbBoYPUASForwTsRjnW7KJsMpQbuGNqkAnU5SKwsFkijFJjwFefGhA
	1X6vzr2yZG/l2MrubHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n50ql-00E4b2-4m; Wed, 05 Jan 2022 07:36:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n50qh-00E4a7-MO
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 07:36:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F38BC1F43FFC;
 Wed,  5 Jan 2022 07:36:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641368201;
 bh=QPkvd5xczl6Z64qbpAjTBQEF06yvP1eRXJlEOKnp7wg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BiIw+6nB+qqPQ/qBtYrXS+VmqjdzQ7EMIhmhNM7fUVnsarXQtFyRjz0XNQm5YPOwI
 rlAzEpKreHkAlXq5qstDryPmGTf0YTex2q/M8VhYNZ8c4xVUFbHPpDQBCfhXM08chG
 9QCTE7SMYpjkFhZ4wKz0LiboypZJvdZJCC98UaahVyxpyX7lHbna85So3YJRH8a3HI
 LxK8ibXE61RXlHR85yo2HSxiFbq4ZJPTXKyzNxWWQyqPmzhW9xXBJgkzOZ2kFpWfmC
 KM14EZ1EwRdF8ALrUEy5lL1jLEc1EHNd1zHncaskbacCsagFGi57JD9WeEqBYVg8ME
 lBe/8jpyu72pA==
Date: Wed, 5 Jan 2022 08:36:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Apurva Nandan <a-nandan@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Daniel Palmer <daniel@0x0f.com>,
 Alexander Lobakin <alobakin@pm.me>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 01/17] spi: spi-mem: Add DTR templates for cmd,
 address, dummy and data phase
Message-ID: <20220105083637.651f0d01@collabora.com>
In-Reply-To: <20220105055053.s4yfnk7cjedwtgvn@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-2-a-nandan@ti.com>
 <20220104163100.56850d0b@collabora.com>
 <20220105055053.s4yfnk7cjedwtgvn@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_233643_938742_0CD5085D 
X-CRM114-Status: GOOD (  13.41  )
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

On Wed, 5 Jan 2022 11:20:55 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> On 04/01/22 04:31PM, Boris Brezillon wrote:
> > and you get to define a DTR op like that:
> > 
> > 	struct spi_mem_op op =
> > 		SPI_MEM_OP(SPI_MEM_OP_EXT_CMD(2, 0x1234, 8, SPI_MEM_OP_DTR),
> > 			   SPI_MEM_OP_ADDR(4, 0xdeadbeef, 8, SPI_MEM_OP_DTR),
> > 			   SPI_MEM_OP_DATA_OUT(128, buf, 8, SPI_MEM_OP_DTR));
> > 
> > This also means we can extend the struct without having to define new macros.  
> 
> I like this. It would also let us easily mix-and-match the ecc parameter 
> that Miquel is adding.
> 

In practice, I doubt you'll ever set the ecc bit when declaring the op,
it's more a modification you do afterwards if ECC needs to be enabled,
but who knows...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
