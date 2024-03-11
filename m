Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50475C5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giz6ZMvYPGpClnCQNdDmVhUO9oGqOq4EqJ7ysSiz+64=; b=op1qJwI9jqwbg7oySrBN24wWDc
	rXp4yQVEYUc2ZcQLpKWcP1lrx1bh3jufjSIm6hpKAV3lFLqslnL9PGHEmPnxYZuG95qri3c1yejtL
	N5LzaLo7J2gloPjGEDI077F1bckxLNY8wcko2etjFVzNdZZaSqFURR/+c5KXHSEfQokB4aqTON0+Q
	Nuu8x6JO2vqDgcIzqNvYjWFLt8n2nIg/A0gLNxvtocBRBbC+mbBI4RjfsAKrbjg9HF3zo8m92ReRz
	vh698CC2QWOiGHEdslJZBuqgENjDmqhjlr5nweR3zLZqJB1zJUKQHyYlkyJ6SkbfXzlN53Qkx79tA
	qm21YHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjf4R-00000001VVB-3bsE;
	Mon, 11 Mar 2024 12:48:00 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjf4M-00000001VUF-2jrp
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 12:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=heusel.eu;
	s=s1-ionos; t=1710161263; x=1710766063; i=christian@heusel.eu;
	bh=U57Hk+dBS1y30YHhm431gGyozho2mBlgztMRDZ59myc=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=VgqSjHMr+haZtw0jZRKEgE/69AQYEB9jpDiIXVkbcWi8K5Z5DxDtBpZQAz/lY4VE
	 SDn46RZmzuisUyQX/p0pTlIRw+ejEWZlaZ3BmwJH8eIFUaz6uryXxGoF6An9Qq21e
	 iIwfiHOj20UKM/LbGZxYHsYeVDnx1xnOyb93ks42NhYr04aGGkc8PTUk6uRGJ6sIO
	 fJNlBeiziDUquPL27eOCqbf50m0Wjt6W5CYhYw56Gp42x2JSAJtl2aWgUQhHpVdsh
	 Vxfryyh07ImWnrPG1RRZ0IMvHFCMCkCrUD9+CN4McpxcNN7nc2jdDaJUFIrhepefI
	 VKPWjr1PLab+C1k9KQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([84.170.90.173]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N63mC-1qlzzr0JFA-016QKL; Mon, 11 Mar 2024 13:47:43 +0100
Date: Mon, 11 Mar 2024 13:47:40 +0100
From: Christian Heusel <christian@heusel.eu>
To: David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] jffs2: print symbolic error name instead of error code
Message-ID: <b4oa6jak7f4hiaqcqpmasclaylqdhdzgne75a6nol6z33d4o7z@3soexkn4smz4>
References: <20240211003907.167891-1-christian@heusel.eu>
MIME-Version: 1.0
In-Reply-To: <20240211003907.167891-1-christian@heusel.eu>
X-Provags-ID: V03:K1:cCA2v6Yl7qVfchXCjmjHzHof0YuIyG8VnO4ZV42PYUgerHlw0Df
 C6Hi5BO1rlTOIcq4jNJVRXDdBBW1GWR6+Vb/6LiRQ9HMo32hbEiwuusAKfD25W4D9g3LtDj
 CiWY56wH80/xA3fgHUBh/xh6FBgfHSlTu0xi9S2dDYOnH4PFTbQ2/j0b0F8jaG5EhLP2CNc
 Pvye80JhDGlrJLs2SL1ZQ==
UI-OutboundReport: notjunk:1;M01:P0:TOIz44WZJa0=;MyS8RxB+EdiCl7XJkSIX7TNN68R
 QR0+dCPy7Ia6LsNvV4aH8k8eImoWzIgIkgkLxtx1w1aNxkX2AMEw3y4AnTdYij7QaSEmmyywq
 C5AA7lQJz/H4Vi4TTuXXpe5wAororgN+gXaDULqCOSaxnj3lAEKzG5H4ZhYklAKwGY6bthTpU
 aHuBDO6wf56WnGtyjKLaeljkfUuSGQdnJf8A5OuexRyNkc66/pnjSLcJnaw0ldGz9ARbxbKp3
 D09DfMkwtVFXAFlftCPqkMxNfgBCsaoAwmLod4w6CFtKJo/EOHl6WUlEHRVmbNUgouxDKLGZv
 wDNDv1fkG8lUqR+GFRXjpzeJVwOPEXHKWW6fmbKgfZNOQFoGrc8m4ImN6VuEbKfm8zFNPKQf9
 YHt5ABl9GSZ7PxbCWrne6PLC9XdD5HHQ1tYPXAOUOGA94+ko4x4XBcnhNu7GHPaLKMwnCuqUM
 b+TAc4cKUN58gCkKwfAIFd0/Kl848UphxeepAog3UAgmfboa/SRvYxiFUfVsh4z65QjgNUi/V
 Uvc5XtMhXKtV+U8etV59FhcdclLYAUpDAQPYuE9bGN8Lh4b7RZniCWt32NM0Cgr5HG4HFLZ0b
 2KNJLNES/R29kw2kNm9u35/lMU2vbVUld3JoiFC/7nQ0CCCsITvGeDqexBC4AfMH5TcTaDncI
 FxODoaTTpU5fZMvSIxTkAf8IdrR6bfrhCnu4l/MpT3FdGKGowcuDyKE+3mFZZjLaAknXpjwTo
 W/Pj4vQLFRT32dJNqIjkKQYFPMgfIco42ZQzWOsJt2JrVG3KsbGzIM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_054755_182769_218889B5 
