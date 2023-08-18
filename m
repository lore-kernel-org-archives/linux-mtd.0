Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E66C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lCTaTg0ACgneAXkQJRCx15jouC/XFnd/YLn8Qk88ns=; b=DUcbNrvWuBdIyq
	W8IKejrMnx8gevXiRByb4nRp56zeyjJeilZSSbnjRJrvuUbVy7M+pWCRKuiSH0LupMsNo2hcKd4JM
	fkFXOg0Nq0r9MJhThpjszLIgY4Lg+ykZfqU5m+zpw5iitCxkAvj2c559YO/w8q5sLgSIef5o3SRT5
	DKD2LGnjf8xOlTDLYPf5os561juniKY/oi011/e3yscy2PZoqYxeyMMrOQmyki39fo8BaHXVLPJ1F
	iv2Ub+zfPL2iz25r3/3gLith8P2W2soPWqsEQ5/8UEY2+7ms0ggvxPqW9KqeE0GQib7gMuqCdHrxf
	Oy4vIcWx3GXmxHSFg1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fQ-009Vm3-1V;
	Fri, 18 Aug 2023 14:41:36 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fL-009VjH-38
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF131E0004;
	Fri, 18 Aug 2023 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxaYZ7yDiLnZGQNGRO2Cl3NLYWufVEdVB7s9OZJ7av0=;
	b=RjNYS08dOA3EvGrqXUxQP22+bDYVRFBEE/fvB8Mm9iSulT6ozD3tlUuzBQQV0iNx3sXEr5
	FJJeusj1wXZlfV99hOMlkKAKDaZvDljcxxfVwD01hOQQC2UbUfolUjqWdkz4nvSTk4nNkM
	tIhBOtlEgGknA2NLnp9hM8K9efvRBLjkRl0FIbDd6Ac1uUQHbY9ZYeSwFUG7VSVHy7Z8QQ
	OIUbcC5citUT0IM0K+1kU0Te1TNdcs+fAqlms1y6wVs33qdZPLzzdzvVsS52dYx8Ksa+7h
	kM2pn0uE1we7Nf3HSP/ULMH7KZLWt0MmzTIfolDPG+JWPb2L8dN5BJEJL7NY1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 05/10] mtd: rawnand: qcom: Use EOPNOTSUPP instead of ENOTSUPP
Date: Fri, 18 Aug 2023 16:41:29 +0200
Message-Id: <20230818144129.146024-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-6-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ab15aabac028afd4889745239a1860a76598e79f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074132_290306_0649DFA7 
X-CRM114-Status: UNSURE (   5.80  )
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

On Sat, 2023-08-05 at 17:41:41 UTC, Manivannan Sadhasivam wrote:
> Checkpatch complains over the usage of ENOTSUPP for new patches as below:
> 
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> 
> So let's fix the error code which is already present in qcom_check_op().
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
