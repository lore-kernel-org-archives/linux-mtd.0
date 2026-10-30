Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC75606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RMFGiAQT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bd5mnlMY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LI13gEuIuEwaQc8SZ6UgWjzBK8738GQMxtIruS+Y1mE=; b=RMFGiAQT3v2U75fPzWBE4PIfCW
	dErx4kO7VCLdFD5dYABQoHsCb6nvlykYGXVHDbR9/OpbSphchpRlA4X+pjnPyt3Vviy1Qa0YMKYRQ
	FS8hLyZzW5YCZGhTTJBtlvGVfdOc3uxAne2yMadS/erLhBc7W/vN7fMcwTx7G+csHWIf8lDIrwCXh
	HY7ZKr3XYMovIJu+R/9DkdFQAED+PuFMm9cjw0ptc9ozQCOaQgEhdSzVglVI596PNh2mTLwBXTP8p
	3yiFln4uBl6AXT1jW9aSovQ6dH9FHG5WEK6L95deXxhvI2vjABNcrLtrnVwuUE3htj9ML7WH98zeY
	8kODGwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrNL-0000000CPPO-3IYO;
	Fri, 30 Oct 2026 18:30:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrNJ-0000000CPPF-13dc
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 18:30:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A0CB43856;
	Fri, 30 Oct 2026 18:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365561F000C1;
	Fri, 30 Oct 2026 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793385048;
	bh=Ymmdwc5PEMgv61WbZEAXoHrjiG+5VIZ10E632soWGCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bd5mnlMYQl798ipBazvCyuBvEJ+dWQPwsnUhVWLaW7b1vz5ZxxwwDFJAXipNxVYkZ
	 1YMHg32fNUCuoVzm2HCBW3ov7kG+JMaBOx03FaMytt2PrrA5GHA2Tvi5hKn/EfloYP
	 2beONBCAOHLRlOst0mi76+aNgfLm6mIii3Lr5Fvstx8lw6wGj/SrTAbdVuY0LzPwAU
	 bCJanwYpvATD+HqFWKlmHWzxbYzpj5FiFEot/sqUcaxCu2/PrJulmkzTYLC6de+Ext
	 aaZWpT6UFdWy/d0gaseRtXTvi4oQtl70vUfG4Wb6sIpH14qDGlI1q3EhfXbEG7UOrn
	 +aykTDKlAEfuQ==
Date: Fri, 30 Oct 2026 11:30:48 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/9] Compiler Attributes: Add __must_init macro
Message-ID: <202610301130.FEF31E7F@keescook>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-2-irogers@google.com>
 <202610281155.4D2AA663@keescook>
 <20261028190233.GA669046@ax162>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028190233.GA669046@ax162>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:02:33PM -0700, Nathan Chancellor wrote:
> On Wed, Oct 28, 2026 at 11:56:08AM -0700, Kees Cook wrote:
> > On Tue, Oct 27, 2026 at 03:38:36PM -0700, Ian Rogers wrote:
> > > Note that Clang does not yet diagnose file-scope objects declared
> > > without any initializer (initializers at file scope that omit the field
> > > are diagnosed), see https://github.com/llvm/llvm-project/issues/232483.
> ...
> > As part of this, can you open a Clang bug for the lack of detecting
> > global initializers? It'd be nice to get that fixed.
> 
> Is that this linked issue or a different one? Looks like you filed that
> one and it got fixed in clang ToT about a week ago:
> 
>   https://github.com/llvm/llvm-project/commit/58936cb3678b4b5b96177f24cac3940b9a389fe3

Oh! Hah, it moved so fast I missed it. Great!

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
