Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80A5CD3420
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Qvcp1E57uD3AnOeYmx1erNF8E+lmi3VH/WGl37KaGk=; b=q2WDMOmIzJbIxa
	mATcB2t71kWx+ecphHrDn7aaSRfK+zfewimc6vVN4ZxZ1XJE6/S06rM7qsYaemY1+6ZbHuycdKgWL
	gGV6GEmJL5JUkjTm9Yyr8S8KeHd8FlKiqfb86TneJmm/nqW6elPelkcs2JS4PNjqmmKCzxa3BphgK
	+WtLWhAKGnExa7yed4UjuFrgjLXeFUxDslLKibwjYmKGq48NGtKaEbyyTm+6AaWQdyulfh6+4mClW
	CYCbWJdNiHJQX1zG148EOb16A8Qqv00GbAQ0/wm3grt7rbC9BQJWErecrjOsN86PYvbsKv/fftod4
	gLbud6LYDMgV97pqy6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slRRm-0000000HUHN-19Q1;
	Tue, 03 Sep 2024 11:11:42 +0000
Received: from mod.modforum.org ([192.254.136.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slRRh-0000000HUFX-3Ueo
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 11:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=gIYHaKxcJQmK6hENvKIZuvbd0U
	tSfrFpohAljl5ryT51teZq9Q+nEMZzPPoCOuwrr8E/jMsODdeZzGFKyHxN4vNiClyYpcQrjDV5lWi
	N53qKgFDjNVhAR+vAylgm1zRsZuNwtbqN1BVBZ6y+TjOEN7oGPzie2fmX30HTFI+QnP/rF4d59eYk
	kaMlLjWHRkrjJzX/yMYnxGBQuxYqPEN/O3cVMqBOyansWbDzIYLjsL2rHtKqM69HsK7m4h0/iQR08
	/2uu7klp1c9Y6HYWFPqj3iEzPvsuhIklaS1yQzHJ9XqvHA6OxsAHYaDeg59TJAOVQZl6IPZO10FdP
	CDxdjabg==;
Received: from [162.244.210.121] (port=50056)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1slRQl-00033B-UF
	for linux-mtd@lists.infradead.org; Tue, 03 Sep 2024 06:10:40 -0500
From: MERCURIA  <kuljeet@basantfashion.com>
To: linux-mtd@lists.infradead.org
Subject: Request for Quote and Meeting Availability
Date: 3 Sep 2024 04:11:34 -0700
Message-ID: <20240903041134.CC8A904D8ACF56F0@basantfashion.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mod.modforum.org
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - basantfashion.com
X-Get-Message-Sender-Via: mod.modforum.org: authenticated_id: kuljeet@basantfashion.com
X-Authenticated-Sender: mod.modforum.org: kuljeet@basantfashion.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_041139_628490_AA4D6915 
X-CRM114-Status: UNSURE (  -1.56  )
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
Reply-To: procurement@mercuira.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Greetings,

I hope you are doing great.

We have reviewed your products on your website, and several items 
have caught our interest. We would like to request a quote the 
following

Can you ship to the United States?

What are your best prices?

What support do you provide?

We are also interested in your services for this project.

Could you let us know your availability for a virtual meeting on 
Zoom to discuss this project further?

Please advise us on these matters so that we can prepare a 
meeting notice for our company executives to effectively engage 
with you.

Thank you for your attention to this inquiry. We look forward to 
your prompt response.

Best regards,

Nina Petrova
Procurement Manager
Email: procurement@mercuira.com
12 Marina View, Asia Square Tower 2, #26-01, Singapore, 018961
Phone: +65 641 1080

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
