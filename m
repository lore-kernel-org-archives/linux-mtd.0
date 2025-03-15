Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61B6C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw7IrQDdydoGDGy8N+OGWpGhJyFVUl5+362MfHZC7UU=; b=TtrBgbW9vqvUOi
	FhuZ7Sw3fjFeq9aQYcpBlg0KooTH7iQMsx7Su2PG4A+h8hS0o3BEy0jJHfUGUv8GSEEURqak/F+lT
	mN004HHepyhSNeQ/qIkkjFdIJqazgU2n880lD5imKFvwAcXCDQFgzUvWZMMahab1iC11QvNGWgOGj
	F6qHu11cQXrSxZp4GtjTKiiPoPP6nC2FyetjdKPs3knFL5l3jX4VAwmEwxZbWI7rF8dl31UDcWslv
	7PTPCqt2+yJtPUELYPhrmQn+ZHnBCdzm5GRmsMBLJaPsnP5JxIJsMWxLWoIWcsjiD+WmcKX8nZKE7
	dWQoQTX2hrg/dMEgnbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNuu-0000000G9fk-2zOA;
	Sat, 15 Mar 2025 09:34:52 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNus-0000000G9f2-1QGt
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 09:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bf04FaDSJInFFvE99abyiooWZ6DhuQ0k4BNLeKjh8l8=; b=lG9Ekt1APmuMProcfaLFcLEq7Z
	QWH+Qu8zNF/58q8MuCJxpLwmP12QOcrbMFF2rMI3ZhTiJoLPDAIlYCSLtsn9+2YXCtCj7T0ofIXD+
	Xm5rvYq2m/D74XKoGMHA0sBUTYrsJgNyUBndUtQfsx2KehYm3OsHZqCnkg8O1xs4V+ZKNxaB0j3kI
	hSU26ykPnpJf6WYVnClsjvH6JPYSA/P3ApmWZKDXmCjbTokFd2rnT6wt15BQ13nQ0Topkk7GTMcZs
	WRryjlViBP1yrcbGLi71rifJeCKITlhiwaUuA7Tbv7Vitcuf/sByuuyQUJbPZ1dmezfAksqUF8LoE
	4ymZRYiA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNuk-006oJN-1S;
	Sat, 15 Mar 2025 17:34:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:34:42 +0800
Date: Sat, 15 Mar 2025 17:34:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9VJsgD2f5O8Ogyj@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
 <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
 <dfa799fd-5ece-4ea4-d5d0-8c1da39a3a8d@huawei.com>
 <Z9VEkEOul9bt4bc1@gondor.apana.org.au>
 <1b6176d7-31a8-7211-b648-a79bd25af6dc@huawei.com>
 <Z9VJK5npf_sMcVMd@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9VJK5npf_sMcVMd@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_023450_388034_626E6912 
X-CRM114-Status: UNSURE (   8.73  )
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

On Sat, Mar 15, 2025 at 05:32:27PM +0800, Herbert Xu wrote:
>
> Unfortunately that requires quite a bit of work.  If you would
> like to restore the warning you will need to modify each algorithm
> implementation to return a consistent error.  Right now it's all
> over the place.

Of course if you really want to keep the warning, then I can
just restore the existing worst-case output length so that
even incompressible data will succeed.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
