Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32ECC28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFlWfimGJoGZjANH1dKdspdO3e3tilYwwP4U/a8d9Z0=; b=if9MxY5zXe5o2G
	R7zf3RnLhAIcUOZtfEtSr3YmU7iowbvShAt/uPvyT0uvBHD/s7tny2AqeMMoVCm2nj0gGEhlMYjQL
	obmc5XEp80WdWvE/uD4Sd3vGzeifV5NJ0+ys+X4WVIlZv3z7kW+LxqCZQuGef9/CL41mEQoHqJyJv
	5E66ZMLo+izxsBWmxJnN1T1QcdYGa/7PKnDp4b43mkvWNQjaRZCw9D/MZ60Jak7KW0FoA5+6vlgC3
	xVv6qhsjVQWUep/HSo+vTaxOOzwJB49wTZLRfQX0YCF99UTBLckD/VZBLbmy2kzVf+dUW3QJzDH/g
	CCiQNpqdi+b8sEQIw7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNg7-0000000G7J4-0BYq;
	Sat, 15 Mar 2025 09:19:35 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNZg-0000000G5nv-3WHm
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 09:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VWHBgHEGmNRsI4i6gNO6N2/SFYCtEltdgRavNwz+CQE=; b=BCMB4R3U8161ThdPChrnM3v9HW
	Rp7CPQRfgGKukWph+cO7HVLKntFMY6hSK83i8C3tZQKpF4c8YxFF8zk7BmMaXrvQ5ZPfgfSaMl99+
	CDVg5wn1Uv9rG2XAnh4Oe1KT622KkrcZ8ARPo0IHjs3ejnbkonccRr8YR6pnQqsIMWD86NncSvWY/
	Vrx2863CC9XvPz873YFHES1tIy93C4kMdoj7fP81olxpRkako2wumfvwKuGxfKHUF0+tpLfUXRt7Q
	QC+WBonv7ybH0VHQLdsuhfD6Axq14328WmOhegJfjTKVmazW74rbS79OyWmYQjw3bo1cU9aBbECGu
	oxh+BLcQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNZY-006o1w-1b;
	Sat, 15 Mar 2025 17:12:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:12:48 +0800
Date: Sat, 15 Mar 2025 17:12:48 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9VEkEOul9bt4bc1@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
 <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
 <dfa799fd-5ece-4ea4-d5d0-8c1da39a3a8d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dfa799fd-5ece-4ea4-d5d0-8c1da39a3a8d@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021256_882515_49043888 
X-CRM114-Status: UNSURE (   8.71  )
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

On Sat, Mar 15, 2025 at 05:08:47PM +0800, Zhihao Cheng wrote:
>
> According to the warning message, current compressor is zstd. The output
> buffer size is limited only for LZO compressor by [1].

Any algorithm can and will produce output longer than the input,
if you give it enough output buffer.

Previously an output buffer length of 2x the input length was given
to all algorithms, meaning that they would all succeed no matter
whether the input can be compressed or not.

This has now been changed so that incompressible data is not
needlessly compressed all the way to the end.  In fact we should
reduce it further to eliminate the UBIFS_MIN_COMPRESS_DIFF check.

I will remove the warning on compression since failures are
expected and reduce the output buffer length further to remove
the post-compression length check.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
