Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A4E6FE21
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3SURlaFyC42hajZGlG9cqita7kYLt4jBkOHWRrqDrA=; b=g3VsYM29/Xp/sR
	R9YauuvfcFoEtKC3x4L2acQ+S75gXEGU8l5sdNCa7HXmPyPjsMIEe3or5B7oemxvSEUZVM9ipTqp1
	1OoV7dIw5w1hJepkzPkiXvNAVAIJMGOhugz1t1r6FBbzuoI/hXXO6q1/aqFr9u4VDCCS45gYUAEFy
	enPX7JGVIdFV5zD9+JhJXUr53wdQ1ZwO5OfDStYG4aEHfJlwZGmZZbJLuZNNVTSTMXm9hmaweDJhR
	o1Gnos51aFT20e5VN3xDV25dzodn0AXZFzz18qIDx0Vw/YriwMWAyiCa3kVPw/5eIh1XMiqAjXBe6
	QwKnS8VoTRiiRNhM9BuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY5-0000000CgAs-1BMz;
	Fri, 06 Sep 2024 15:06:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUF-0000000Ceiy-1IM8
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 112131BF20C;
	Fri,  6 Sep 2024 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CozZXAs/sNCz9YVCOiOBwChRXR/K5Hx0ARk2sgDhuyM=;
	b=O12b0t+j3f6aAEGjO/MsLNGpXzgDAyiPxAlf71qVnotKqhyvnwx5eAnulN+c15kfl/4xsp
	AGipu+TU9ARqzHIpSdcPbfYANEi9Pow009BgKloBibpjBfIStJcDVWOM038CuovXiMRyb0
	0MzGhOUGXInLhDbaezPLI7DV1IvzV2jmMXx4srejPz/1WvGC6O3qzVfn7Wzyp3EDtnSN9h
	i6XRiVxbGsMZ3s2Ty/w71aifxVCClksLoBkJvTvwAgbc3GwuQ8thz/fJYQYTFK2JFABAwd
	SZxUBK/gzaKOPSM44MLtt41oWZoo/3676UEsMLWvbv8dIjIUCTxN9ARgWPQDWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 7/9] mtd: spi-nand: macronix: Extract the bitflip retrieval logic
Date: Fri,  6 Sep 2024 17:02:53 +0200
Message-ID: <20240906150253.734269-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'18073e395cd6d0de1427c4248380ccdbf937375d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080259_498576_5F48745E 
X-CRM114-Status: UNSURE (   9.64  )
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

On Mon, 2024-08-26 at 10:14:10 UTC, Miquel Raynal wrote:
> With GET_STATUS commands, SPI-NAND devices can tell the status of the
> last read operation, in particular if there was:
> - no bitflips
> - corrected bitflips
> - uncorrectable bitflips
> 
> The next step then to read an ECC status register and retrieve the
> amount of bitflips, when relevant, if possible. The logic used here
> works well for now, but will no longer apply to continuous reads. In
> order to prepare the introduction of continuous reads, let's factorize
> out the code that is specific to single-page reads.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
