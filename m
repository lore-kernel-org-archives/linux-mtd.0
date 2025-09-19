Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85066CAC592
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Sep 2025 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:From:Date:
	Reply-To:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V2VJZDpx8RxI61zhzitQASDGj9x83HqrS1Bsuv+/6+Y=; b=JvPQGXO2FhTTQt
	2rUDggd36lfUTQBSX7NrhRZOLNmwHGycSv8YzORsMX1alGI+U0qcZTWEmcht20FOV79Z2Qdws5SXf
	UrHgJHIfx1SDliLsG5NXTQAcF89m/xiJvjwbI4VbtB95G+Xep2ydxLnM2h3kn8chHTOUHsypkvQJD
	GsdR93+vnjW4uBH+veBxJJdU5+wkBCVOL6TJueylwikfNzLAlipYCkElrYWZkM3CJQ8/K/LgD2F1F
	KkgGvx8LgKLsePkI5bF7z9a/KhLala7aiAoQuX85/vP0uZSapRDutMwPRqc5cJkSlaNT6OMqcuk3A
	Hb3FQ6n4scdu2tYdYV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze1K-00000003X3n-3SbK;
	Fri, 19 Sep 2025 16:31:38 +0000
Received: from [128.199.114.47] (helo=overlinux.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze1I-00000003X3H-3AZv
	for linux-mtd@lists.infradead.org;
	Fri, 19 Sep 2025 16:31:38 +0000
Received: from overlinux.com (localhost [127.0.0.1])
	by overlinux.com (8.15.2/8.15.2/Debian-10) with ESMTP id 58JGVY93004617
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2025 16:31:34 GMT
Received: (from root@localhost)
	by overlinux.com (8.15.2/8.15.2/Submit) id 58JGVYMU004616
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2025 16:31:34 GMT
Date: Fri, 19 Sep 2025 16:31:34 GMT
From: pulse <root@overlinux.com>
Message-Id: <202509191631.58JGVYMU004616@overlinux.com>
Subject: Hi. The helpful tool when top doesn't help.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_093137_138707_5AB5042C 
X-CRM114-Status: UNSURE (   6.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello.

I'm also a linux kernel dev. Once I really faced with situation when top was not enough.
If you would like to know how your server or workstation behaves under heavy load - 
this software could be quite useful. You could set a quota (80% by default)
and all processes which go higher would be logged. It helps when you monitor
your pc for a long time (top provides too much output).
Here is the link:

https://overlinux.com/spike-monitor/

Please feel free to try!

Regards.

P.S. I'm sorry for a cold email. I'm the author of software. Ask me if you have questions or send me a mail for not 
bothering you again. Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
