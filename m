Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE85C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 21:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OJownQvfx+OgsOzKvwkysfe8wAKBw3XRWXSVjNi0+ak=; b=aKytH19j4Z3ibZYWuydQtky/7M
	eyleHAe2PFkGU7I7U296ChpLQlh8CA+u14uMh9vvYXZjyI/F2Ap5tJvjpHB/0mgMLH2mCYIlb8flL
	2avH5JVmBYrA9H0cmKvJifn8j5bhgIHsrFJYGpuiBLk+PenDBLWuRNqn/NW6SAJAMIorQ8v9WUz9v
	TRUltx6653/NSJ4TbTgWWcHBJN//5B+VvY1HxPKWKC4GA+gdKb7MyEDUN+IEqY7ITVCFmw5KmF6Do
	qrxy0tgWaD5RcIXgFYLdwjmMlSHbyeMGjsl0OkrX43Slfvo/pX86ni55EIraxQy+bn0rm0faMTeko
	U8OjjZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phdQa-001u9j-06;
	Wed, 29 Mar 2023 21:33:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phdQW-001u8e-2B
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 21:33:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8E6B760719A6;
	Wed, 29 Mar 2023 23:33:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2anPznKkB6Ly; Wed, 29 Mar 2023 23:33:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E19E8609D2FA;
	Wed, 29 Mar 2023 23:33:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Jhtf2j6S2kn1; Wed, 29 Mar 2023 23:33:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C3AE764548A7;
	Wed, 29 Mar 2023 23:33:40 +0200 (CEST)
Date: Wed, 29 Mar 2023 23:33:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Nicolas Schichan <nschichan@freebox.fr>, 
	George Kennedy <george.kennedy@oracle.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <53992166.434647.1680125620704.JavaMail.zimbra@nod.at>
In-Reply-To: <20230329175421.3bd4906e@xps-13>
References: <20230306013308.3884777-1-chengzhihao1@huawei.com> <20230324161923.1456371-1-nschichan@freebox.fr> <2c2c2ce9-795b-4f76-cde9-db4a4066dcc1@huawei.com> <20230329175421.3bd4906e@xps-13>
Subject: Re: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix failure attaching when vid_hdr offset equals to (sub)page size
Thread-Index: XAujqRaYgCyfoBWH7qHDWkn/zHQjaw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_143352_885072_876181DD 
X-CRM114-Status: UNSURE (   2.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBUaGFua3MgZm9yIHRlc3RpbmcuCj4+IAo+PiA+
IFRlc3RlZC1ieTogTmljb2xhcyBTY2hpY2hhbiA8bnNjaGljaGFuQGZyZWVib3guZnI+Cj4gCj4g
U2FtZSBoZXJlLgo+IAo+IFRlc3RlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gIyB2NS4xMCwgdjQuMTkKCkFwcGxpZWQgdG8gbmV4dCwgUFIgd2lsbCBmb2xs
b3cgc29vbi4KClRoYW5rcyBldmVyeW9uZSEKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
