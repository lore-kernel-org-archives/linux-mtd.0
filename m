Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CA5C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrtmUvpOgAMZiwewpHy5EN0x98YM51ryroH9Uj/8Qlg=; b=IMbc8is9bDtsi+
	1mkkKHu/zG15FGPGbYfKtgym5YAAhIIbFn88lL/smkA/BYhgOh9zmVWeMV1oW8rVxN9yhexITaTEk
	jVsi/TDSs3SUePvEHebmXEDFX/28zYjbPO8r7WJV/6cwqPOe2JT1nukjfhKaBIHH7drUUXYIIjQOF
	gYtNStTJF5TCVucnDIqL23uf4+Gw3u7yMCmNWqem91vrDTsG8aTuYH3zTpag/j4KaRV3gpzCUu8PR
	UJJaoHz3gtInUkeMXDDq/70a8AmwYBa035sDYwGOO1n+3IBv+GoD3EaNxv67kCGGubHMYr2tL4uxu
	i1kFEd4Q9UU3FOidEDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNQE-0000000G4sS-3vHH;
	Sat, 15 Mar 2025 09:03:10 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNQC-0000000G4ry-0g26
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 09:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VXIab65iMh83UMf96eE59TaztDC5JUgOcqSXpaLANZQ=; b=cfYyEErNRnCiQ8fp4LXqPl+YAq
	unvh5ZPBJZUcURtsHcUtl7ZiDOJLaJ5ywqRfMQ+u2/luUD6AjlnMKwLMK2dDKnjWjGfE0Osp5+8np
	oKQ1vtvqmCgwxwbTUODBb1POzjDEw+8YzGSKrkUBSAG71T1grzJnmF3/VequM6K7uNbOFEJ9/tt3r
	x93OtwRG93hMYSd9UgUYP6vP+c/U7asFWMcW9a+yFelk7MHG6xKpKj0ruxp/SZ01dhxstIbGTc/DD
	AfLp0GRF2nuwTnGx1gnVLg6N0Wj1r+5g0iFvoDxqugNGWgOdkjSNIq2AHQnK2NNHMtCW51Srf/9CT
	/vv/XL5A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNPx-006nth-00;
	Sat, 15 Mar 2025 17:02:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:02:52 +0800
Date: Sat, 15 Mar 2025 17:02:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_020308_201102_A28EDDA3 
X-CRM114-Status: UNSURE (   7.80  )
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

On Sat, Mar 15, 2025 at 04:58:31PM +0800, Zhihao Cheng wrote:
>
> Hi, Herbert, I got some warning messages while running xfstests, it looks
> like the compressor returns error code.

Yes this is expected as incompressible data will now show up as
errors since we reduced the output buffer size due to LZO getting
fixed.  I'll silence that warning.

There are no reasons why compression should fail, other than the
data being incompressible.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
