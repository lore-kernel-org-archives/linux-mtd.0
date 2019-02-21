Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EA5C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91A42086C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 08:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usXzkOp4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D91A42086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHuvp/10j7A1zBnty0UwASQmLzY9U4gobTO32byHKuM=; b=usXzkOp4XKzyAV
	nb9ckblLaijuNBjDbyWT2SRnYO+mDGn8/TTIblhyZjC4HHVY+0lVdbLD08j62Ro55+I8VocOgXWrh
	Mn2F3zZ99LlP+UrMdf1NmrLAOAiHHlxtwoTIcj7ZkB6i7hYL9vajSljcwk4wlsRXDFzrODB+FavZ7
	uCzZUL844whQnBUX/BEVE41yF8aGUAdDY9R6/KO+S3fONbUqJYld9GR9xL6Bmns/gdQF246XrjhUi
	S9LZQtqBpYZ2IMRzeLNQEVPWirFZyu63FMk45OEDTXfPgFv7lf/NP6l+cSs7yZB/PoPl1ZS7E03A4
	FlZlcvz3QhKmMgphd4wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwjRf-0002No-ES; Thu, 21 Feb 2019 08:11:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwjRc-0002NU-4p
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 08:11:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D723427F912;
 Thu, 21 Feb 2019 08:10:58 +0000 (GMT)
Date: Thu, 21 Feb 2019 09:10:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: Prevent Nand page writes on Power failure
Message-ID: <20190221091055.266b9627@collabora.com>
In-Reply-To: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_001100_323383_30D2B6D3 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sascha,

On Wed, 20 Feb 2019 14:58:20 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Hi All,
> 
> I have hardware here for which the normal way to turn off is just to cut
> the power. When the powercut happens during a NAND page write then we
> get more or less completely written pages during next boot. Very rarely
> it seems to happen that such a half written page with only very few
> flipped bits is erroneously detected as empty and written again which
> then results in ECC errors when reading the data.

This should definitely be fixed, maybe by lowering the bitflip
threshold when doing the empty check. Do you know the ECC strength and
the number of bitflips you have when that problem occurs?

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
