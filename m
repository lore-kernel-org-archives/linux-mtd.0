Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C6FC54EEB
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 21:52:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B40A2070A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 21:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CKXMk57W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B40A2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNROdQ1VKN/lMlRaJPsSwrbyJmCRlSqg0VpY2CRYuF4=; b=CKXMk57WHawtQD
	coQ7Z5l1lEvxvX/7kZ9UHBPRfLvt/G0gyS4fs52LrO8Ps/1WtzT6EMRxFhOwhiPT7piqaxw7dLKX5
	X2xyrCRz4UYUnScsO3QB7mdI2M/EbeHBxvVKQCxP4otfgUWNwIaQw4cKCmU6gSCOj3ZU9LLm2UI86
	NVYYgPU53BbwvEPWJuGl1O5SXGgtnJZDibA66OU54W3+0N8r++BkffT5N1p3QgvX/ixG3oiJgfzLj
	ut/Ff98Gb3IMa0FsXznVnVftcrJbkr8Rs8wQbiBAvmk0+W5j92ctKIy5GkAQJpf9Pc2U2v78nr0ES
	2hclLP+yv5dFlHLZVeOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGrTN-0008A6-Bi; Tue, 24 Mar 2020 21:52:33 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGrTE-00082j-FD
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 21:52:26 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D7597FF808;
 Tue, 24 Mar 2020 21:52:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>, miquel.raynal@bootlin.com,
 vigneshr@ti.com
Subject: Re: [PATCH v5 1/2] mtd: spinand: toshiba: Rename function name to
 change suffix and prefix (8Gbit)
Date: Tue, 24 Mar 2020 22:52:18 +0100
Message-Id: <20200324215218.14182-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0dedd9869569a17625822dba87878254d253ba0e.1584949601.git.ytc-mb-yfuruyama7@kioxia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 6b49e58d6d9dab031a16af2af5439f28a37c4cd9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_145224_642788_CFAE03E8 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-03-24 at 06:49:44 UTC, Yoshio Furuyama wrote:
> The suffix was changed from "G" to "J" to classify between 1st generation
> and 2nd generation serial NAND devices (which now belong to the Kioxia
> brand).
> As reference that's
> 1st generation device of 1Gbit product is "TC58CVG0S3HRAIG"
> 2nd generation device of 1Gbit product is "TC58CVG0S3HRAIJ".
> 
> The 8Gbit type "TH58CxG3S0HRAIJ" is new to Kioxia's serial NAND lineup and
> the prefix was changed from "TC58" to "TH58".
> 
> Thus the functions were renamed from tc58cxgxsx_*() to tx58cxgxsxraix_*().
> 
> Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
