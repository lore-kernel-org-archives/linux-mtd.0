Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1644FCDB482
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLJV6WvWDZ6htpYkxM5jsun6lmBW07p8tENbdxVCNY0=; b=HBBraTRAVb/fNN
	XSTJi3dT1TpPb4ToCWjBd6EwxZK94NkxRpr6AmvinoWaud8aD1ziusL40c0wyL491earTLdDo1kSe
	fuQWYuRdCiPAVSG6UvtRvyFSYqD+KqXMqTNwvvsnEuzIs+QmQ9HbWLSPwauHL0gX9QYK2DsYsZq/8
	4SJ27+W9rGDUBX/bWAJ+dj0RcDhu78A/hzY/gJ37q4dC26GB0EM1kDKV8UgxysGAXOsi5pqg2kJe9
	rS1BADfR73t1GTr7xB3AK/s0phRdE6bEiIt72Hci/J1E/GHq5HgYUTKX04BXbh2d2I522vfA/Suc/
	nfaScV3mdFeieYYfDf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuR-0090ZT-1l;
	Mon, 16 Oct 2023 09:29:11 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuC-0090PC-2z
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:29:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B53AFF809;
	Mon, 16 Oct 2023 09:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcfKaPMk4ICJkrPPn/L7fgIsoFc6RYVQUdVPA9Z0ZZc=;
	b=VjRrvwb51Qdx/Ts76oInryFb8kRkNMoEXAFV5h3Taz7MB7FOqwITF+a5fFjWbCXxXjkoPK
	6unqVdNgFB/OaojhZHcYU3TkpwhNZthYgG/ggRskZC8v6tcdrbyiagW/RALQ2Nu6A4OMZy
	87KZj7VB+CZiukPiNqtjfy4/h2kyD9lBffrX4rZvdrahZj9o66NTadfz6YzFYjNNUJ8nfp
	8wWweVTCWxOfhHHU49PeS3BZ74OGyy7If+ZCKvBaiOLC65bxxUVwpK7SlQYYdVtC9/I/rB
	+QsS4NEOpFr9TvEwhVyXF0JRYhWXlBC0qfC7XAaQyUMWHnbn9KoqdcC9AZQShQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sridharan S N <quic_sridsn@quicinc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	frieder.schrempf@kontron.de,
	mikhail.kshevetskiy@iopsys.eu,
	olivier.maignial@hotmail.fr,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>
Subject: Re: [PATCH] mtd: spinand: winbond: add support for serial NAND flash
Date: Mon, 16 Oct 2023 11:28:52 +0200
Message-Id: <20231016092852.289052-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012064134.4068621-1-quic_sridsn@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6a804fb72de56d6a99b799f565ae45f2cec7cd55'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022857_123526_127B5FAC 
X-CRM114-Status: UNSURE (   5.40  )
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

On Thu, 2023-10-12 at 06:41:34 UTC, Sridharan S N wrote:
> Add support for W25N01JW, W25N02JWZEIF, W25N512GW,
> W25N02KWZEIR and W25N01GWZEIG.
> 
> W25N02KWZEIR has 8b/512b on-die ECC capability and other
> four has 4b/512b on-die ECC capability.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
