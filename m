Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A513C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFJ3pUWFlK7JEKtHPcrtwoVmAA4bPvqTA9kfU0QrenA=; b=Exy22fb29W+XMZ
	a1p3Wany7UA/BY7xLkY//IyRKTCGeQgNynNs7MyIIpN8UILOmEvyYHWIsQujg8d84ZV9AP4tGwtO3
	FmOFr6topBpAHfyVVyYgnVXb57c/XHRuTr8DupE5szbQ/lOZ2Jwqi1iRrLaDh5FcxCtWqMdKZjj2F
	rLQp5TaBl5t/ZWK3zgF/OSVvyJ7N1cO4W5nIqv2/vpb4ldKPSVHqcqJJqQVmtKhGd9IZTDXOFFbv9
	rcsw+dhPHDXBp0eNCeVOL0McyRfLrkIegJeiE20KgNdGJp1Cm4uLJCtcusuIgNvcvokWA4gGtnrYn
	+JFQFK6Gv958ebvnnm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhROd-00C50H-B6; Thu, 21 Apr 2022 07:38:35 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRN0-00C3nd-NM
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 66B7C200005;
 Thu, 21 Apr 2022 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcmmP/mLzKChhaNOtMQBbNSkAdKKtxQNCcfdQN8wI2w=;
 b=fEkEPMDD2qdsb9mIfuJlPilsxBNDRaTbwDg8ONuXWFwlWr83/T3QomK3PFl7ksoqFzinxE
 EXirM1bkbJNfD0O4ZgubZKobzUBQhLr5UaOUWOlQcFCus94KQkmWu5uCQQYyqnV5GqQV7l
 qj8cZoG9kWiPLhsC0OJEBfYnCZS88BBsVtR9UPQdRd/HxSDO+OcySHPXejJrSvLAXSTD0P
 +G7MeY58VQ/TW44RxWcreuqIokOATwDGTt4xjUEeMAxbIi3Q4Qx8TmaP1jyKWHn6VC1W2P
 bjmkRt0QRkLJbr+dcD4UiiDo+sloLrToIh1vjqbEwL4JNOBlHW/avagXG6AH9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 5/5] mtd: rawnand: gpmi: Add large oob bch setting
 support
Date: Thu, 21 Apr 2022 09:36:51 +0200
Message-Id: <20220421073651.72491-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412025246.24269-6-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd9edc4bc67c4fd77b30d0a55bc84b775c2f00bab'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003654_942638_6E55A688 
X-CRM114-Status: UNSURE (   9.67  )
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

On Tue, 2022-04-12 at 02:52:46 UTC, Han Xu wrote:
> The code change proposes a new way to set bch geometry for large oob
> NAND (oobsize > 1KB). In this case, previous implementation can NOT
> guarantee the bad block mark always locates in data chunk, so we need a
> new way to do it. The general idea is,
> 
> 1.Try all ECC strength from the maximum ecc that controller can support
>   to minimum value required by NAND chip, any ECC strength makes the
>   BBM locate in data chunk can be eligible.
> 
> 2.If none of them works, using separate ECC for meta, which will add
>   one extra ecc with the same ECC strength as other data chunks. This
>   extra ECC can guarantee BBM located in data chunk, also we need to
>   check if oob can afford it.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
