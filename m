Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB2606A32F
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FD0EvSJC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuKAd+2p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XSoRWNHCwjxUKoswUbaVKfFs9EWaVqxShJL0VrjWXKw=; b=FD0EvSJCSWhs3HLl8Ed6ShS5Jv
	hB9jR3WE+dJfK2DCrSwasXf+r9hqGUsLzDjKNqQbL04t0XolMNpfu0prT9qBzoUoC4Y4dI+hWdDn4
	vL3Z0fFjMStOKoMjLz+UEZ9jZdCYZjT3t88xXmChmGWuC18gplnn9rukfUuE0IwXmnSzMUsnTNykb
	uDWuuxHu9P783rWBc2rlTbQ3rc6Msk7uxHJnHYmbrxNBYVwaIyjduJGD9/rhn+iCFfBZrDPEO0DYU
	TBK6Y3hcPr+Dy86JZJP6g/l6ajX/8/6LekbuvAwSLdzaTjKj+InegRfjj57lX4elgTTCLWBh5R2gw
	BjB1dNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMZH-00000003nQy-1biS;
	Tue, 03 Nov 2026 22:01:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMZG-00000003nQe-0AZH
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 22:01:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B58204026B;
	Tue,  3 Nov 2026 22:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E5C1F000C1;
	Tue,  3 Nov 2026 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793743281;
	bh=R6uA9hX7fD85rhN6sNXcNNPGP4g4K/KhTQ6rqqOfAX0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=AuKAd+2pAiWxmodz6a5kLrzOGag2dQXGCvIWfiU2SqiHPwjnt+DZeZOIZzwDoeFgW
	 f5tvI82TTyJbTTJBeMupREcEqkEJOTnvm2tcg6rR6KzI977TOiUnB4XfJblBR0m8Ko
	 3on7l/RW87okd18TkMziqprxQ9KNwBaxunuTpwN+wdELBok8svqqglFYItI7OaAie9
	 SaIAxAjUUZc0FGMB/GEzff7Fem5FCCZW2y7K8Ha9aPGJ34HwNpxMac8F2DMTukXzX4
	 NMMYmaBoHXuYiAJmGYwn0YL5KCqaN+IzO8Fe7/dimMO7SXev4BOPXOSMGcMZiQPmb5
	 yEemvUz0AwJZg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 03 Nov 2026 23:01:15 +0100
Message-Id: <DMLWX8NY1N1N.2OMQMQCIVRR18@kernel.org>
Subject: Re: [PATCH v2 0/9] Add __must_init and require explicit
 kobj_type::release
Cc: "Kees Cook" <kees@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Zhongqiu Han" <zhongqiu.han@oss.qualcomm.com>, "Sumanth Korikkar"
 <sumanthk@linux.ibm.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <driver-core@lists.linux.dev>,
 <llvm@lists.linux.dev>, <linux-hardening@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-sh@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <gfs2@lists.linux.dev>,
 <xen-devel@lists.xenproject.org>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Ian Rogers" <irogers@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261027223847.652884-1-irogers@google.com>
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Oct 27, 2026 at 11:38 PM CET, Ian Rogers wrote:
> Clang supports the 'require_explicit_initialization' attribute on struct
> fields to enforce that the field is explicitly initialized when an
> aggregate object is constructed, emitting -Wuninitialized-explicit-init
> (enabled by default) if the field is omitted.
>
> Following discussion at the Linux Plumbers Conference [1], patch 1 adds
> the attribute to include/linux/compiler_attributes.h as __must_init. In
> v1 it was called __require_explicit_initialization. Kees picked up that
> patch with a first seq_file user [2], and in that thread Greg suggested
> the shorter __must_init spelling, which Kees and Miguel agreed to. As
> the attribute did not land in the v7.4 merge window, Kees asked that
> this series carry the renamed attribute. The Acked-by/Reviewed-by tags
> on patch 1 were given for the original spelling; the rename is
> mechanical.

This looks ready, and I plan to pick it up through the driver-core tree with the
minor commit message correction.

>   powerpc/secvar: Add missing kobject release callback to secvar_ktype
>   sh: sq: Add missing kobject release callback to ktype_percpu_entry
>   xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type

Some ACKs would be appreciated. :)

Thanks,
Danilo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
