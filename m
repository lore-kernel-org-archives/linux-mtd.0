Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25922606A31A
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 00:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXosq7NC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=RItYEAWg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uZUiwoDlPo0OTvcGDv9LNqvgQieh2/o7V+HztizdrmQ=; b=vXosq7NCuYmziJd8QX08Q0N0NQ
	9DLPM4ui26hC4JTz77o7K+SV6JndwrOCPm6WHN/CNcTvkjidYBgd8kjImTg1nZ0STlT0ZKt+eHgXq
	b/Ljp493VzlB7Ds7xTdf/u+cW9kI43QQ3kvdjbZCxBZcnsV9XJHtJZenl68SMz2suEoOIYgxTyiH/
	xrxoWO5QWE/h9cluH/L/7wARfQQ8h1Yr6VRDrhmXkdiZZxOr43Rm5nGs/ybrmK8ziENtim+ko3e0N
	Ahi8ezjG8kCBRXOVPXcUKFvnOZjyvLcobkkmtmr3DtaR1nj7bEgMJvEKJM6xsZ3tUfPy3ReY62bVF
	Eh7T8sDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPSw-0000000HFBK-152h;
	Sat, 24 Oct 2026 00:18:30 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPSs-0000000HFAM-2xfm
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 00:18:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B011081B2;
	Sat, 24 Oct 2026 02:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792801100;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=q3p7xV5H+PTultXl1mNwMnr7GJaX/h6Y8PqBUyBRi0M=;
	b=RItYEAWg4ihIQlAh5mITs+PU8pJKQdRduw8dNgcqOw54xHQ/Y0dx3uvzenymbKVMV/pLCc
	MshIjoEf6kDplYfNVj+23Qf7BkRWnCMef0D9zCPMnLCmYcdg476FAFUyVwMSbnu6txD8Hs
	VbEnpmU/iOKL9sJP7+036YUZPM9FIBhrmDNdZvyQ3jGrcTmgH11Y+sqhFVl+HiCUOSCDX+
	vMS0CBKdWuSAEhQOA5sS2TOZgxCLPumShZ64BFja3g3aQO/EcPm7gduDUzVxFCq5vSr2NN
	4bx5Jh/FOKHPZe4kuKQnwqGh4HKkQod3wnpTdmEdQUl44SYYbow6gYM2F/J6RQ==
Message-ID: <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
Date: Sat, 24 Oct 2026 02:18:18 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
To: Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20261024001658.222147-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261024001658.222147-1-marex@nabladev.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_171826_925671_80669EFB 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/24/26 2:16 AM, Marek Vasut wrote:
> The MX25L51245G part has similar 4-BP locking mechanism as MX25L12805D,
> however, the TB bit on this part is OTP. Introduce support for Top-only
> locking in case the TB bit is not set, and disable locking in case the
> TB bit is fused i.e. set to Bottom mode.
Cheng Ming , can you (or someone from Macronix) please have a look at 
this patch and confirm that it is OK ?

Thank you for your help !

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
