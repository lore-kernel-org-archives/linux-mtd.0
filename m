Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6363EC54EBD
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4VMEYPGUdNTKx52rRFl8uiE1uP3PeZJNrzQzURJDr0o=; b=IFClCI6aXmk/An
	cUiaQtmH/wk3iTAw1u+ARDV2qnwEpOJvlV5r2hMsS+sydlIJFFSz1g0A4BGA0IKQdrG5gFkDHLkpC
	zDODh+cHpty2UtbFKQlkyG0THJUhIX8EVobZkgNjHQLI3W8unyCfp5S0L9jL/pbdwmqivzGApARmF
	swIIpUIP0p5pEe2QUyodcmUzo/Awi2BPgYYE0ry5+DPhAwWYLXMtrrxg4NUg4PJvMPBARKpSWMw2D
	LnXO3DZ1LZ7a25/YbDdH2eMGN7C2fhK545c7lF4RISxA0WkMIT+ugL/Xg90bE5kh1dR6lr0yhPTOY
	DGVMoKlguMXWeb6hsG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFt91-00EAGR-SV; Thu, 12 Jan 2023 08:41:07 +0000
Received: from mail.glencoeaur.com ([217.61.97.113])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFt8w-00EAEM-DP
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2023 08:41:03 +0000
Received: by mail.glencoeaur.com (Postfix, from userid 1001)
	id DF4BB82293; Thu, 12 Jan 2023 08:40:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=glencoeaur.com;
	s=mail; t=1673512860;
	bh=2S0GQFScndXkBEK4sqdoOhOYLqsB2sEH8Q5XQfVvKpo=;
	h=Date:From:To:Subject:From;
	b=p7EvYO+5ik/l8oSkE6JEX95+JfuNiHPcXw1eTvsVfvVVFsYAveYiPxsRaEDf5tsM/
	 mACSxaFVbdFWNjm9fD54Vo/N9gtBVTneQay9rnPFekBnorr1ucQlycex3RCh/g0loK
	 CdNNkpYDs6QAgYXRYA8RRDjLD4Mx7iqv2W/+HOmdEm9c5CIR8zkHgLI2KG06stlIK/
	 AXOS5XkKJnrhxuSPp3u2115U4pg3UgRFa8iLtJgEdH6gTEwqSV4KI0rR8TCDmYMyO3
	 qJRh+OJhGgF14aeaglfIL6S27w9EGw73uUxWdxyrw5GEaoq2ARDtoRhf9r+dicHDdq
	 4SMlAXyEQk7Gw==
Received: by mail.glencoeaur.com for <linux-mtd@lists.infradead.org>; Thu, 12 Jan 2023 08:40:39 GMT
Message-ID: <20230112074500-0.1.z.3gfb.0.oruzflw4cx@glencoeaur.com>
Date: Thu, 12 Jan 2023 08:40:39 GMT
From: "Zbynek Spacek" <zbynek.spacek@glencoeaur.com>
To: <linux-mtd@lists.infradead.org>
Subject: Silikonmischungen
X-Mailer: mail.glencoeaur.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_004102_599213_BFB7A516 
X-CRM114-Status: UNSURE (   1.65  )
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

Good morning,

do you need intermediates for processing, plastics (e.g. rubber) or silicone mixtures?

We provide a wide range of silicone rubbers with various properties, silicone mixtures from renowned manufacturers such as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive additives.

We also produce technical silicone compounds with increased resistance to oils, resistant to high temperatures and water vapor, conductive and many more.

We provide fast order fulfillment, timely deliveries and cost optimization.

Can I introduce what we can offer you?


Best regards
Zbynek Spacek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
