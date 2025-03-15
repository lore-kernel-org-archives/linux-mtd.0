Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9F2C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 05:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pubbwyh0LcYKSdotph6NYu1aY2FdXn0lA6solkuxKCc=; b=XtODafrwxXP3o3
	f+dhvGFJv23GuQREKSCK15tLmL753AhxM9hykpeAEOmGZ4WL29coZYzwu7pjJ1rOVKucPkIIGfncz
	tjLabwUyngRm/pcFax7veAGdavQpa3ZL5+tqUnTbCcqL/UXJTIGeSGO/P45P/l5gGxfPPcex1b/cO
	VKnBPtHFINAN/YwlnISuEDRuJ1WOSp98dXmll3PpALd5aykRuPpyQjIJ8PhTm7tyFk+iQdHAp/zhw
	sqd+MDDUp2Aof/Vkb8dtdcUk2o1/o759o9Z8kSgFjh8tQn9iWChxYdI4KbzeEe9l/nJL2btvgvXk4
	R8TMJpVuVqV20tjdGGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttKK9-0000000FrYf-3BHP;
	Sat, 15 Mar 2025 05:44:41 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttKK6-0000000FrYG-1VSd
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 05:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n6QHrjG4xFS2Vtdhn1I1SCFpoNnj0smpLOP3Qx1bE2M=; b=PYNz1Jfvpn7ZeUZP+ouqYIETKV
	pU2XnfrPc+hKM7rw3d62FRphdrkhBTpWTNCc/PkWML+/n4IumwNtpQ7CLQIWGaxTSj5DAXpvk7Ura
	cUBLLCmSsoyiAjIdJ1psFRdb5OFp7W11Bvgf1ksnKeF26yEs2GieL4sVxsdhwXyTF8UYys5bZCRFk
	tfU63E9Rbca3ZHm53zYL/UQdQaOfKqFn5Lmpj1/MHVKEGu0HUijPgTUTvvf2PcH+OTrGGoZGzELie
	nWzHUeExRqwbbBM44goGCPcrXoxe69kOKv7COYL6lxH5xr5powwbv5oU+8s+T4S3kDv5OwgW32eLa
	FObTjY4Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttKJy-006mGR-0v;
	Sat, 15 Mar 2025 13:44:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 13:44:30 +0800
Date: Sat, 15 Mar 2025 13:44:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9UTvkmx_InPeqEB@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <02dd5000-7ced-df02-d9d0-a3c1a410d062@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02dd5000-7ced-df02-d9d0-a3c1a410d062@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_224438_406965_3191FD0F 
X-CRM114-Status: UNSURE (   8.35  )
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

On Sat, Mar 15, 2025 at 01:15:09PM +0800, Zhihao Cheng wrote:
>
> Hi, Herbert. Can you show me which patch fixed the problem in LZO?

https://web.git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=cc47f07234f72cbd8e2c973cdbf2a6730660a463
 
> Does LZO guarantee the output data length smaller than input buffer length?
> Which commit fixed the issue?

The guarantee is that the algorithm will not write to the output
buffer beyond the specific buffer length.

For compression, you may specify a desired output length that is
smaller than the input buffer, automatically stopping the compression
if the input is incompressible.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
