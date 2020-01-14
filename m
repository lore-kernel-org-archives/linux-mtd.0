Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15831C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F7124656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VXIonKKQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F7124656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIepQzBuqGR/r39EvJ97v8OmOuBzxNxSkYl0yBPjAjI=; b=VXIonKKQ2/EbZv
	IrJ6dEk1PVr5OQ0xgi3sjqiLzS9mkRThqWx0vNTdGyxBql/qec5B1ME1SvIEBnqA5vjKvfw5evJ57
	t/yrQKltPJons1tWZXlKHV60Aan1fQD4pEeI+V089lugSjAFMzFYfVPtiBL9VEQs2k6yF2457pUU+
	IfZ9TU8GOozyECWnmAW+xzUyNrXL07SHFGftsd8b381nwKU8SlESejwWG/oxoM8tyLKorXiJu7m8v
	U6NGu4XA8r2CiLygtudriC4lwWbF8B+xboGirq6zAwvzuquOERd3UObS6JFibMQkgxP6ytXbsIJ7R
	WTIh1p6bEAjmvn7x5ibA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPfd-0002Ci-05; Tue, 14 Jan 2020 17:08:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPdd-0000SV-BE
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:06:02 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D137B200009;
 Tue, 14 Jan 2020 17:05:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 5/5] mtd: rawnand: denali: remove hard-coded
 DENALI_DEFAULT_OOB_SKIP_BYTES
Date: Tue, 14 Jan 2020 18:05:34 +0100
Message-Id: <20200114170534.1622-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220113155.28177-6-yamada.masahiro@socionext.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: cd038db7b0f092b225c61ee2648ab3c2efc1fbfc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090557_521017_E3316BB1 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2019-12-20 at 11:31:55 UTC, Masahiro Yamada wrote:
> As commit 0d55c668b218 (mtd: rawnand: denali: set SPARE_AREA_SKIP_BYTES
> register to 8 if unset") says, there were three solutions discussed:
> 
>   [1] Add a DT property to specify the skipped bytes in OOB
>   [2] Associate the preferred value with compatible
>   [3] Hard-code the default value in the driver
> 
> At that time, [3] was chosen because I did not have enough information
> about the other platforms than UniPhier.
> 
> That commit also says "The preferred value may vary by platform. If so,
> please trade up to a different solution." My intention was to replace
> [3] with [2], not keep both [2] and [3].
> 
> Now that we have switched to [2] for SOCFPGA's SPARE_AREA_SKIP_BYTES=2,
> [3] should be removed. This should be OK because denali_pci.c just
> gets back to the original behavior.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
