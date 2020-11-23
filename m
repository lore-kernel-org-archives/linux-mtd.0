Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6930C2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:58:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F6120731
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vW9pdC7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F6120731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cEcj9nfDLcFWM8eMAqu0KM4VfQTULwCUmVMNrLD4oTg=; b=vW9pdC7SCA1yc4EEsEXL8Gr8c
	vyjXEE4MjfLfVVJQz6vvMkljyT9Ft0Bobazzsb//Q3l6RSwCPqcbqNqWVBW7jcdZ5hz/Xgwevy+S/
	WryV6ebQkQwEoqxGOLAaaS4UzUvaTOrup7HaPNkdblcHQXq6g8PiXkSqohpaqU72NDovITSOPOEb4
	m4E3rrh9wlL0+LjyyQ0gVSNQ5YDzpVxrvmdumYVS9u0gEipjsNtdegedYZwpdqxA1YcZsGwi3dMjT
	yq7wLaNanIda0KMgmk/PrL2nR+V7hhsE0kBcykd5ZbySuzCzf1E6I+YzicB1nQLGFm45MxepbjxlF
	pXqvXkJcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh7f7-0001vD-Gy; Mon, 23 Nov 2020 08:57:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh7f4-0001uZ-60
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 08:57:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D23DF1F44C49;
 Mon, 23 Nov 2020 08:57:23 +0000 (GMT)
Date: Mon, 23 Nov 2020 09:57:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Fix parsing of part-names with
 colons
Message-ID: <20201123095720.286cb4ad@collabora.com>
In-Reply-To: <20201123093814.1c24dd25@xps13>
References: <20201122001533.985641-1-sven@narfation.org>
 <20201123093814.1c24dd25@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_035726_323549_16F97377 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 Sven Eckelmann <sven@narfation.org>, rminnich@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 23 Nov 2020 09:38:14 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Sven,
> 
> Sven Eckelmann <sven@narfation.org> wrote on Sun, 22 Nov 2020 01:15:33
> +0100:
> 
> > Some devices (especially QCA ones) are already using hardcoded partition
> > names with colons in it. The OpenMesh A62 for example provides following
> > mtd relevant information via cmdline:
> > 
> >   root=31:11 mtdparts=spi0.0:256k(0:SBL1),128k(0:MIBIB),384k(0:QSEE),64k(0:CDT),64k(0:DDRPARAMS),64k(0:APPSBLENV),512k(0:APPSBL),64k(0:ART),64k(custom),64k(0:KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive) rootfsname=rootfs rootwait
> > 
> > The change to split only on the last colon between mtd-id and partitions
> > will cause newpart to see following string for the first partition:
> > 
> >   KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive)
> > 
> > Such a partition list cannot be parsed and thus the device fails to boot.
> > 
> > Avoid this behavior by making sure that the start of the first part-name
> > ("(") will also be the last byte the mtd-id split algorithm is using for
> > its colon search.  

Sounds reasonable to me. Note that it works until people start using
parens in their MTD name, so let's hope nobody does that :D. We should
really rework the mtdpart parsing code to make it more robust (do
context based parsing instead of this simple 'strchr()' solution).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
