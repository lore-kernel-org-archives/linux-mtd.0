Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0256EC71157
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tt2tRMjAgge8lUJKv6P4+0OwHp87louIgh6DN16DSMg=; b=fVoT0qDOA/BTtn
	zqWrCeXnurdULBeFnD7dZhQs9ju2eYjV4LgyFvGMuTX9bMGCSpdi2Efj+jgqm0umh7Yvrs4P9aWoT
	V+AdhPcdetTq0Imh1MzzMuYWmt4de37Jk9ighyIWzH3PUpEQKF1C7+R9iwmBWn3hySK7Pk35WMsuj
	t/XxltbFUdtvtF1NqfEAlN2UWAPKyoWFOXwCIUpjXju+oZKbICnSgB7lQsdUEXcZqj5v/n5yNkmAZ
	Nl9/NUsKPJp2HADMTHi1ZvlvRVnZeP6NWeat6t+D4BCTHfSsp1cQBypTviRVttC5Wwh5TgnQIq5GG
	2kowbcSlV7i1BgR0oLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0ff-009VyB-1Q;
	Fri, 18 Aug 2023 14:41:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fY-009Vnp-0A
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C18D01C0005;
	Fri, 18 Aug 2023 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxxmUiGvT5UOOmJLgLDViUnvtWQ82iV7h6JU1NSs8xc=;
	b=LBGavffUz1CqYCyDJDNY7VuvaYwyVwlqwJR4/u/CgAI1UgppMC+VeRzk0kl3nd5cvCuVO0
	Y66SrcNJy2PhQ6WkGGI3h03JdGEqm1bHmoLeaYe2sPhdRGHaiIZ/f0Ymv19JWR94oAkUgo
	85GpX3IxOzvx0d3vYUKMVZEz3wMU5YeelrHXGFFRvVDxkAcGv1C0P7O4aF6TQwoyISG+vB
	XEB6JltfC7tAUcD9VhjLrII3sDs1wpDPC4N2Ychew/bRatP3Mxo/50yxkurNEX4nTrLL+j
	+LyVAVtKclUb176E+RNHuRk396TPAturjwXLMH7UfWdGGV9S9EZWMJi//oWeOw==
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
Subject: Re: [PATCH 03/10] mtd: rawnand: qcom: Handle unsupported opcode in qcom_op_cmd_mapping()
Date: Fri, 18 Aug 2023 16:41:36 +0200
Message-Id: <20230818144136.146083-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-4-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dd3c8f4ab2035bdba41c840a7daaf1cc735f36bb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074144_245973_E6712F89 
X-CRM114-Status: UNSURE (   7.59  )
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

On Sat, 2023-08-05 at 17:41:39 UTC, Manivannan Sadhasivam wrote:
> Handle the scenario where the caller has passed an unsupported opcode to
> qcom_op_cmd_mapping(). In that case, log the error and return the
> -EOPNOTSUPP errono. Also, let's propagate this error code all the way up.
> 
> This also fixes the following smatch warning:
> 
> drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
