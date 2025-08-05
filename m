Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD536C87FCB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uDCAOiyYzxqY6xLkWnuCd+197Qxr9qRuF1EDDHCrsTM=; b=G0safiDbyMQ08K
	1I8ulyhTyL1flLyxeps7IqE6gIrw0qoYAjwUrP5VJfi98QTRSkI2Cem7wNtGJXi1+OWBfb9Ren43z
	nJIV43tD1LLtAtKn9hYI+3ObbooO9HqQzfFdreYQwJm4ddg9oUoj2gjk731R9X4Hw/nixQ6+ehD7d
	g4iuYrMphQ4vzflufu+JfmIas630hm9eN6wB6lpvkWNUnd83IoAtsPSfalIysW8J/CW9He54Eb8jU
	x69aZx3qMOLUymwbrNxalQHJju4qrrqEunPpk/I6BcJqVqFOeeA0IrAtyseTrErd8obzzeCgHl0Kv
	2LI7ghhEIVSM+GUt9urw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCUw-0000000C5Ve-3mnT;
	Tue, 05 Aug 2025 07:54:14 +0000
Received: from mail.tasknomic.com ([141.95.16.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCP3-0000000C40p-28gY
	for linux-mtd@lists.infradead.org;
	Tue, 05 Aug 2025 07:48:10 +0000
Received: by mail.tasknomic.com (Postfix, from userid 1002)
	id DD3DAA35AE; Tue,  5 Aug 2025 09:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tasknomic.com;
	s=mail; t=1754379944;
	bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=;
	h=Date:From:To:Subject:From;
	b=lz++2ER90NjtFrs4Dsiy1mJD9SdMfaxTPpwC6WoJmFTueuWxdmPvRshohRJxwElFA
	 SlG1Cf9dvJel7aYx0Z11LwTIXFWyx3MF8HHHgxXT4D9gLOx+ebBg4dbupDXslSXFzf
	 nm1xtPAE695hCeuTpuCL759D4GVzCRqakWocDZwsdQbm5Em6HGWpUBkDMIhf4oywId
	 4Hvxo4kf0mdecbAUx6gD4J1GL45gE+a5BaIWMJXdRq/hCgZUi8vTzxlPVp70ZH7ymk
	 y+bMVI0GfRneYogk1FaE8H92uCA9e7JMDNVjgTwVBS/hp48WmI4Wgmv2Wg6f9QzjYG
	 ji1qVKFK1qCJA==
Received: by mail.tasknomic.com for <linux-mtd@lists.infradead.org>; Tue,  5 Aug 2025 07:45:37 GMT
Message-ID: <20250805084500-0.1.kg.1fbxb.0.qlw36yjke9@tasknomic.com>
Date: Tue,  5 Aug 2025 07:45:37 GMT
From: "Jon Brennan" <jon.brennan@tasknomic.com>
To: <linux-mtd@lists.infradead.org>
Subject: Equipment - chairs
X-Mailer: mail.tasknomic.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004809_855305_7B3FDE60 
X-CRM114-Status: UNSURE (   2.06  )
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

Hi,

Do you offer a seat for corridors or waiting rooms?

The shortest possible length is about 12 cm, with a wide range of practical dimensions, with a little over a centimeter of space - with a small, large, large roof.

This is a solid and convenient solution that can be selected by furniture distributors, for use in public matters throughout Europe.

I will send you the specification or photos - can our product be used?


Sincerely,
Jon Brennan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
