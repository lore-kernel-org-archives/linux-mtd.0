Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426A9EE498F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 20:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmzfwh6qPXrcIKs7kTfUc5abEK6wePuz91kFRSMSXcQ=; b=Twq9lCkLTXORJz
	XyNDUg+Kzw6Q0ccIbY7y2Xcg2urDoivjz25WEZpBPoX0v3xa4s5P3Zy94ELhep1ZoxRUt8u5xSaWn
	gccQLZA7/ku3N4PpCSr+AjEEFV9Lan9CpzxludO3wxlIfdP7bHtdcQ7LuQjq3xlgPWgRv+cRMSaec
	WqKVtw3C/NtKyeDKWBx643O7QhS0zV94kx+RZrU0O7EkR+cQ3pyGtc+LJWqQQwn71R8v8UmoFH9vB
	M2YkkUlq3YAUqCClT1a5sZ6VTZGyN4RDoEbmOGFHa9LOmrLg7ldQKMarasMmIJDRUW+0H0j6C+1AD
	LMYm7tDsMDRxDpWwxYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5gB-009yXi-1Z;
	Fri, 18 Aug 2023 20:02:43 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5g8-009yX9-1l
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 20:02:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 279FE1BF204;
	Fri, 18 Aug 2023 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692388955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBuafLkRO12L2VXNLAEirbbppACezhDPBaIxB+yiYEU=;
	b=Iz4YoMrKD4JwW+Zqar+V3hnOvC02vxCUQjGjrLCiHD/2Jw+HZZE2Bu9Th+sZ/TuAX5LtdS
	irBAAiXipFLFPwREVmTvdVaEGCQZe6FO4ikDYw7Llz69hJI/1n01XTzpvasgGAnhknfF12
	ex38pT+uelRgNSdG+MmN9wkDTmW9rLN7zKeptMTtGkZvstFml7SNx6fNC1p0GeR4ShA33K
	2WCd+Cm2DULg/vpP8zNa+HojEdZYUZrEjx4OCLVUZifrkPyHMTNdaQiG1R8TkzgZqvZckC
	S26JTJmXEMn3lm2qxJsrgfSjP5SRBSqqQCrPSiryllQ2b7t/0jZEXdfd8QV9sA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
	mani@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com
Subject: Re: [PATCH 3/3] mtd: rawnand: qcom: Add read/read_start ops in exec_op path
Date: Fri, 18 Aug 2023 22:02:32 +0200
Message-Id: <20230818200232.149295-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818145101.23825-4-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5a7688a3e2e6293b6b405322b8fbdbb2a0508511'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_130240_724008_EA1BE128 
X-CRM114-Status: UNSURE (   7.66  )
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

On Fri, 2023-08-18 at 14:51:01 UTC, Md Sadre Alam wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> READ/READ_START opcodes are not set in exec_op path.
> Fixing that here.
> 
> While there, Steps to program the controller is common for
> erase/reset/read/program page. So use a common pattern and
> pull them under one function.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
