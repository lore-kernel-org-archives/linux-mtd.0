Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D629CD98D2
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cn3J7/XDn86AptbPCzI6c6O5MSSwZC3Ab6GmMnqu4es=; b=TBSdBWcUJlbrhj
	MWFyHtdSSyHHt4pCdkaOQAXq1k5w209s6KxIG6rwx9wa3cS7SUmQn3hNGPLUX0d85XT78eGg9ZXbX
	KgJ7eEJX5FcsER7uDJTdi6LRC6R0q9oVxOyiu3h/z3964w9cDv3kM2Y4+XZWG/z839Fgza6zIvclc
	ZsRAcFobsWd0kdehIeakzdlOmSkCDb6hC0Js83OjCnflcHr9wSHx4Shuikp/l7ntc3Sdj3Hx+3YvY
	o2q5PMi/CQtGWtJD+zkTrg6mpQDkgXOMZxoCCRRI2SHhH0yVnk2LLeL3Nt8pXTOAlWmJwiCUGOJoW
	/SUpKRexyJ0N0vU5uNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaRg-0000000GJ4Q-1ttN;
	Tue, 16 Jun 2026 20:31:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaRc-0000000GJ3t-3sCC
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 20:31:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B101F4E42F1E;
	Tue, 16 Jun 2026 20:31:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F884601A9;
	Tue, 16 Jun 2026 20:31:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59C4C106CA091;
	Tue, 16 Jun 2026 22:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781641892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0K2dG7B+coSG/toMEOevtp202hxYMc2qlIGt7v5YEvY=;
	b=Hk+jd8sZXuFUzzfOtbcmCmh1Vb7+zsBcGgYIZi2o5HHkYzWOwK8VAzzAxuMKjfDGCAe+sD
	xiFNBSo27yg+KRPL+IQNGjDPasg35xF1wGT5PPMfsvCtDykjCIWINN929ZOAQz75lGYpmQ
	zcQ8leZ3zzgCylwtyR8Gl2DOYc4QwcvOq6WlGcEyINDrp/BGnh+S8FnwDxvcChf2FmehjS
	Birfta1umDLyDnmqnB9w+T/K+CN+iuRRBKgpuJ90a0jo2YNxYeu+9hPkXRC6eGbcF0i4IK
	W1HQjFWUr4zW19ebP1Vzn4mrF7F63bSj4dnk2Hd/mqUHa8GkVmg4d+N0RzZuiw==
Mime-Version: 1.0
Date: Tue, 16 Jun 2026 22:31:28 +0200
Message-Id: <DJARC89F2VJR.1EDEQ27GSDAK6@bootlin.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
Cc: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Amit Kumar Mahapatra"
 <amit.kumar-mahapatra@amd.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
To: "Dan Carpenter" <error27@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
 <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
 <ajEhuS8xwcX1AA_I@stanley.mountain>
In-Reply-To: <ajEhuS8xwcX1AA_I@stanley.mountain>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_133137_119002_B5D7C111 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue Jun 16, 2026 at 12:13 PM CEST, Dan Carpenter wrote:
> On Tue, Jun 16, 2026 at 11:51:53AM +0200, Luca Ceresoli wrote:
>> Issue 2: in mtd_virt_concat_destroy_joins():
>>
>> 	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
>> 		mtd = &item->concat->mtd; [0]
>> 		if (item->concat) { [1]
>>
>> At line [0] we dereference item->concat, but at line [1] we apparently
>> handle the case where item->concat can be NULL. Either [1] is always true
>> and we can remove the if(), or [1] can be false, so [0] is a bug and should
>> probably be moved to inside the if().
>
> That's not a dereference on line 0, it's pointer math.  So the code
> works.  But a lot of people find the distinction confusing.

Ah, indeed, you are right on both aspects: it's just pointer math (not a
bug) + it is confusing code.

So moving [0] inside the if() would be a readability improvement IMO, but
definitely not a bugfix.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
