Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02554C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxeAYckurXxGY5NgSmD6iDfEPbCdt9pAlj4UZvg6aQ8=; b=K6mzssUqhljcjp
	S9B9wCKecPfVekafLf26hM95DqV/1zU1/mAobhFxkVYnTyC1Mm3aHWu64lWej+VHq6+0JwT2tQN5n
	Olvpb3FftEzA98yHbB33WsG0CIeJ5lzayDuRaVai6PpTX0NxgQViBW1IIUITNwR5MgNwz44vX378C
	utBZQAM7elVVEk1iulk0XrUVe5KSbx4p4EJuprkmcecop4IbQeVKzPnRG1QNxvfnsR93C03Y9Tgoh
	kjW6fpVOlgHJCCRWVpazLLOu2UPIknB1LP+6SUEMdNjKAS+xJQNnNZnL2XBXg5jWKUzipbgApEuFs
	q1HnqkUY21Sduq9G9Q3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os51L-00GCH9-Uv; Mon, 07 Nov 2022 16:30:48 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4r5-00G7Uq-Oi
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:20:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4CDDFC0005;
	Mon,  7 Nov 2022 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1aiRW5byLVv6/Zl3rvmU1fUJuuBJRNLyImrDUKUB2A=;
	b=PqSYI2J5umJ9aOCxRT6hOtjzj77aTFCPbsuCgXWw7dhtGxA0jUBexLd7WFE8KMf0xzcIVB
	ODoTtwHPqIm/g7UyDV9IOVRvz6GRe4P4sosgRC5JSmEezC/iSZY2Xatv/srbBmor8NJj0B
	P+LbG8hfGB78+pu0VkfSnEw8irxJJQkPQMYrghUdpFJmk5uS3VNJWOg9YhJlhSqOLusXbT
	MsJhlZu4bIcQGgRuvCcYKUqxyfKLunlSet12gYaXvqL3sFTNzViV5emQJyFONlPjN8snod
	GD0LNj4paP8RqDYgc87qIdRWT72MZju2GagMpceqsf7mfEJOCRptms2Ek9YDPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: handle ret from parse with codeword_fixup
Date: Mon,  7 Nov 2022 17:20:08 +0100
Message-Id: <20221107162008.44113-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021165304.19991-1-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7df140e84a75c89962feef659d686303d3ce75e5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082012_298795_EEE94FF9 
X-CRM114-Status: GOOD (  10.40  )
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

On Fri, 2022-10-21 at 16:53:04 UTC, Christian Marangi wrote:
> With use_codeword_fixup enabled, any return from
> mtd_device_parse_register gets overwritten. Aside from the clear bug, this
> is also problematic as a parser can EPROBE_DEFER and because this is not
> correctly handled, the nand is never rescanned later in the bootup
> process.
> 
> An example of this problem is when smem requires additional time to be
> probed and nandc use qcomsmempart as parser. Parser will return
> EPROBE_DEFER but in the current code this ret gets overwritten by
> qcom_nand_host_parse_boot_partitions and qcom_nand_host_init_and_register
> return 0.
> 
> Correctly handle the return code from mtd_device_parse_register so that
> any error from this function is not ignored.
> 
> Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
> Cc: stable@vger.kernel.org # v6.0+
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
