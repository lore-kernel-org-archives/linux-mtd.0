Return-Path: <SRS0=C/uX=A4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D81BC433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 16:44:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5822E2076D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 16:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBQB0bYm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="PGKGsWRC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5822E2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bc4r7awdH7XrOp8kvDDBg1hqH3SaxlQTMFoUmsSxgk8=; b=bBQB0bYmNR0BbokBffNA9eyjM
	eyiJS95IgpRz8wfyAuLdLf9XOv5ZZ0F0veXGxM1LjRKhrx6ow7xpPz1Eh4CONB9ZvQa1DyQEhy+JK
	1PYjtrhPweErjwKNGsPA4SJzUEqfXc8I0JH8zR/oaRFrIfk1rC3jHSJ+16h+f8gsUuz3nv9tBffjB
	QBVLzfNbmSW15C7iWMnGYjss6IslIUA+KOUgiftK7NYtvAq1wqRFIQVWQN8HuyHs7JZn6LU0/HWf2
	YCIbMiVtpKslb30xtKRuPf8wjx++sUcYtwnHwDabZ6nTGy8QzUu3R4iKivDnmUg6ePTgYPwGUTJse
	5R6/N6Wxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwTTA-0007n0-NT; Fri, 17 Jul 2020 16:44:20 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwTT8-0007mU-ML
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2020 16:44:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id 88so1573456wrh.3
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2020 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBmamyY0NDGHob0JXE2Lp2+S6YdIwc1lq3YhCijYPjU=;
 b=PGKGsWRCSbDa93XyhDT4Ra8RMJBI2tSeXMMIpt/XwLXPGpRvpOde0xxg0me7PsAo9Z
 V9yC1LdPDjY2pHRqjVXIpVOlQ3g6F7QIqQ/h04dKYXM8pvHRv8zPsRSiU0hWytxIM1XB
 YwW2eAl5zxvN0XTUV1y7Iq7nU3Tun6fUdimtIws3t25BC6F/Qq16V91BHMpvH1Uqy/mU
 UEFX/uUYUUgwfqoC83lc5eQM+9TjjXNd3p1GHGNu7N3aEmw/zeTxsLPylw5NhNnqThSw
 Ph8Q8tdC5Ctywt9pRbTODWrq8n+x0I/oMoogeXimj1/pO2hWoqatDqUBTE/jrxAfUbBH
 qBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBmamyY0NDGHob0JXE2Lp2+S6YdIwc1lq3YhCijYPjU=;
 b=DB3OOuvUfNnxWdHUIQ/QWJRKiNm2fkzPXIUhX9jn77Cdwx6xlO2hwNHrQ6Adxyi+Bb
 bqd2RYFf/oTl4uqG/vpqSEaq4W7trALwTACkNR+uIjT5SvuPowKxAnzMOqsv2oDkzG79
 d0RfwVH3Zo7WiRgLDxwMwsAciOG+lKQtW3fBaHwzcmzsH7DGtcyWQFiwMj1Zr65h41PX
 hP42h7r14l4Klt2uvYNEIxIbpqkfWLHAOWMHrQan3pJ0/279f2NyiU+7+Ic6Q4Zo3XKj
 dEgdeAUB48mX4EqQKRHAEmYx3Cp8gqfQ/ebg+j/H4oHeOBCK9jI9HGdIaCAILYgGiQwb
 MuAg==
X-Gm-Message-State: AOAM531Z+WNBWoc1NeScFlBM37KfHMtVEBwgm2cTxulnCd2+2lsm4y2u
 R8nTCBgbfZ4DcGnuwDeaYsYdGPVLh8ZBlTezJZ93Ag==
X-Google-Smtp-Source: ABdhPJzDuBAPJaKE+woJ/5xRzjugAQAArpq3lhmZntVmX/g8oWfUf5qSd/bnKicZNbKvYxyewRcrf6gIQLLvNQqvZCY=
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr1470898wrv.160.1595004257482; 
 Fri, 17 Jul 2020 09:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-2-dac2@pensando.io>
 <d842064a-7d43-6fd4-a544-dd38d124e6ba@microchip.com>
 <CA+nMikGEEOoKri5z2T3Ms-3cEi+G014ha+rwrwZWeRn=DxfU9w@mail.gmail.com>
In-Reply-To: <CA+nMikGEEOoKri5z2T3Ms-3cEi+G014ha+rwrwZWeRn=DxfU9w@mail.gmail.com>
From: David Clear <dac2@pensando.io>
Date: Fri, 17 Jul 2020 09:44:06 -0700
Message-ID: <CA+nMikFsczKaWbhB-SMJvatKR2LYbv2-cCLCPSH5puF2uiR87w@mail.gmail.com>
Subject: Fwd: [PATCH 1/2] mtd: spi-nor: Add support for Macronix mx66u2g45g.
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_124418_742725_41224521 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: Shannon Nelson <snelson@pensando.io>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[resend due to mailing list bounce]
On Fri, Jul 17, 2020 at 3:38 AM <Tudor.Ambarus@microchip.com> wrote:
>
> On 7/17/20 12:16 AM, David Clear wrote:
> > The Macronix mx66u2g45g is a 1.8V, 2Gbit (256MB) device which
> > supports x1, x2, or x4 operation.
>
> Please specify in the commit message if you tested this flash
> and with which controller.
> One should do the following tests:
> - read, erase, read back, hexdump -> to verify the erase op
> - generate a random file, write, read back, compare
> (e.g. sha1sum) -> to verify the write/read
>
> For locking operations one should do some locking tests.

We've been using with this part hooked up to the cadence-quadspi
controller (albeit with a 4.14 kernel and modified driver to
support x2 mode) for a while now, but yes I'll re-issue the patch
with a statement on testing once we have closure on the DUAL_READ
discussion.

Thanks for the review.  I appreciate the quick turnaround.

Regards,
David.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
