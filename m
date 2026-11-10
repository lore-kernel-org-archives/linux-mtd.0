Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A2260A2612
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPOzW9hn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FlALCbgf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FABPW1LxsqBAkIexrXixzeSjma1i5zh6j+jfikcm3SA=; b=JPOzW9hndtd6NDMAyj3c+xmRg4
	G+3ZP9FsEyBQPgUSo0yCGl+8Xmvqp7fUJkw3x3rBfUV/1H6suzA2E50LixDxoeofZYzODUVX6s6/7
	CH+pTKZ2QhOqEekE85oxgINFuZdu2+vk4gOSPu6haY3W16xhwRzqrGPJDWESgt5ES6cx3O0aYLwx9
	aVOzfi/NBgnGgrG7i7w8zuD5cMuDLf4Eb0m6v9pjlw/cg3Ju8zE5XjAokh0mVtmAZ0twtkSmt6/pJ
	lQmlli6BTdhPCz03nehErtRfXa5AQLshIsXQIp3pnY5WxCZB7fct6LllHoyHdqJCTWigvJR5WvQDI
	EhkIKRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqvo-00000004qV2-1mc0;
	Tue, 10 Nov 2026 18:50:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqvn-00000004qUR-1Hc3
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 18:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96AB6401F4;
	Tue, 10 Nov 2026 18:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD611F008A1;
	Tue, 10 Nov 2026 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794336654;
	bh=TLIEKiLnj0Svc8OLuV26uLTBvGAIcklYqv2MJo7h/Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FlALCbgfGObjh4irUhwOyiSTPhH1aRRBibuJpKB+AKB79sQBZowZT3DQb5apVEm2w
	 Anr8OI5d32pB6DL+0FZ1LEOHIQiM07xLeVAcKpSYxJ4kUd1scYhpKcYpi9aFR85z73
	 hfQbWCjrFpF6laGAE916rq0okbSTiOEQ8Gris2bA=
Date: Tue, 10 Nov 2026 13:50:49 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 02/58] driver core: retain the owner of device release
 callbacks
Message-ID: <2026111037-stir-hermit-cb21@gregkh>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
 <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>
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

On Tue, Nov 10, 2026 at 12:44:05AM -0700, James Hilliard wrote:
> Device references can outlive the driver or subsystem operation that
> unregistered the device. A modular release callback needs its code to
> remain loaded until it returns. Dropping its last module reference inside
> the callback permits concurrent unload before the function epilogue has
> finished.
> 
> Add an optional release_owner to struct device. device_initialize() takes
> the reference before the device can be published. The built-in device
> core caches the owner before invoking the release callback and drops the
> reference after the callback returns, allowing the callback to free the
> device itself. This also covers initialized devices that were never added
> and device_add() failures.

Please no, we have tried this in the past and it's not good.  Devices
are data, which is different from code.

> MTD will use this to keep its release callback available after retained
> device references outlive driver unbind.

This isn't a good idea, dig through the archives and see what went wrong
before please.

As a hint, look at networking, no module reference counts anywhere!
That's the proper way to do it.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
