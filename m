Return-Path: <SRS0=TlnG=ZO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F838C432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 01:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D318B2067D
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 01:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YfCwWtAz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=remaimodern.org header.i=@remaimodern.org header.b="uUldELjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D318B2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=remaimodern.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Date:To:From:MIME-Version:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dTHPuuhxxHTfAqHiESCwtk9VhzF7lylKOF8h/sysDfA=; b=YfCwWtAzghNoIG
	5gzEMoSOREtoFu6t9unoW6BUL/i8sATQ2OXIqhFtC73N8CC2NJeD36Pu2BsqkR6es5FOHrn6Itr35
	nS5BbdrNu9n6f3/9IgQ8lNBdklha7M03BDDRdgUK4eCPfzGWiHHIjgVeudHMczdL9wL2KqSsKB2UD
	9s5sgCdilWIzzfEXXk+7aEbylQ9c40XDLO/3Ma9b6kqxhaysgcdt7m/C4XZ149v1rA3GKTPUMUlEy
	ZHQV/sa6xnB8STe+UMWh5pomJv5t7zBe3KjpOdM+ckYl7TwN6CNuSE0X+0fUr5y8HxVVKcQwRljbA
	5KgHfg9YXvhpYnuazgqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXxWj-00015e-Jq; Fri, 22 Nov 2019 01:14:25 +0000
Received: from m263-mta1.wordfly.com ([72.5.51.125])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXxWf-00014y-Vh
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2019 01:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=remaimodern.org;
 s=wordfly02; t=1574385256;
 bh=YwpsNiuhNYgyTXZyq3HahAvseU3XBGEoUx2Qw4cjIEc=;
 h=Message-ID:From:To:Date:Subject:Content-Type;
 b=uUldELjHDeweJu82q0yY1LcpKyFZptzqJzzdy37Z6WbqZ6px02UslKfJC+OyHL9Nw
 dYodnL7sn+6SCZCZ/pdFwpCjN1/4TvFuVdqqStGhQECNkkYhwVDN0DMe/+qqH9IdaM
 0HEOhus9fu5Qg3WJO+MpDYTUpqtuUlwy4E3WCnpI=
X-MSFBL: u1taT9N6WKPt38/gfNxJMT8OHaIcQGrrKCx3Y6skM7I=|eyJiIjoiUmVtYWlNb2R
 lcm5NYXJrZXRpbmciLCJ1IjoiUmVtYWlNb2Rlcm4iLCJnIjoiZGVmYXVsdCIsInI
 iOiJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyJ9
Received: from [10.100.30.44] ([10.100.30.44:8015] helo=app4)
 by wf-vsmta5 (envelope-from <RemaiModern@response.wordfly.com>)
 (ecelerity 4.2.38.62370 r(:)) with ESMTP
 id 1F/C5-02642-86637DD5; Thu, 21 Nov 2019 17:14:16 -0800
X-Binding-ID: RemaiModernMarketing
Message-ID: <1F.C5.02642.86637DD5@wf-vsmta5>
Signing-Domain: remaimodern.org
Signing-Selector: wordfly02
MIME-Version: 1.0
From: "Remai Modern" <info@remaimodern.org>
To: linux-mtd@lists.infradead.org
Date: 21 Nov 2019 17:14:16 -0800
Subject: Please Confirm Your Subscription
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_171422_866061_66A7F739 
X-CRM114-Status: UNSURE (   2.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Thank you for your interest in Remai Modern.

To complete your subscription, click below.

http://email.wordfly.com/join/remaimodern/4971c508-75f2-46f9-9021-cf25fac67b7d

If you've changed your mind or received this in error, please disregard. You will not be added to our list unless you click the link.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
