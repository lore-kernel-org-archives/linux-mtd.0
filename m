Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B39606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0rw2VgNg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=OakgQOFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RylL64KInnvEt5BL3amvpDCPSR26qNy5l5QXMrqr8/Y=; b=0rw2VgNg0RrbvwA0mVN9uwrBp7
	PWEH/PIfw7ULFgOLyrp0ZvaPD55AomMfZ4mdKYJ6LQr3C1nXHAs9R8glWPkivN8DCxkBRZSGmB6KI
	/39H3xZuGYQB/7PvQ3qRheMfoouFiYGt3XfSuNlkgL1huOmWzyAiLMfBtigXzCdpKwx1aaL11a2Hn
	wTQB/kC8E2xoLKQFKn6viPTdHGW4VCL5RaQbHzsOTuoSSCnqKtkA931z9oYg5nSlAhWm/ZibOl0SN
	c/ZT3us3vws3N/mGJhv56k255o9IFfN4PUfps1FdJuoaFfCpAEJxV/xX1688MkrgNApTfiBY/9Giz
	5ifgaWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZxv-00000007zUR-3R3q;
	Wed, 18 Nov 2026 07:20:23 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZxs-00000007zTm-1rRf
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 07:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=BP5uJPFEij5TgQlQa0MnVpdjGYnsN3jkV0Ck605J8vA=; t=1794986420;
	x=1795591220; b=OakgQOFc7hr2jxRWccUaRWTGMzif8g292ZU9qWInn9016FHXZEpDbLlUL2BJT
	DTgyo0Q55+VXfVtKiBZRuUoHu6PutPEF9EgCNsW8vcyuGWigpVSgm4iQS/g4hYFiJWWDwRXjTTIVo
	Z1KY0p4J99oOCvY+mJCsoBZwC1KEXaOMoA0HRldrsh6bAMw+EmLzdltpAr+2sRClWowPHNOqcfS6E
	OQqclqRvl1GeGIulTIp0ej1qh3wK1g1/vZEaVcdfW6aZj4hyRwWuwbHQgEzkcYP9I9ycVHpWf0cKE
	KKjKQLwtRmCgbKkFvgwJ6mcit2W2Zj7Nb7mP01/+IAMnOaqYaw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1xTZxc-00000000Itt-3izf; Wed, 18 Nov 2026 08:20:04 +0100
Received: from p57bd95b5.dip0.t-ipconnect.de ([87.189.149.181] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1xTZxc-00000000GfQ-25vy; Wed, 18 Nov 2026 08:20:04 +0100
Message-ID: <88645597bb3aeae8d36a7b5c499a0a6d74b4acc4.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 3/9] sh: sq: Add missing kobject release callback to
 ktype_percpu_entry
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ian Rogers <irogers@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman	
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	 <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, Srish Srinivasan	
 <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato	
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Juergen Gross	
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <ndesaulniers@google.com>, Viresh
 Kumar <viresh.kumar@linaro.org>, Zhongqiu Han	
 <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
 Felix Kuehling <felix.kuehling@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  Zhihao Cheng <chengzhihao1@huawei.com>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling	
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, 	linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, 	linux-s390@vger.kernel.org,
 gfs2@lists.linux.dev, xen-devel@lists.xenproject.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 08:20:02 +0100
In-Reply-To: <20261108223913.3624571-4-irogers@google.com>
References: <20261108223913.3624571-1-irogers@google.com>
	 <20261108223913.3624571-4-irogers@google.com>
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_232020_649790_AB41DFD7 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ian,

On Sun, 2026-11-08 at 14:39 -0800, Ian Rogers wrote:
> In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
> kzalloc_obj() and initialized with ktype_percpu_entry. When
> sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
> because ktype_percpu_entry lacks a .release callback.
> 
> Provide a sq_kobj_release() callback that calls kfree(kobj).
> 
> Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
> index 908a8e09113b..f33864958487 100644
> --- a/arch/sh/kernel/cpu/sh4/sq.c
> +++ b/arch/sh/kernel/cpu/sh4/sq.c
> @@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops = {
>  	.store	= sq_sysfs_store,
>  };
>  
> +static void sq_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
>  static struct kobj_type ktype_percpu_entry = {
> +	.release	= sq_kobj_release,
>  	.sysfs_ops	= &sq_sysfs_ops,
>  	.default_groups	= sq_sysfs_groups,
>  };

Looks good to me, thanks!

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
