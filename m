Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0374CF6495
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtLRCuh2/HhOCkOTqTcKO08W902p4CKUP321/jFaMxw=; b=RGReAGAwdEKL+3
	nist+A9xSXDIinunxRlZ5/A9IHgigFuHAdteRjuTqpNlmtFnl+8NI62eigXP8RUwtQuHpNxC0Cz7a
	yh0dXOn09g7Q46pqV1X62i53NfZMBksNKAsTSwqVo4YxkF+sKXuCfaLTYFlTXXp5W4Hafr2KkMoEc
	pTBQW5nLslEG9LLQfoczpsd71Lo1psKTMqiH+mEQpUzCSfbvAGgnzXbWiassJs1q1IGpoaAD6yH+l
	TrwGx9VCHKtpOT6dbIIZ5H3ZaDgMpEN5kABqYQSqdcdlLcMugbGirI9MovQw93jTJcYEAVQL5hWT9
	1w8EYSQd2ABRND+f9Tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suxMl-0000000F4Xd-1DFQ;
	Sun, 29 Sep 2024 17:05:51 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suxM5-0000000F4Np-3LfL;
	Sun, 29 Sep 2024 17:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=zJoVyOezk87flQP/T1rSos3kBIbqevdYSEXyE/WYDJI=; b=EBo2Yob6sbucRYfk
	BLsjh54oBHEjhrLQtNgvOvjz/amc+KQrHrEbUx5bskLdfZ3lBzdBa3S0F4OYQChomNI7uk3VZbUvm
	FVASiw9lpM207UxUx62KpMEjly+Dg6QO8xzv/7J+dYQEFtnwFNpVpvVMDyaLhiGC/sSCtSmmbBoH1
	K/Zw/KUkJFPzLudaAxRJ/VgQOz8aEy/f9O64+dbvFqiOjofOFLW8y51tv25sqCVK1o9Y+SYx9oQmd
	6YlzgPEyKr0o+n2SHI+qt9ThIzl9ab/JJuOzeR/+aO6/CDYVFJkCikQskWyI3XuhhB1/Lng5cXaim
	wIrmTZfabkYwhgrClw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1suxLx-007pnh-38;
	Sun, 29 Sep 2024 17:05:01 +0000
Date: Sun, 29 Sep 2024 17:05:01 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: boris.brezillon@collabora.com
Cc: nicolas.ferre@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: of atmel_pmecc_destroy_user
Message-ID: <ZvmIvRJCf6VhHvpo@gallifrey>
MIME-Version: 1.0
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 16:56:56 up 144 days,  4:10,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_100509_944478_712C5C9D 
X-CRM114-Status: UNSURE (   6.72  )
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

Hi Boris and co,
  One of my scripts noticed that 'atmel_pmecc_destroy_user'
isn't called anywhere; I was going to delete it, but hmm, I wonder
if it's actually a missing call and leaking (in the unlikely case
the device was ever removed).

It was added by your:
  commit f88fc122cc34c2545dec9562eaab121494e401ef
  Author: Boris Brezillon <bbrezillon@kernel.org>
  Date:   Thu Mar 16 09:02:40 2017 +0100

    mtd: nand: Cleanup/rework the atmel_nand driver

and I see the allocation in:
     user = kzalloc(size, GFP_KERNEL);
       in
     nand->pmecc = atmel_pmecc_create_user(nc->pmecc, &req);
       called in atmel_nand_pmecc_init
         from atmel_nand_ecc_init
           from atmel_hsmc_nand_ecc_init
 
But I don't see any freeing.

(I don't knowingly have hardware to test a fix, although I guess
there's probably one somewhere....)

Suggestions?

Thanks,

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
