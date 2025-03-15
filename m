Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CFEC28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 04:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkvfQp6KGGQdyzhajPYCGoJC5XIkUH36YFj7dcF1k9s=; b=S/96lZ28KmkLOz
	YrHXRXBd75zaa11YT0jYNQ088dlxEQ2G9W4EljVlUmHXB17ajxhVbd7Y7nCZOiOVkh1sU/mGRV+D3
	pdM4lBYXHcumwccbcIwlb/9V4DOdcnF+31/ftmSbFxcPdJ8gV14Ck0rDyoBouhMKWnELlstFv0Efc
	ZbEe19NzAtLV+Xe2fEo+SzsKKEo7yQJPJSEfdrVTAxj8NeDQe1FE0tW6qESEmwq50QpPzAJl6t1py
	Ukj4Gli6fS5IvCGM4qg8m6oUGRNoNA2SzlGrDgpTFvLadiaxkgT82w6fIQXOGyp4hYi6waW909m5S
	lfQtCZwSNEPH0cOLvEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttIk1-0000000FmtR-08RY;
	Sat, 15 Mar 2025 04:03:17 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttIjx-0000000Fmsx-2smk
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 04:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2VUsKyX4LW0rXY166Mqej+WS9QN0xTroHFRzX9sIm0o=; b=sNCJEQBn5tLW27DpywCT+NgK5O
	UB4RhYMWCTKgdOE27URAD5B0yLayoHm72rCMe71c5IrlfMpbngAMxxJ0FEoQyOngVZe898Q7funoi
	7tZyc78f5k270/K6jFM8eDNXA35TOJI20QfxCwPztoEBjfWqcZzj38JfbM4aMOKDwgz2+qrctKDfT
	LOMQS5vS3F+w0J8740CddEqmNcVU6yV1kX4CSdbTupfxtewarfgCHrxgSuYNGTJ9NKxVuy2dMQs/5
	sNzY+mRdIuz4XufxQLvImqJ7EDH+Ri+j5eL1SIxkxcFDhwA5Gg3NSJPd2YSZmPfrGNRiywo8yZQCR
	d+pClWlw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttIjk-006lfE-1Q;
	Sat, 15 Mar 2025 12:03:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 12:03:00 +0800
Date: Sat, 15 Mar 2025 12:03:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9T79PKW0TFO-2xl@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <023a23b0-d9fd-6d4d-d5a2-207e47419645@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <023a23b0-d9fd-6d4d-d5a2-207e47419645@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_210313_741116_E915FC89 
X-CRM114-Status: UNSURE (   9.01  )
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

On Sat, Mar 15, 2025 at 11:54:43AM +0800, Zhihao Cheng wrote:
>
> We get capi_name by 'crypto_acomp_alg_name(crypto_acomp_reqtfm(req))', not
> compr->name.

It should return the same string.

> There are conflicts in patch 2 on the latest mainline version, can you
> rebase this series so I can do some tests for UBIFS.

Thanks for testing! I've just pushed it to

git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git acomp

So you should be able to pull that to test.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
