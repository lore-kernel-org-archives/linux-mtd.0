Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA227C05027
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljyIbo0JNDlEbe433uZqZ9XLlRWjEsaUGXtoGtF5H8s=; b=TE7o3w8Wq76PV+
	wpKISL1CmP7PwPgUcw0+wq0ZGdVxU9UlIDuUPmZKOcTEQC/UIIOJq/4nN3f003/XdYusWLn/bae4R
	aQUgQRHqunZfOK8Ic0yPByZbg3FsarQ2Gc2FwmgsEH1O80txiPeTv+heL0C5D5M1g0vpcXJIqskeJ
	gQBONfwHS9sAEQk7POWHeWa68ltRA4SKxe/kVMQFYkc2N8fLtcPerwUM4II92JFjKEqL3OivFZs+x
	InFqnru9cLLAeakqmwnHLrw6P+2WcC/pS0n4T3Rr8pWYMxmUVV1i5vbGGAQcMM3ZeL9uXDc8yl0nl
	kaUWs5e15nRmg/0zkeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRxyL-002klO-MB; Tue, 14 Feb 2023 16:16:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRxyJ-002kjt-2x
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 16:16:00 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pRxyE-0005lS-0D;
	Tue, 14 Feb 2023 17:15:54 +0100
Date: Tue, 14 Feb 2023 16:15:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/2] ubi: wire up parent device
Message-ID: <Y+uztjxDdtFy6MJ4@makrotopia.org>
References: <cover.1671737443.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1671737443.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_081559_149300_CFA73A85 
X-CRM114-Status: GOOD (  18.08  )
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

Hi!

I've only recently noticed that this series is marked as 'Accepted' in
patchwork. However, I fail to find the commits in any public linux
tree, nor has patchwork sent the usual notification email informing me
about it being accepted.

Can it be that it has slipped under the table (or even the carpet)
somehow?

Please let me know if there is anything wrong with this series and/or
if I should re-submit it, or if I shall just wait for it to surface in
linux-mtd or linux-next.


Thank you!


Best regards


Daniel


On Thu, Dec 22, 2022 at 07:32:46PM +0000, Daniel Golle wrote:
> Wire up device parents of UBI devices and ubiblock devices (UBI volume
> devices are already correctly wired to their parent UBI device). This
> makes more sense than having UBI devices free-standing in
> /sys/devices/virtual/ubi/ without any connection to their parent MTD
> device, and ubiblock devices in /sys/devices/virtual/block/ which would
> be better hosted by the UBI volume device they belong to.
> 
> The purpose of these changes is to allow downstream tools to more
> easily identify UBI<->hardware relationship, and potentially also
> improve power management and scheduling performance in future.
> 
> Daniel Golle (2):
>   mtd: ubi: wire-up parent MTD device
>   mtd: ubi: block: wire-up device parent
> 
>  drivers/mtd/ubi/block.c | 2 +-
>  drivers/mtd/ubi/build.c | 1 +
>  drivers/mtd/ubi/kapi.c  | 1 +
>  include/linux/mtd/ubi.h | 1 +
>  4 files changed, 4 insertions(+), 1 deletion(-)
> 
> 
> base-commit: e45fb347b630ee76482fe938ba76cf8eab811290
> -- 
> 2.39.0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
