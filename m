Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662A2C678DB
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30ytKjzsQx1mZIOihmPYbSM3Beu8LS18bCS6BJt0jcw=; b=PUSOvICU+eH3bJ
	UUuT+6v69YdBEU18+lNgPh3nheh6HThkKTQSSk1FviPdrD5uFwMmsJWQ3en2PZcnvnPm3hUOFnd4v
	NENkT41rQsbAJohLCY3uASqAxrK0CmN0XHHbE2Yp8LibIIS5cRWu9/2ZQRDiEDPKpmSB+fh4pUh7f
	VZ1zLlVEMWE/zP8IRVEw99KTk7+5uR411qd0bzibiuqZgymaKQX4DwAhcSQdKH3tuEw3wsISMCmfJ
	A/sBXZQ3YkyrQXDO9UoYIEl+zAvoOVoZBrX/Gb/muYW/aYNetDwvakhOGkbg/12VwSp53j6CqtzL4
	Z0CUEHLTMYI3pKdNXFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcuC-002DjT-U9; Tue, 07 Mar 2023 19:23:24 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcu9-002Dgy-V5
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:23:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4F39020002;
	Tue,  7 Mar 2023 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678216998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJJCv8W0ACpAYFHCo0idxfjeMs3ZN9nrZwLGXiNnvZY=;
	b=Wb/tQICvkHw95iQ58tZ4ewXTAX7wiGd3KCgGHicSyLRNwqYSrkuQbG6beKrj+Nz5iTLLI7
	cB2/vDImq0IxcMJDv9FXRTG0Kd3UBs6PwDuMual1f52BRz5xIYCDQwQ39uke8+SSCfJueD
	EkJVb8KpXUFVvjTe2ARcN2He1zSCZRWYZ5y+sbpRQaWMyYcgfzYxNWl1RMM3Jn18dl6Jxl
	kHz48Lb79OzaFUDAdQqv//SH0jxHn+nq4jIytwnksdl/MFEeCdzylHWXDos6In+jXd48w3
	Dyz/bwNqoL6ZsjsCky9/I5lj8s0vJxPMRcn7ECMjIqZR4ScuWsprczb3XWeyyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: core: fix error path for nvmem provider
Date: Tue,  7 Mar 2023 20:23:15 +0100
Message-Id: <20230307192315.353603-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306125805.678668-3-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'43782116d148e40caa0e04f1404db966347d4420'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112322_166841_5EF2854F 
X-CRM114-Status: UNSURE (   9.68  )
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

On Mon, 2023-03-06 at 12:58:04 UTC, Michael Walle wrote:
> If mtd_otp_nvmem_add() fails, the partitions won't be removed
> because there is simply no call to del_mtd_partitions().
> Unfortunately, add_mtd_partitions() will print all partitions to
> the kernel console. If mtd_otp_nvmem_add() returns -EPROBE_DEFER
> this would print the partitions multiple times to the kernel
> console. Instead move mtd_otp_nvmem_add() to the beginning of the
> function.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
