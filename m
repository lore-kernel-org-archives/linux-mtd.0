Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D4EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiRygnLVF3t+8UVraae7nWWkVbkZyf/vfrPfDSheDxg=; b=dg1B71ClXnmC8K
	b6CU0aRAxRJho9zPAxGNjG8fJFtcfyd2pMuemn8Xv1aLgOj4teol+5PHg2B0nQrck+8WHA4QLOUFz
	HyV52dQgzqYhKipQNFA2Jj5bWjpgeMRU/tbsbT1l0uxKFy1OqDd18yGaR2W1ilz3X+3Am3jzDJHg7
	2lkiqHyXy7jWRqXH37Xg0zuWzSWNuRy82Ql0TXVzsgIyLG0M6/M0dneDvPoKmT2amuWBkwB8C7Ly6
	fSbvuyfcV75crS+gs9abyB2bKhdTa6gG3vAOdNqIf67lqTXnbmvZsIJC3rqMi5QH5Jx3jCxlMy4dC
	pke8LJCTGJeNo+bPFJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrD1-002JQl-2F;
	Thu, 13 Jul 2023 07:57:55 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrCy-002JNx-1w
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:57:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F38841C000C;
	Thu, 13 Jul 2023 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zm70Pn5WowQZi56CEQT8CB/u/lv3WH1eimTpmgCWNHU=;
	b=p02VM6E4wTbdL/iNBK7F+S+qYX5WX4yiY+5Qkjchrchqe9I8CYJ6xpK2rKceFrKVcHs4E+
	fPW7J7fPgZdvN2NB+kHsF+SFAhKZ6WpH1PHs2RbM/V/+LfSFwd8oMqgpz665lR9bx0UrPr
	jeKdkXF1th/TCs11IRZfmx+XG3SlsaCSevUDlsw0mwPez39Q4ZJk6HMbb1AAPOn5muorcA
	Qxc5xyru28pqQV8JeP9F5b6f3tGSRGNbR7S6OsvnO7lRic1VugIxw7+xQFg7W1MDSp8Fyj
	uFRvx0xZWZZ1vSKuUueWSegd0mPWT9JdG+Y1kG0Jeh9S8x3OyITRrWo+Equo3g==
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
Subject: Re: [PATCH v5 1/2] mtd: rawnand: qcom: Implement exec_op()
Date: Thu, 13 Jul 2023 09:57:47 +0200
Message-Id: <20230713075747.486046-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710054440.23297-1-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5c6a9518447ebc72606b390ab5cb3eab9dc1d867'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005752_782378_D6FC5125 
X-CRM114-Status: UNSURE (   4.72  )
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

On Mon, 2023-07-10 at 05:44:39 UTC, Md Sadre Alam wrote:
> Implement exec_op() so we can later get rid of the legacy
> interface implementation.
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
