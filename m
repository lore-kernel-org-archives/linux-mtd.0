Return-Path: <SRS0=ZPU8=LN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731FDC2B9F4
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jun 2021 06:22:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2F916117A
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jun 2021 06:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2F916117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3FBm4cwiRXVBl2gtAbxHK5IOjuSY1GDQj/BQDvhkYQ=; b=2czh7Q9Rau67sq
	t/uU45rsn6PzKuvwvNVgCEYkeSnxMbgDmS3murFbQrwq8GWCP2k4ziI8z/Lt8GcNhy02Ot3fKZE8x
	Fmmsp9dePP9RHcpqd58vu2NgJR2v7s78xiUFOfYqBF+8+czUS86VY5fhRaqYBjtCd/44huK43Kcjz
	I7LecMwr+zpTv4ceStJVmalnbd0t0x8aHAm/IEO491yvWJg09kXAgb3lQr7IwL+fK3xGq+GE8fQDk
	KIs3K+u9YNOsCgLm3eNRtW06bZB+sW8mBSWeA2m7tBuM/qx+PtcCJHrDDE/Nt+RBCf7Pf/0iXC84H
	aqF5yLcId7JiVjDS+t9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUMW-00GS0a-Kn; Sat, 19 Jun 2021 06:21:48 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUMR-00GRzu-Og
 for linux-mtd@lists.infradead.org; Sat, 19 Jun 2021 06:21:45 +0000
Received: from [192.168.1.107] (unknown [81.0.122.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9025D80C67;
 Sat, 19 Jun 2021 08:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624083700;
 bh=ai9TjuENEyYwEAIGJWK06087RIx9go2L05hZxcR8nxw=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gpaHmSUokp4b+Ex0QUE7QHIiwSG84mTzC0a1Luakk+qVL6Zl+Rd5CnIsNUb3D7+99
 sIFpTHi2i7EpE9rUdn8/8f7Vnv4nkZNeD22MMnL/OiF4noHZWc833Zqtvd4SF/kvlB
 lj5NVrjAtvK1JMfgcwPt/YCvFiCCNlKi45Ux7RrCL+Ur6DyzKMhJY2fcSt4VMahsb6
 57XgOlP/9mh3uMkZOBu/FxHozKIcYw32Md0/wo5BNZgMfUzI1z+l4MuZyAOUCIKTN4
 hYTKUtOOSxF3tGiF0AfBPV1uOQzQQ1TIVEsMjSdzfbjs8tiImb0Jm4glFiyKR6AL0/
 P+4NTpYJs78Fw==
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <YMyir961W28TX5dT@mwanda>
From: Heiko Schocher <hs@denx.de>
Message-ID: <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
Date: Sat, 19 Jun 2021 08:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMyir961W28TX5dT@mwanda>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_232144_013897_06CCF083 
X-CRM114-Status: GOOD (  16.30  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Dan,

On 18.06.21 15:42, Dan Carpenter wrote:
> Smatch complains that zero length read/writes will lead to an
> uninitalized return value.  I don't know if that's possible, but
> it's nicer to return a zero literal anyway so let's do that.
> 
> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> People, when we add a new driver can we make sure the first commit uses
> the new prefered subsystem prefix?  For example,
> 
> "mtd: mchp48l640: add support for microchip 48l640 EERAM"
>       ^^^^^^^^^^
> Otherwise it's not clear to me what I should use as a patch prefix.

Ok, sorry...

Hmm... Colin already sent a fix for this, see:

https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
