Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0510AC169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 11:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA03920873
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 11:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LsGtGQBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA03920873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUOcU3WuvwD95gZOlmDZvH2R6vbp/e6NiRrNu9Ze3Z4=; b=LsGtGQBvSTFDY1
	HcY0+UX/i4lVaMuFC71F5CyXKmmOi2l85iklXe6LpykIx3RdUm2JYIR3t00LFQjxN4yyGjldUp9mY
	Z2C4ROR2w+oZWMA8olvaq7Y55EqixJvSUGp91eucKoymEdjaqGYYc8zmyBohMfq40ucIkFX5B5I1q
	QwyiTiizoIf9RXsOQVb9QnPR458dWjPZvAU3vK03fOjhn4upLNgmb5K0xg21sBzDYXsuBNIahOwcS
	9z0bog3KO/0ICqupCB55PFtlGcmuOx8rfyIgvW6SvHBCOymCF9YaOcqJr6js9rSTo/APDvG0ZjxQl
	xgMCB4FlV6sHMhUKIfwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt9Zj-00014R-Q6; Mon, 11 Feb 2019 11:16:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt9Zh-000146-D1
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 11:16:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9CC4A27D94A;
 Mon, 11 Feb 2019 11:16:31 +0000 (GMT)
Date: Mon, 11 Feb 2019 12:16:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] drivers/mtd: Use mtd->name when registering
 nvmem device
Message-ID: <20190211121628.30c22370@collabora.com>
In-Reply-To: <2f3cae2b-32d2-0651-29ef-2359221de4ef@linux.ibm.com>
References: <20190208151419.1800-1-aneesh.kumar@linux.ibm.com>
 <20190210135552.65f532bb@collabora.com>
 <2f3cae2b-32d2-0651-29ef-2359221de4ef@linux.ibm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_031633_566849_8F2D8B97 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: linuxppc-dev@lists.ozlabs.org, Alban Bedel <albeu@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 11 Feb 2019 16:26:38 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> On 2/10/19 6:25 PM, Boris Brezillon wrote:
> > Hello Aneesh,
> > 
> > On Fri,  8 Feb 2019 20:44:18 +0530
> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> >   
> >> With this patch, we use the mtd->name instead of concatenating the name with '0'
> >>
> >> Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>  
> > 
> > You forgot to Cc the MTD ML and maintainers. Can you please send a new
> > version?
> >   
> 
> linux-mtd list is on CC: Is that not sufficient?

Not in your original email, I added it in my reply.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