X-CRM114-Status: GOOD (  17.58  )
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
Content-Type: multipart/mixed; boundary="===============8276018833756512286=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8276018833756512286==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u36om64zlux4crqa"
Content-Disposition: inline


--u36om64zlux4crqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/02/11 01:39AM, Christian Heusel wrote:
> Utilize the %pe print specifier to get the symbolic error name as a
> string (i.e "-ENOMEM") in the log message instead of the error code to
> increase its readablility.
>=20
> This change was suggested in
> https://lore.kernel.org/all/92972476-0b1f-4d0a-9951-af3fc8bc6e65@suswa.mo=
untain/
>=20
> Signed-off-by: Christian Heusel <christian@heusel.eu>
> ---
>  fs/jffs2/background.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index 6da92ecaf66d..bb0ee1a59e71 100644
> --- a/fs/jffs2/background.c
> +++ b/fs/jffs2/background.c
> @@ -44,8 +44,8 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_=
info *c)
>=20
>  	tsk =3D kthread_run(jffs2_garbage_collect_thread, c, "jffs2_gcd_mtd%d",=
 c->mtd->index);
>  	if (IS_ERR(tsk)) {
> -		pr_warn("fork failed for JFFS2 garbage collect thread: %ld\n",
> -			-PTR_ERR(tsk));
> +		pr_warn("fork failed for JFFS2 garbage collect thread: %pe\n",
> +			tsk);
>  		complete(&c->gc_thread_exit);
>  		ret =3D PTR_ERR(tsk);
>  	} else {
> --
> 2.43.1

Friendly ping on the above patch, since it's now a month after sending
it :)

Cheers,
chris

--u36om64zlux4crqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmXu/WwACgkQwEfU8yi1
JYWNaBAA3O92OboqsUyaSWRqJ+1aXC2lC2cHWCQnaLE8/tlW8wIlA6FPrZKkO6h3
TxxzZo8TPzpZgaUzkOlZps5CjOYQNzx1axbm2WXkrj44oHbmavq+Zj7ehSjdvwMW
P5foTpyJJt6mwBgaKv8I3WIR8utjV8AyMLsjPtSayYcvBtsmZxJyPcY38On7JuSH
mNegCXTkBorj2R3Rzm8ijWCIA39Bc5HCpdk03cx8T2+2+3BcTZ9HH8nFA+qIXd5H
wTN+iQjdxHE/+yMqaExoRFWM5C4lLk5ub38j2d2VzBY6sIfDBzGmwRcfmapofAsG
tj1NyYCB2Oe1dA2cr5BZ7CrIh5CTHRPSgOMSkJIItet0jmTrtyndfocmsSEzsKoM
A/QC0bGK8M/7APTBjY5YY6FFBpZlIWkfCP2cdk/EmYuPLhU+UuJHdl9difcIClik
nmdptzAGu4uBsHqDQShnTxPUkaGi4geeY5QM2ylxtYIsd0aH198GDF6BO26UPRmg
c8r0RcqTJ19Jeyb87waHKDqejKlkMFm1/tM5LU9U0aGr43TmFJ6Xky5YJ7hOp5Gr
ZAU7gUXUwXmB0qs96+Hl6lU4PISIkb8FPmqYLRf57mxMhSyRuz7k1fyYlstzfGCB
vwIkWhSLK+/ZYmSsyumqyhCOxdtT+QWpMJfA68OQcvlv7cRqUqk=
=EQU3
-----END PGP SIGNATURE-----

--u36om64zlux4crqa--


--===============8276018833756512286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8276018833756512286==--

