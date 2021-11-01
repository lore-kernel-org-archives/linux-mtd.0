Return-Path: <SRS0=1Z3h=PU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3B7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 08:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47B066058D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 08:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47B066058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBSNhxLtS5UjZlJHefznvmLpmrahAkjQEEB4BVSYnwA=; b=vGGSJSsKEGahRM
	uSHly3cwyZ/11mZPabqkSO2u6g438DescBPlhPoV9dhdMPXJcdSjlf5qnnXLxiAzN+JQ6BE0k7NYq
	WxD8IBPvAeO9GgmVZE1gEw4U+3mRbpJAg91Lq5SEog/5NXe1+r3FvhfuQNfCUER0HMYZMOTt9piZC
	nJG//R+ctesTrRrweqKcL/qpwV9N2BLTzTWfTod+onOyX659GZcp+KDn7YWrj8N4XgkPDZoK7mRzo
	qRt1JH+0BvJrzIPgNBgX5Qr+gCAjRIVeFiSucncIQBFREH5ppTtPwbsAGDtdyrzz/zPTNaebeJGnf
	sf1RgKqYi5FeA3lCxpXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSxi-00FhhZ-GZ; Mon, 01 Nov 2021 08:46:38 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSxc-00FhfS-Ht
 for linux-mtd@lists.infradead.org; Mon, 01 Nov 2021 08:46:36 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id E567BD67A8;
 Mon,  1 Nov 2021 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1635756385; bh=qdJTJ4CPDrPjfrnJBTByEIdvM1m6Qg5yx5K523AlXXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=GCtcjycbJl3C/4nAE3IqLI264dlNq7UPcV/1hDtFGSbF8aakLclr99bklD2TpAhiv
 pLk7ptUWdT0FTLv2fgC/yh3tOISJfe+VxISPJyoa4aCKmWe+vkHJHMuwaXRnIb/2tF
 yWXT1SbThjb5ITL4MKlQdaHey43kO6xLbdOddUeDUU8MZ5099MKZ1oDSXwlpgMgDGA
 hX9kYPyuHapdhC0chyahO3qamlzixKHrkcOcqBlCvQq5RlFwy0DmDH7KWyRmlh7Hga
 BRtW705rsSnFQBoQKtpFCIZJuDlWtIjw93yyJhyAXrppVgxSqTgrCIJvUA5ieRP1gy
 cEdCT+NHD9ppw==
Date: Mon, 1 Nov 2021 09:46:23 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mtd: rawnand: nand_bbt: hide suspend/resume hooks
 while scanning bbt
Message-ID: <20211101084623.xrpwwvweez24svib@skn-laptop>
References: <20211026055551.3053598-1-sean@geanix.com>
 <20211026055551.3053598-2-sean@geanix.com>
 <20211101083824.236b9983@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211101083824.236b9983@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_014632_787463_3B8C1480 
X-CRM114-Status: GOOD (  13.26  )
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

On Mon, Nov 01, 2021 at 08:38:24AM +0100, Boris Brezillon wrote:
> On Tue, 26 Oct 2021 07:55:48 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > The BBT scan logic use the MTD helpers before the MTD layer had a
> > chance to initialize the device, and that leads to issues when
> > accessing the uninitialized suspend lock. Let's temporarily set the
> > suspend/resume hooks to NULL to skip the lock acquire/release step.
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> 
> I think I already mentioned this Fixes tag should not be there.
> 

No, I didn't recall that, but nevermind :)

Hmm when ('mtd: core: protect access to MTD devices while in suspend')
is backported we want to live with the use before init of the rwsem?

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
