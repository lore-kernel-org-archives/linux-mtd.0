Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEC5CF397D
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECKXEaWlBAqhAnKZZbqid1SGn1h+Qg0WHrNxSeRpHzU=; b=WGLfdZnwftZug+
	V5i4nXgQjYSMzxbN2QltoPTCrFX8lpV3ZGFssM+vc4SiLQHoFPv1EqBN4aoLG8xtdMBKHi8ktpjHa
	oanhjYIG7IkTHJ7u2ZOgUXgMbDLZmteF4wk3QXA2TaLPwRWw1AT8SZBLIEsnNWZY40UwMCfJ7O/Jq
	jV9EzOWs9VOYNtPS7rzlI6q0Vu54gXmEzry7uHjNgRyXZ1LTOVUVArUwSl4zc9F+3xIq0kdGq829Z
	zwlrcRkp+I1kUkfO4EkTNF9G8eolReSJEDkhkXW897DlpRn333U9DQW4DlXAo9/JllXeutsixfi4S
	EPGc8WQbJnKTkT9CWYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlr7-000000041em-4AWN;
	Wed, 19 Nov 2025 17:20:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlr5-000000041cx-00TZ
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 17:20:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E042C1118C;
	Wed, 19 Nov 2025 17:20:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0A4460699;
	Wed, 19 Nov 2025 17:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EF0810371BA3;
	Wed, 19 Nov 2025 18:20:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763572826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=jbVSjkm6B2TIhYElL03L/ogME2sV6mZYyxeksySfKTE=;
	b=MmGg7LNfCTZaN2J1aReUQyberrBbp5/Zr3km52Fs1kL7rUCVVKuIp4QuzgqOHf2uA0MM0p
	UjV5dhrGXhstPFS64zL7U9v90yaoJ0AsSut1pd94su+7XV0s4WtkefDhWeBm6D2bTOMyaz
	uhSuhSBdIQ69tmNmQF1/rXZAF3dw9PBOR35OJ5TuO2gB0YOK8kAMY9PqXqISR6rkbikJf5
	R39yxjf4d8Xqs8KN0GI2WeXr0Pu4Lnj0+7pDa93xJfiMBPabmfw38PXUDBWMQrOv0m9A9U
	f+tRUNhqyjU7w4cLUP3guIa2WQVAjj1q13zk6lqJaDnIC4iQ9QYbP+sIWpmrMg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K <s-k6@ti.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 07/28] mtd: spinand: Use standard return values
In-Reply-To: <a852781a-70e1-4da3-a283-a81be10daac5@linaro.org> (Tudor
	Ambarus's message of "Wed, 5 Nov 2025 17:06:44 +0100")
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
	<20251031-winbond-v6-17-rc1-oddr-v1-7-be42de23ebf1@bootlin.com>
	<a852781a-70e1-4da3-a283-a81be10daac5@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:20:24 +0100
Message-ID: <87pl9eaqhz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_092031_195953_BD73B678 
X-CRM114-Status: UNSURE (   8.54  )
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

On 05/11/2025 at 17:06:44 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 10/31/25 6:26 PM, Miquel Raynal wrote:
>> Replace -ENOTSUP
>
> do you care to fix all mtd? :)

Call myself lazy :) I preferred to fix the return codes before adding
another path, otherwise I'd have had to add yet another ENOTSUP value,
which felt wrong-er!

> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
