Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D76C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF0060FD8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EF0060FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGOZ1vyHGsiPHcYWe3xQP10MO+9MNjXVpyAqVs9PPDc=; b=bO/uvMOeJPVZPG
	zdE23C5aYKpBw8QFWZZ7XlXHH0wLLmPlOLfbd5VrGxsRWZzc5musj480++MrAZnb+Qkw/Nmm+pVmI
	dcW1eiiNJkPw2Xdk02mAR6EZXOv3VeUjsYMQYCW6sqGRJpdos4+I02dwqaSyHe1b6y/2X30vZdgEh
	1YLsmHu1GuAb3nWnIF2oldqtq0/w0Ej3XQ53GdLtN/JUeDGYfj29jARUxSpLmkvhqej88bZX0z+3n
	DHy7gxUCY7uvsVj9hV7ttHhvB8IQW3ZUmZc1YBPfFZOnFt03Iw1inS03IVp1+T6exjyeRVAIZ1HVY
	b4+57kt8LGnOKMMqK8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7g2-003xKX-M3; Wed, 20 Oct 2021 09:14:26 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7fz-003xJ6-Fr
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 09:14:24 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id BA31EC7EE1;
 Wed, 20 Oct 2021 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634721260; bh=ZabwtyWaVUk5ppsPWi4gApmZlTAIjycNIe5rm6VQtHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=i4srVLdEtbJ23PO4E2matoE2PZy7M6NVHaT5kwgviXCeKwl/odiN0UwbhmxcL6Sex
 9LzP9zgOKJNXRvJJArLCLHeul4oW8EfhjYPuaZKfFXrBrPtQHbQwYq03iQR7xnb5D7
 lF/uXBTpFnV03kmsWsvZwhJjH4UKI+FbSIKBE1W/3yan9OKWyvI8SVmgwgqs3pVPwj
 ar0FbtlIY/2ry4+by82gEmhYgtLt/0YUCSY1DpNp4vL3+9Tf2J+sDWQ78M9FssoDJe
 /ymJ0WY9gIv9G0nM+CKkM2xkCE//osuIFZDM3LpAOaaoLmX2v3bRj3jDW331NIzvwy
 EvOQUysYwZgKg==
Date: Wed, 20 Oct 2021 11:14:19 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mtd: rawnand: remove suspended check
Message-ID: <20211020091419.2ufd4modeopmpxsp@skn-laptop>
References: <20211020084534.2472305-1-sean@geanix.com>
 <20211020084534.2472305-4-sean@geanix.com>
 <20211020105743.225d97f4@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020105743.225d97f4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_021423_697498_FF1F4BA4 
X-CRM114-Status: UNSURE (   8.33  )
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

On Wed, Oct 20, 2021 at 10:57:43AM +0200, Boris Brezillon wrote:
> On Wed, 20 Oct 2021 10:45:33 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > Access is protected in upper MTD layer when MTD devices are suspended.
> 
> I think it deserves more explanation.
> 

Access is protected in upper MTD layer when MTD devices are suspended.

Commit ("mtd: core: protect access to MTD devices while in suspend")
introduces access protection, so it's safe to remove suspended checks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
