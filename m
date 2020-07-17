Return-Path: <SRS0=UfuN=A5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_05,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DE1C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2020 05:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E48207FB
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2020 05:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIS8sAo7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simplyspot.in header.i=@simplyspot.in header.b="hD4lh7F1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E48207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=simplyspot.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XZ82fOl521ahuBcEft8WTuarqhINMYLN4flSxX+3z5I=; b=AIS8sAo7HUNTg6
	GZk4Rd2J5oy1mM+BOmxo5gzjvC1UiO4fwHBnfY4SJRafl8mcIBFDDnbyX/Hm/K8wSmlNQeHrLYkFj
	/lLFe5+OFuirVQUNp54Xiz1JgJebNZed5sGrQSUkid9tDnjZPyGyUjUyYmh0+RYVlyZDYpUI/rS7J
	yWMIfdUGFY/E0wDN/pDgwI3SWJK80dKUXcvOVqkYfPM9RQTLJsjw4Rbggffv2YavJ5HJjKkKICw3E
	pBHs2x/YsOw1VCGpN9WkVpgjhj5C6RMZdRd7tJFOmRfln+8E4hEpTzmU4s01GK491SmMbM5Ka9rVi
	yahqg/3rYYDOXGx3GmCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfoL-0005IF-Pt; Sat, 18 Jul 2020 05:55:01 +0000
Received: from mail.simplyspot.in ([103.207.11.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfoI-0005He-Ui
 for linux-mtd@lists.infradead.org; Sat, 18 Jul 2020 05:55:00 +0000
Received: from [192.168.0.17] (170.248.91.92.rev.sfr.net [92.91.248.170])
 by mail.simplyspot.in (Postfix) with ESMTPSA id 2F091639A3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2020 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=simplyspot.in; s=2020;
 t=1595001148; bh=EP4t5EO9pHYO28Au+oflf3UrAIJHqBREjQEsD5QZf1M=;
 h=Subject:To:From:Date:Reply-To:From;
 b=hD4lh7F1DP3ePpyiczQ69jWUGiM83JOHgxQSR8ozf25tyhzKWPgjlQaVQCDkeEF7v
 G5KQfU95GIVKyMtf5UYS0yHu6HnVVZwtM5pboiKTtlMX4NBEu0BW0hBFM/UTDFqcm9
 lhQPa1zaKTrIYVxL8hGvMzwamc7q7+lhjjcNl+qQFlgR/008CGPM8WIJeA2ty207mN
 3Q1XUosrYkcho1qSY48FPIxpWZS4ifp9JSYJ5xk5QmlZvaXouhIe2EHldscqc3UEM5
 CRX2nmjBECb3p8SBV2xD15b9dz7N0r081FwHMnGJ1odE7rKDfwdJVmfE4MWVz3WF2f
 u8QqZQFYMxKaw==
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Donation Offer
To: linux-mtd@lists.infradead.org
From: "Steve Lenka Thomson" <shailesh@simplyspot.in>
Date: Fri, 17 Jul 2020 17:52:21 +0200
X-Antivirus: Avast (VPS 200717-2, 17/07/2020), Outbound message
X-Antivirus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_015459_518118_A5066225 
X-CRM114-Status: UNSURE (  -3.86  )
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
Reply-To: Steve.thomson771@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Message-ID: <E1jwfoL-0005IF-Pt@merlin.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello, =

 Donation of =A31,000,000.00 GBP given to you by Steve Lenka Thomson, This =
is to help fight against COVID-19 pandemic and help the poor people off the=
 streets. send email for more details: Steve.thomson771@gmail.com
 Steve Lenka Thomson

-- =

This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
