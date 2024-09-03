Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38F1CD3420
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Qvcp1E57uD3AnOeYmx1erNF8E+lmi3VH/WGl37KaGk=; b=fdcuAgJ0Vm4nkm
	wjxtpXOArgzB6QmD4NjyVAvhmDhyUvXmxT8urpVAR/1vKQVIolAqLpJ626o3zuc0YFZfmkexfVRL3
	seRiBjntIG0vzw2bwSp2NTG2Pt8Cr9YbOYi0j6a/FWy9LZPgEwfvpTTHNVlobQAzZ22tbsfT1uUP/
	r14Zggf4Nc2KtIskuowXZ5r5mM00g4OyR4VJ1Qu4qjIgBsc6OvPy6m/PlrD9cNyj7I8uE9ksMLaCr
	CEYm5o+bqGwNjHolo9bu0YAkMwvlzUICqErPEH9Tv05b0DW5594CxYUYMSlxxRIwC4sfxZ+sZHLj9
	IE9dOzlkxl1fl+Y2bQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQdv-0000000HJYh-3Yne;
	Tue, 03 Sep 2024 10:20:11 +0000
Received: from mod.modforum.org ([192.254.136.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQd1-0000000HJLP-3OLs
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 10:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=basantfashion.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4BItOc8k/hB4suOfWWwTOg/U0FTlHwyCNnKCLPge2w=; b=Neps7BMMmN5AB+Kh5GhcClIKOL
	1oapck4QBLTWsj0PR8c7Yh0kCKfnB7QEd/x6kyWfv6be/lWdi3y6Nqh/KD673g/B/RzvOhF/DOa6g
	G8BlyAM+kZuHwWHUTyfxqrcHFryu7H22dB/EWOQB/v8WoULrdp3SFSgU2j00g46L0OEZZcRFNByEH
	qyQoBs+1AoVkhEQh8qN4zezOYgBOUpdNQzyQmXynUTuUyw7W4xLVe0qW6TegIOkV8vMCPWcqYBupg
	ub8VeUOD3L5RhtE4GWh8Tvwej0v4qV/dritL6Mfl37560J6P7S+uElihBlxaUOExeu1adlG2qYa1a
	5DRRfZOA==;
Received: from [162.244.210.121] (port=51302)
	by mod.modforum.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <kuljeet@basantfashion.com>)
	id 1slQc6-0004mp-Uq
	for linux-mtd@lists.infradead.org; Tue, 03 Sep 2024 05:18:19 -0500
From: MERCURIA  <kuljeet@basantfashion.com>
To: linux-mtd@lists.infradead.org
Subject: Request for Quote and Meeting Availability
Date: 3 Sep 2024 03:19:14 -0700
Message-ID: <20240903031914.E6C5EC4D158CF703@basantfashion.com>
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
X-CRM114-CacheID: sfid-20240903_031915_884217_1BEAC20D 
X-CRM114-Status: UNSURE (  -1.66  )
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
