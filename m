Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC33E6FE46
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kagF+LF1X0s2VSfkyKJ4zlRIKXhctM+NPSQgZWWvWPQ=; b=s+Flsnz/SOR5yY
	AgzSUgsJC8End3QEm4MRjE7lZHQUpoxmtaF2o9Gp48Fxrkz+fubqy6356TjGJvZtiTTDH7iHSW++c
	aeWMJUiD6CiTm9L5Rj9Ku2M+RA7xfzZO3ktL59Pr0BQ6mpIyt+hiysLIeK5K/zUYXOiVgy0nufp/h
	Yc3uhmBLzGLhetVuPk4Usuvt4M1gPmc0MlO8DrAjeYdhTJfOHhZaJ+rCNSinpO0O23zsNm34adalL
	PaUaBI906Uw+4zBB3MFOPL6Cn4emshmbujfEbS6ywvJ19BeFkvZf0rXYdS+EV6/vWu5QtvP+mETSx
	LoCuH2o2WhgNyY9oihog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhV1-009FEz-1Y;
	Fri, 22 Sep 2023 14:51:19 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhUy-009FEA-1C
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3957E0003;
	Fri, 22 Sep 2023 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u4bMcSqfVOcLKjBh3MpHcTy2ewquY/v0eZ6t5YcYSsU=;
	b=aeUW8/R7sdrtUu5bKQ8tM0mSms8cN/RJt/US1tLdgOeJ8VqkZmv1ABIrObo1nhXqnyb8w2
	luF8XvJcx8yhvaZl6pJv4GqW1WA/B+R49WG4e1g7djUry4lVoAyqICvIiiWZ3hfjB91HZp
	i8gTSsFL0QECUrxUORXzVtr+tcQGjSgiCcLwXn7xfisfOFsqB0UbuN344Fa8E7KnX8HeXo
	aHQ/x9DcLz1Wwpp8GcKK+9u7kvnMVkKaKTdtYvt+Tn/ug500Bfuzo1QH1eFP8zVkT6Bzdo
	zpImVtFxJquP2fTyN8z7VSiZf8i0b/QuWGMENXdFIFcQ8WwhB8oQ8cXXxYDTzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
	mani@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com,
	quic_charante@quicinc.com,
	quic_kaushalk@quicinc.com,
	quic_pkondeti@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: rawnand: qcom: Unmap the right resource upon probe failure
Date: Fri, 22 Sep 2023 16:51:09 +0200
Message-Id: <20230922145109.578247-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913070702.12707-1-quic_bibekkum@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5279f4a9eed3ee7d222b76511ea7a22c89e7eefd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075116_708416_B8FEE4E3 
X-CRM114-Status: UNSURE (   5.77  )
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

On Wed, 2023-09-13 at 07:07:02 UTC, Bibek Kumar Patro wrote:
> We currently provide the physical address of the DMA region
> rather than the output of dma_map_resource() which is obviously wrong.
> 
> Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
> Cc: stable@vger.kernel.org
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
