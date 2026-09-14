Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA2C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NtTA9RVm7NIDpzoh5TqmB7oYxzYDf8GkJMqjcX0pGk=; b=BgEDrBetix9m2N2wLZxTyck7pF
	UDYxT/uelCD8YRr917j1BHSORnkdZzSNw+Hda1R9NBGZTe6/lB0yD1roSDvDuLiGPMTewgb6xwBPO
	Yc3ZJR2H2T0ZXNPUOJ81xWpy/7xcTKXdT+QaVa1oJV/K2GRyy+6+1cgSeFJXLBVDbPCAnxtw25MUP
	g7cUSqaaiY57kYpHmVKqE9ZAaSJkPX934NSBhBAJElzQAt2tMhIYp91ySzyDm+nodqWxQ2Memclyy
	OA2oqWVDMZkO+OTpm+gUtC4a4Mk6TjtJhXHTnm+oBuhBpNkismCj4cnWIqAI5Q3P+YhZpCkVGdghs
	WI1FZZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x626F-00000002kNt-1csL;
	Mon, 14 Sep 2026 08:31:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x626E-00000002kNf-1i5m
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:31:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 19C00406D0;
	Mon, 14 Sep 2026 08:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 75D9F1F000FF;
	Mon, 14 Sep 2026 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374698;
	bh=9u1F+W1oWjvcpd0PLfJhCXFiZmV0PhNRETn8J/wT6U8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=TUUAHmMiPOMISjS7XtQL9pFYonBRDATq/+JuEZ0feBXs6xaT5WpwvuNVKLiK7C1l/
	 BSVaWuDc8Mxs/zcQMM66NWuGYn4yogbkO31MDMNPix12ZZt1Mn96XFv6NhuTJbW4dX
	 jTDIcmEB9CmfsFvC7tMEPD9O4ihF+DHMy2oT7Cu0cHX6rrjwLVTMcZBiEZ3g6ca7/U
	 fV3mPhLmiFmBp2Hbvr0AjndbLwhfCP/4u3OXmiYnq5mnCXGC6KToGa+PmRNrGN+Kwg
	 ws7DKrhiVxE2Jjn1EE536Ygpx0n84nGkflWL19no5wNTU3ySx3J+nLbSx5tGGEJv28
	 FOF3G5Xh+ws3Q==
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 10:31:33 +0200
Message-Id: <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in
 spi_nor_shutdown()
Cc: <pratyush@kernel.org>, <linux-kernel@vger.kernel.org>,
 <takahiro.kuwano@infineon.com>, <richard@nod.at>, <stable@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Itai Handler" <itai.handler@gmail.com>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.20.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com>
 <20260910190139.BF6231F000FF@smtp.kernel.org>
 <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com>
In-Reply-To: <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1471093780312407678=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1471093780312407678==
Content-Type: multipart/signed;
 boundary=9726a21b38a454b89c1f8873bc459716b7d00c2c9442490b0d3eb7b96098;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9726a21b38a454b89c1f8873bc459716b7d00c2c9442490b0d3eb7b96098
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 14, 2026 at 10:08 AM CEST, Itai Handler wrote:
> Thanks for the review. Taking the three points in turn: the first is
> unreachable, but checking it turned up a real bug next to it that this
> series has to fix first; the second cannot arise on the path this patch
> serves; and the third is correct and is already stated in the commit
> message.

So is this now two AI agents chatting with each other?

Sorry, but please be more precise and on point and drop that wall of
text.

And please annotate your commits with the Assisted-by: tag.

-michael

