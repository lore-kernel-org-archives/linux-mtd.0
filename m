Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCFAC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 23:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B07A2183E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 23:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSzc6YzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B07A2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+czsUvuptxrSimCsODladsIAQ8+UjQF3ewzkNGR3L48=; b=iSzc6YzB47M7b1
	/hyF/1e2HfqNFskuof50RxExe8v4qK1No4ZN2YvWCD55KN1x4JarDYC/SRcYM3zl/sFLGg5TeJSkU
	4+NJ7PRvBRk3mjchOGmqccdRRsgcrdu9nZaTvWm1zg4mZzsYBN479SATmLwSIVfhEWsIey4KPJ/wJ
	QvbSqLqJaJev+ykGv7ckVvUsJWgQ7521aQIN7sCm4qGTsA1Dg1PBpGbWEMHQzshsUihNh/monTZn+
	6Jrh8nbigRwmaUgo3vpCagbByIbO1lJHYQS946zZjuE6XMP+3LLfqqwhUvjtlho1ujkwYMXGd67gl
	m0EpftK5BPiwyQHTC7fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6kaH-0003gH-1O; Wed, 20 Mar 2019 23:25:21 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6kaC-0003fx-GJ
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 23:25:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C6942609187F;
 Thu, 21 Mar 2019 00:25:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qNyZQSqBJqO0; Thu, 21 Mar 2019 00:25:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4D26760ED8A9;
 Thu, 21 Mar 2019 00:25:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iiCnaDpGURoY; Thu, 21 Mar 2019 00:25:13 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id D3FE8609187F;
 Thu, 21 Mar 2019 00:25:12 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Date: Thu, 21 Mar 2019 00:25:12 +0100
Message-ID: <16526639.hLaf6TFmul@blindfold>
In-Reply-To: <1b9c6280-f1dc-2381-59d6-dc29fda3a63b@embeddedor.com>
References: <20190208180202.GA16603@embeddedor> <3141647.IxSqQhjO87@blindfold>
 <1b9c6280-f1dc-2381-59d6-dc29fda3a63b@embeddedor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_162516_690053_266E734D 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Cc: Kees Cook <keescook@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 20. M=E4rz 2019, 22:23:21 CET schrieb Gustavo A. R. Silva:
> So, if this is too much of a burden for people, I can add all these
> MTD patches to my own tree for 5.2.

Taking the patches via MTD is not a big deal, let's go that path.
For you it is more work to send many patches and getting them into the indi=
vidual
trees. :)

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
