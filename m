Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2C9CD1284
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erVpkqeBGUGXSN5g8ZNTQWIT+GU6W2AqwHhYolky0n8=; b=2LQ6wsQW8+5zfz
	WhFLHhVBC0fzbSemxUFqmlAJbZ/C1QbjNmq5GtHjAO4pC3mzhij18DaTeat2O1X4YvPZqKO807XB2
	pxG6eNbdXZ3PVKTqHosh6lsBGNrV4SDzc9VRD8hkY3E0GldiNe9NzaYCT5QJJCxy7LMlKXr8ODr1C
	AMAuZkT/zkZpZ6EVNxbxK8TslIXWl22Dg1AIbQdgXrRmktL7WXKPPGkqPD8lG/aUYqaqXSJilsAVT
	AcGjCA2sZ7EeFnd0VyHN9/nBjrh1wHKThhl5z6ecMgTIE45ksQT4BxfMqX3C/Gu4BFLWc7l2JfnUj
	F72pjlIP1CHtDxARydSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5Ar-00000000cp3-2Pr0;
	Tue, 09 Apr 2024 06:41:41 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5Am-00000000clJ-1nua
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 06:41:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D81EE20008;
	Tue,  9 Apr 2024 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712644894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Krd0BAesKO2iMVNygzUAooa8aMl2YxIa+szFLm86h3M=;
	b=Lxe0W+ueNHMvhA4jruFrl5RfQzBTaAwiNuT2BRmIhCvleayAKis6628tUeRLpLuLs3r7Rx
	ZlMwOSDISL8uK9+eochy5Ix8u78E+Q6SYOzhaGpT6SQ3Wmpmdifyf/9r4Vkmi+SVECGX0M
	lhTVStGd4M9m2T+v+6zziB6kRayBkJa419CfYNXVKcdtSTasmAzVR/qwcw1tXRje+xmDVO
	OskZtnTc+AEaLPCTUej8AbTQOR6BJHiKhAvEo0NjcoIMsqeRdUEieqCp6GqFj551UTORz3
	QGLEJJcoc5nXrlkFDb3FznjhmWttxwaVsx3HGg5YEA9RstzZJm/HDgCpAXePlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v4] mtd: rawnand: qcom: Fix broken OP_RESET_DEVICE command in qcom_misc_cmd_type_exec()
Date: Tue,  9 Apr 2024 08:41:33 +0200
Message-Id: <20240409064133.91927-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404083157.940-1-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b61bb5bc2c1cd00bb53db42f705735db6e8700f0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_234136_697057_2CB8F64F 
X-CRM114-Status: UNSURE (   9.33  )
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

On Thu, 2024-04-04 at 08:31:55 UTC, Christian Marangi wrote:
> While migrating to exec_ops in commit a82990c8a409 ("mtd: rawnand: qcom:
> Add read/read_start ops in exec_op path"), OP_RESET_DEVICE command handling
> got broken unintentionally. Right now for the OP_RESET_DEVICE command,
> qcom_misc_cmd_type_exec() will simply return 0 without handling it. Even,
> if that gets fixed, an unnecessary FLASH_STATUS read descriptor command is
> being added in the middle and that seems to be causing the command to fail
> on IPQ806x devices.
> 
> So let's fix the above two issues to make OP_RESET_DEVICE command working
> again.
> 
> Fixes: a82990c8a409 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
> Cc: stable@vger.kernel.org
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
