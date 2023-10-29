Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C98C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Oct 2023 07:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGx7URyxYSUbXB8PurHKXxNAkkQ9NHrbQjpgKM3lDvM=; b=mOrj+K8Y+VMnA9
	41gfQs+cHAj0IKR8Q9EFR8jomYCYaBxntLY92lzxnEqYyYrR3bp1tVdnWxN6W7/LuQw3pl00Pj4u3
	6vfhdSoHVOWTc0OAYtxDnzd+FZVvvVdj9BaKWDyNWUaOb2KT5MxAHJgrqcHBU8sZqeHdHwT8XXisD
	7LtetD3AYd0QlTwkS3Ydn9VuCoXUjikolEwt9BSMOc5tK9HCugF96jTyyqHHI0LlbI0tFXKEYNVvX
	Jib7kFKSW5R5e2NOGIVITtAx5LbOooQLANui4211cJlyXYUbP8mkELZhA4f3x7PC296ngYflS23z/
	LQFbvd5F9EgPOfKDLhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx05y-001IeW-3C;
	Sun, 29 Oct 2023 07:20:27 +0000
Received: from mail-m25478.xmail.ntesmail.com ([103.129.254.78])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx05u-001Ido-0K
	for linux-mtd@lists.infradead.org;
	Sun, 29 Oct 2023 07:20:24 +0000
Received: from localhost.localdomain (unknown [58.61.140.248])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 37C2F800084;
	Sun, 29 Oct 2023 15:20:11 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: miquel.raynal@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	vigneshr@ti.com,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND flash
Date: Sun, 29 Oct 2023 15:20:05 +0800
Message-Id: <20231029072005.6097-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023095451.65c4c0ec@xps-13>
References: <20231023095451.65c4c0ec@xps-13>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDT0oaVkNCGkNKGEpPGExLTFUTARMWGhIXJBQOD1
	lXWRgSC1lBWU5DVU1KVUpPS1VJT0NZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VKS0tVS1kG
X-HM-Tid: 0a8b7a4df592b03akuuu37c2f800084
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohw6Mhw*SDw9ISlIPhpWOBMa
	CCkwFBpVSlVKTUJDTk1PS0pJS05KVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPS1VJT0NZV1kIAVlBSkpMTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_002022_341790_78068857 
X-CRM114-Status: UNSURE (   5.39  )
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

Hi Miquel,

> Any way you can detect this and fix the parameter page at run time
> instead?

Sorry but I don't know, I know very little about this.

Thanks,
Chukun

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
