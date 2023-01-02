Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A1BC3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79FhzhxcxoXbK7lCRclcNMISsT5Ya6smqCZXKXQluYA=; b=1fOZS+vbE9WxKe
	TQsBrEcYch0IrF+MiD8TwP/3m3xch9+AzPmhGW441GqgaGWtQQidQ5Q3NocA7P67LrxjNXgxpOC/w
	1xj4MRSZ+NYrKDjsaceh1Jwy0JPc/thg9lyQNyMIB78cV0z7Y2wExUajcEFeAv/Lk6t6M7K+tBZgo
	HH/7b84DJdKUf+YjABrIjPzhU0mF2zD+yIbHZ+cVtghBKvkhZ9VBTCw54aSm5WaqRMyi46E2WuWUh
	EVcjEGfQhFaaWPCd8Z16+XHay8QU/D4f1jM8JIU13vrEMQe0O8aTiAiq5ygWEWW2gJp7JrTnL3M8J
	S5iThvaCNtjIp25CzJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIwd-00AmdA-AS; Mon, 02 Jan 2023 11:25:31 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrq-00AjcW-Td
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 11:20:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0D069FF802;
	Mon,  2 Jan 2023 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMrkLl1cpHLTK+wPSAXDpqqVjmnjzWcaxPTe6/swFkQ=;
	b=pSUl1g3BBFSzHxhMfqAUhoei2ua3N2Dvze8+voGt8N06QMh/ihHOdLjFlvja04vUnr0omt
	s0ubKoQGOR9MB3acxFTBE+yWb+mDNpiNzm87staDQ/SynyUyJFICvUqqbTPK0P7LpTtHNM
	8hkJaRoDEdyyHRt3nc0MQQuM1NO8Q4AlQgmzBIvUUicMaZ9PWN04XnWhOpBBLIOLZNgeGU
	ci1aCq0xiqj0RJ+5Elu5hWgvSxRWmJEfLm/ZKKNRVelBFmeO0XBX++N7XAgxQNQsc752LQ
	ElglzPrSIttc1xXmZKSIchxTX3BzZNaN0Fe8XgBRU/lxrL21997WwOPF5Aaf2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Elad Nachman <enachman@marvell.com>,
	Aviram Dali <aviramd@marvell.com>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: add missing layouts
Date: Mon,  2 Jan 2023 12:20:29 +0100
Message-Id: <20230102112029.250891-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216162715.3230766-1-vadym.kochan@plvision.eu>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'68c18dae68881054ed5426c00f0ed351b1db9bc0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_032035_155152_87E53EF4 
X-CRM114-Status: UNSURE (   9.11  )
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

On Fri, 2022-12-16 at 16:27:15 UTC, Vadym Kochan wrote:
> From: Aviram Dali <aviramd@marvell.com>
> 
> A missing layouts were added to the driver to support NAND flashes
> with ECC layouts of 12 or 16 with page sized of 2048, 4096 or 8192.
> 
> Usually theses are rare layouts, but in Marvell AC5 driver, the ECC
> level is set according to the spare area, so we may use these layouts
> more frequently.
> 
> Signed-off-by: Aviram Dali <aviramd@marvell.com>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
