Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5770FECD993
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/QkmzynoVHDL5aex/FEgFjL/sKyBU8OqUiZoLAdbSk=; b=NEsnUYZ2xK/vU6
	pAzjGFcLYMCIlOcd4Ydb0cWLOKs7mlsJBRffOsCw1T9QHwglw1zH/CUpDnhb26Tr7xO9RpES8sGZu
	9dqk/De88mCkUTA+y2GcO/qn/fG+7AG2QLdZXcB2wUb5nG0xIusknEl12QLq+A4d4iYZFYgett8Ya
	EVV9ykpylpl7IpG1nAyDhX+RkjICDMIOWWAzEP5fLfDFoF7q5mcDGPR01GhNLidYjn4BXvtCE9MhU
	DuEv0HRSF5uGVWEoH2Dhnyt/kgeMEG3ZNX1vbJ0Nway6sTczMUWtlUgpL7PDhJaxv6OJx2sm1KmHG
	9HBnkwpoSFn++Yd2d/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Gg-0000000AIjK-1XZH;
	Thu, 05 Feb 2026 17:35:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Ge-0000000AIi9-0HgD
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:35:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B89FCC243B0;
	Thu,  5 Feb 2026 17:35:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F98C6074D;
	Thu,  5 Feb 2026 17:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73086102F2A49;
	Thu,  5 Feb 2026 18:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770312945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=P7qPm+Qj6DOdJcE5S4qzCC8CDusFkdDkAEcNAPbSTjs=;
	b=2tByKqO6OicYo2ldtnWeiYKqZls56u4AqRmLJ8hXdSkgrY3Gq+WqFwi+0LHSUE0ApE+5Jg
	Tj7MhfMmj1q58Q66l2391dNNcK7Zq35shpb5uP3K6RF3bKuQJlOP70IfvjPrbfZodDl49v
	dh0qdNGvPESgdtKY1/fGCpzxWgd4LAc4qfDddLOFD3/SnZyfuvHCwSZp9xy4zNe+5vI/xM
	F3h+tb4rKt55GlZP0D+XD+cRe9keq8fP/u2YuborlJN/UZuZS7t7IIXZYJ4GPlQcmtJhwm
	pyg6LYMUBn24EnUuQ+57IZ8tz+Vn/EtbHONBmtFfvI2qfYFrc2xuACag3rgGLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 07/12] spi: cadence-quadspi: add DQS support to
 read data capture
In-Reply-To: <20260113141617.1905039-8-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:12 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-8-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:35:42 +0100
Message-ID: <87ldh7gkk1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093548_246324_061EBE1A 
X-CRM114-Status: UNSURE (   4.18  )
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

On 13/01/2026 at 19:46:12 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Add DQS (Data Strobe) parameter to cqspi_readdata_capture() to control
> data capture timing. DQS mode uses a dedicated strobe signal for
> improved timing margins in high-speed SPI modes.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
