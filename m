Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63093C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OS0txoqzhsPI9BBU5vY/V5ZoV9Xi7J34hGvaGoMWspQ=; b=EabdYi/k3/DZg2
	7tgtpWplRULC1WEot4956FrMKzv5mKWbROY1cTrtwhooEJo9gj2J/0jB7wuNdiIYiaHTw/y9Lt2BY
	N9RZMD9k8HSvDzEEDWw994msD0dxa74yZFjwSht7jEPmYmvOVf5B9ldR8V2XxGPD8RE7V949A93T8
	TCJV0sMl7DDtebELD5qiJLsLL9V+FPGuN+A1wQZI+9xmzI1WE5yepVS6+1FIkuAURdH5bBVy0cn/P
	/WIH78FpgQYlVov192I8rxLd7vTftB5UbHw79V3QXw/MUHcc0GZ+1Ztv7faFxteuog50jyanKTyNa
	MkxzJBat1VB3mmqgk8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fX-009VsC-2Z;
	Fri, 18 Aug 2023 14:41:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fS-009VlA-2X
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19F071BF204;
	Fri, 18 Aug 2023 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4boPha15u4pwIkLZ4/5I8jzI/YgM/ESZY3KWwaz3xbI=;
	b=JAoJKAaA4UlX1rhx3W4eUAII6YxhUdN/hhP1uIQ+n8y3VIVWt2XyA7Oapi1fJX4PyuHYd6
	sTsHabPPrq951kexa3RZjKmlwGy/r+r1T98DVnGn9quYQh0+MEeH8LEFF6eNhM5tSSy35K
	YO8M5rmJsrb9R2IE3xMHnbXo3nJcr/X4QXVrAQc4G5oyKfwg1kZv6Dgonc43VOhNat+j7r
	NZE+hfEskeekr5Y+F5VPUnCETdmgMfQQffIOHUUtnAHuMC16uANnswjNnpiGp/R/fSbqE2
	oK1FIMWs6vPSLNMVrZxDpVbJahmNUJvHyVE6UIkcF97GIDCzS+dMp+Ms2OlOSg==
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
	dan.carpenter@linaro.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 04/10] mtd: rawnand: qcom: Fix the opcode check in qcom_check_op()
Date: Fri, 18 Aug 2023 16:41:32 +0200
Message-Id: <20230818144132.146053-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-5-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b4bb4800313de0d8faa5615d4943615ff56c1cc2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074138_987733_198C2E5F 
X-CRM114-Status: UNSURE (   6.72  )
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

On Sat, 2023-08-05 at 17:41:40 UTC, Manivannan Sadhasivam wrote:
> qcom_check_op() function checks for the invalid opcode for the instruction
> types. Currently, it just returns -ENOTSUPP for all opcodes of
> NAND_OP_CMD_INSTR type due to the use of "||" operator instead of "&&".
> Fix it!
> 
> This also fixes the following smatch warning:
> 
> drivers/mtd/nand/raw/qcom_nandc.c:3036 qcom_check_op() warn: was && intended here instead of ||?
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
