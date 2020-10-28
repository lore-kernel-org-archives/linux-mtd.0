Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8307C4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 11:52:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394BC246CC
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 11:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="omOXZWWI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=storvalley.com header.i=@storvalley.com header.b="xPrOJoKQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 394BC246CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=storvalley.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:To:Subject:Content-Description:
	MIME-Version:Message-Id:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nmsgQv39NKdE6KK/UgMVdHSl35AdozeYkw62HHaskGY=; b=omOXZWWI9bFPghzAhAn1Qq546p
	DPKZQA9gLFvA6On3QRUS+lUuKQFjDq6aEg60mKgFjxYwGpmLGnDDfQ00Iv+Bo+uM51kKIeySwGyIW
	DJxlSrF2qOIB26N2X6f9OwogXfKpGjxtubX9zkP01oqOaouB/IVEYsf2j0k5nZKRTcrJZsqQsckoX
	rSVfkkkm9VbrzgKutwerMGVwRciOYHPcL0py7hK8NAqioVHwm89zzSwWhHWPOjREhZqJwynvm5nZI
	XqoVsPzLQvQIIK5Z4fawtew0p5nP9VR/6j3w3Rehm08MXlnw+2Ks8QNUpKfD7dfYlxents6WAogt2
	OAeKxj7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXjzY-0003Xh-4w; Wed, 28 Oct 2020 11:51:48 +0000
Received: from svmail.storvalley.com ([222.122.31.103])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXjzV-0003Wm-4m
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 11:51:46 +0000
Received: from [188.68.250.180] (n8250h180.sprintdatacenter.net
 [188.68.250.180]) (authenticated bits=0)
 by svmail.storvalley.com (8.14.4/8.14.4) with ESMTP id 09S2hKCb016869
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 11:43:51 +0900
DKIM-Filter: OpenDKIM Filter v2.11.0 svmail.storvalley.com 09S2hKCb016869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storvalley.com;
 s=default; t=1603853031;
 bh=HtN5cWjVGyrvp9njBVMcjP4H6vCLGkznIMtsaDHfWy0=;
 h=Subject:To:From:Date:Reply-To:From;
 b=xPrOJoKQk5FMOQcBWro39BNd76YaYn8NYq9bwDXAFvIA5YkTz2iQVwMvfFTQtemM/
 Mk+OCoTwkuo2AJToI2biKXTnfisrhMiEe8RJ0F4ExSO67wzQpJVmDbKXA0/Mjsf3Ke
 1TGmjqp6CnM9osgj/HxQEw9OZhfvuCXdeJ+tsnto=
Message-Id: <202010280243.09S2hKCb016869@svmail.storvalley.com>
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Empowerment Grant.
To: linux-mtd@lists.infradead.org
From: "INTERNATIONAL MONETARY FUND" <management@storvalley.com>
Date: Tue, 27 Oct 2020 19:43:43 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_075145_605235_EF0AB0A9 
X-CRM114-Status: UNSURE (  -0.70  )
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
Reply-To: carla.grasso@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

INTERNATIONAL MONETARY FUND (IMF)
700 19th Street, N.W.
Washington, D.C. 20431,
U.S.A.

IMF OFFICIAL EMPOWERMENT GRANT AND DONATION PROGRAMME 2020: -

FOR MORE INFORMATION: https://www.imf.org/external/np/cpac/gandd.htm

REFFERENCE: IMF/WDC/1109/0320

We have selected you to receive a donation from us, email back for more information.

Email: carla.grasso(AT)imfgrantunit.org

Kindly confirm the receipt of this e-mail.

Yours in service,
KRISTALINA I. GEORGIEVA-KINOVA
MANAGING DIRECTOR,
INTERNATIONAL MONETARY FUND (IMF).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
