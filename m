Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF2DC28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ8UsCiZvZpGm8k4OCmU2hugsfP2oMRC9Iu5mFiKAOU=; b=xfj1SoYUDXkIhx
	0tEcL174hw81bdBxFdKrIY9dTDTgNyvQmPBWe4JqysgEeuuQsBYvACLR0EaOnmJTYRsFGdsgxq9WR
	5GOYPV8WEYPwJigCB5X2ezz0vvK1Qh2Q3W4r0cekJ1axTwwShQaWnvN4hWVt0fDSNgqtNBsYdLqQK
	2RY588HYJV5t5ukMwhELN+ZzepLt3suR0DA0WRDDhVedLXKJrFXIBWbqLfNf2YJbx/33nSqGYlJKc
	lGfFm2VfhlmXcycCF/l5kdE8TfXrtwuP3qT0aVCdV9jUHP7K9yKzkbSj9hdsl6lTToCInemhhsgqH
	7q6yGlmH7vqu/OY8Dj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNsl-0000000G9OU-0Gba;
	Sat, 15 Mar 2025 09:32:39 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNsi-0000000G9O2-01mp
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 09:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8Zoqk4INoU43kv9K5QzIVVMAA5ggjljI6hMgiO9Zlw0=; b=c8QvqUxm2J2JjIlgHz766mu5J/
	mffYtXkcuTKG97lEgrc8jm6Mn7jEmNOb4ZmqoW8qNceSlD8mCYeVEKBpPcslIfotUbnsOmhLBylV5
	G9EPuk4YoF6zANuv3Mafg5fkXIMWUudA7O7rHF324n00aoUnJtUVSOup9MVX1J4mGVnbA+3wOMl+Z
	YuktbByACxhxm9aqZBUo1aJYa3Mgl4ozDysiBqmVm3lNzi/LZ7aLv+UEUA0R4JghQfTikOqCuRa8n
	ZImuNwTW9gP3tGuFl0fyLGAo7O8Sm/7+bx4XaLoJsyWMfZs3fhZCOxE7bufuy4H3nrnijAdoKtsFQ
	J2dVnXNQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNsZ-006oI4-0l;
	Sat, 15 Mar 2025 17:32:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:32:27 +0800
Date: Sat, 15 Mar 2025 17:32:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9VJK5npf_sMcVMd@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
 <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
 <dfa799fd-5ece-4ea4-d5d0-8c1da39a3a8d@huawei.com>
 <Z9VEkEOul9bt4bc1@gondor.apana.org.au>
 <1b6176d7-31a8-7211-b648-a79bd25af6dc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b6176d7-31a8-7211-b648-a79bd25af6dc@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_023236_041240_E6CEE326 
X-CRM114-Status: UNSURE (   9.07  )
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

On Sat, Mar 15, 2025 at 05:27:22PM +0800, Zhihao Cheng wrote:
>
> I think we should keep the warning, it would be better to distinguish the
> different error types.

Unfortunately that requires quite a bit of work.  If you would
like to restore the warning you will need to modify each algorithm
implementation to return a consistent error.  Right now it's all
over the place.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