>> [Severity: High]
>> This is a pre-existing issue, but does spi_nor_prep_and_lock() leak devi=
ce
>> preparation resources if interrupted by a fatal signal?
>>
>> If a process is killed while waiting on wait_event_killable() inside
>> spi_nor_prep_and_lock(), it returns -ERESTARTSYS but fails to invoke
>> spi_nor_unprep() to roll back the earlier spi_nor_prep() call.
>
> The asymmetry in the code is real, but the leak is not: the two halves
> are mutually exclusive, so there is never anything to roll back.
>
> spi_nor_prep() only does something when the flash has controller_ops:
>
>         static int spi_nor_prep(struct spi_nor *nor)
>         {
>                 int ret =3D 0;
>
>                 if (nor->controller_ops && nor->controller_ops->prepare)
>                         ret =3D nor->controller_ops->prepare(nor);
>
>                 return ret;
>         }
>
> and the wait_event_killable() is reached only on the parallel-locking
> branch, i.e. only when SNOR_F_RWW is set. That flag is set in
> spi_nor_late_init_params() (core.c:2981):
>
>         if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
>             !nor->controller_ops)
>                 nor->flags |=3D SNOR_F_RWW;
>
> Note the !nor->controller_ops. A flash that can reach the killable wait
> by definition has no controller_ops, so spi_nor_prep() was a no-op and
> spi_nor_unprep() would be one too. RWW and controller_ops cannot coexist.
>
>> Does this
>> also apply to the other locking helpers like spi_nor_prep_and_lock_pe() =
and
>> spi_nor_prep_and_lock_rd()?
>
> Those two have the same shape and so the same answer: same
> spi_nor_prep(), same wait_event_killable() on the same SNOR_F_RWW
> branch, so there is nothing to unprep there either.
>
> One correction as well: on that branch spi_nor_prep_and_lock() does not
> take nor->lock at all, so the error return cannot deadlock the mutex in
> the way described.
>
> That said, the neighbouring code is not fine, and I would not have
> looked without this comment.
>
> spi_nor_rww_start_exclusive() returns with nor->lock held, on both
> paths:
>
>         static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
>         {
>                 struct spi_nor_rww *rww =3D &nor->rww;
>
>                 mutex_lock(&nor->lock);
>
>                 if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe=
)
>                         return false;
>                 ...
>                 return true;
>         }
>
> It is the only one of the ten spi_nor_rww_{start,end}_* helpers that
> still uses a bare mutex_lock(); the other nine all use
> guard(mutex)(&nor->lock). Commit 03e7bb864d9a ("mtd: spi-nor: use
> scope-based mutex cleanup helpers") replaced its "goto busy" with a
> plain "return false" and deleted the busy: label that did the
> mutex_unlock(), but did not add the guard() that the others got. Before
> that commit the function always released the lock.
>
> So on an RWW flash:
>
>  - if the flash is idle, it returns true with nor->lock held, and the
>    matching spi_nor_unlock_and_unprep() calls
>    spi_nor_rww_end_exclusive(), which does guard(mutex)(&nor->lock) and
>    self-deadlocks on a non-recursive mutex;
>
>  - if it is busy, it returns false with nor->lock held and
>    wait_event_killable() then sleeps holding it, so nothing can ever
>    clear ongoing_*.
>
> That has been the case since v6.15. Nothing hits it today: the only
> flash with SPI_NOR_RWW is the MX25UW51245G, which has neither OTP nor
> locking ops, so none of the existing spi_nor_prep_and_lock() callers in
> otp.c, swp.c and sst.c apply to it. That is exactly what this patch
> changes - spi_nor_shutdown() did not take the flash lock before, so an
> RWW part never reached the exclusive path, and with my patch every
> reboot would. v2 therefore leads with the guard(mutex) fix as patch 1/3
> rather than building on top of it.
>
>> [Severity: High]
>> If a fatal signal is pending during the reboot process, such as from the=
 OOM
>> killer or a manual SIGKILL, wait_event_killable() in spi_nor_prep_and_lo=
ck()
>> will immediately return -ERESTARTSYS.
>>
>> Will this early return skip the spi_nor_restore() hardware state reset?
>
> Only on an RWW flash, for the same reason as above: the non-parallel
> branch uses mutex_lock(), which is uninterruptible and cannot fail, and
> spi_nor_prep() cannot fail on the spi-mem path because controller_ops is
> NULL there. So on everything else spi_nor_prep_and_lock() returns 0.
>
> Where it can happen, skipping the restore is exactly what the code does
> today when the restore fails, and spi_nor_restore() is best-effort by
> design - it ignores the error from spi_nor_set_4byte_addr_mode() and
> only logs it, "in the hope that the flash will default to the 3-byte
> address mode after the software reset". The patch does not make that
> outcome more likely; the unlocked restore it replaces reports success
> while leaving the flash in 4-byte mode, which is the failure being
> fixed.
>
>> [Severity: Critical]
>> This is a pre-existing issue, but could releasing the lock while the MTD
>> device remains active expose the flash's modified 3-byte addressing stat=
e
>> to concurrent operations?
>
> Yes, and this is the right thing to have flagged. It is in the commit
> message:
>
>         This narrows the race without closing it. The restore still runs
>         while MTD users are attached, so an operation that starts after
>         it has completed will address a chip that is now in 3-byte mode
>         while nor->addr_nbytes is still 4. Closing that as well would
>         mean having MTD stop accepting operations before ->shutdown
>         runs, which is a larger change; serialising against the
>         operations already in flight is what keeps the restore itself
>         from being issued into a busy chip.
>
> The mechanism as described is right: a page program issued in that state
> sends four address bytes to a chip expecting three, so the fourth is
> consumed as the first data byte and the write lands shifted.
>
> It is not introduced here, and it cannot be fixed here. The window
> exists because ->shutdown runs with userspace still running and MTD
> still accepting operations; the only real fix is at the MTD layer, and
> it is a separate discussion I am happy to have. What this patch removes
> is the strictly worse case where the restore is issued into a flash that
> is mid-erase and silently discards it.
>
> Thanks,
> Itai


--9726a21b38a454b89c1f8873bc459716b7d00c2c9442490b0d3eb7b96098
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqew5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hvGwGA5r93zMI1j9+VVprFZTx7n/vNDBYybUtG
pIlMfsnyAWjLCsh032MhrO1huHu6aaRNAYCavd8nVVAinDLWCvlpMrYCC/3AbAm7
l1ag7IZO+FHchAyBJxj5KMTOqUbt05lp7F0=
=DFGe
-----END PGP SIGNATURE-----

--9726a21b38a454b89c1f8873bc459716b7d00c2c9442490b0d3eb7b96098--


--===============1471093780312407678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1471093780312407678==--

