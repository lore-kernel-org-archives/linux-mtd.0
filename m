Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LOhwV-00030M-5B
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 00:24:54 +0000
Date: Mon, 19 Jan 2009 11:24:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
Message-Id: <20090119112429.78f5dc33.sfr@canb.auug.org.au>
In-Reply-To: <1232223441.3966.22.camel@localhost.localdomain>
References: <1232223441.3966.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__19_Jan_2009_11_24_29_+1100_YrWGFK.9COO2jjcI"
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	Ingo Molnar <mingo@elte.hu>, linux-media@vger.kernel.org,
	mchehab@infradead.org, linux-raid@vger.kernel.org,
	netfilter@vger.kernel.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, oliver.hartkopp@volkswagen.de,
	spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Mon__19_Jan_2009_11_24_29_+1100_YrWGFK.9COO2jjcI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Jan 2009 01:47:21 +0530 Jaswinder Singh Rajput <jaswinder@kernel=
.org> wrote:
>
> diff --git a/include/linux/nfsd/stats.h b/include/linux/nfsd/stats.h
> index 7678cfb..0b53cfe 100644
> --- a/include/linux/nfsd/stats.h
> +++ b/include/linux/nfsd/stats.h
> @@ -29,9 +29,11 @@ struct nfsd_stats {
>  	unsigned int	ra_size;	/* size of ra cache */
>  	unsigned int	ra_depth[11];	/* number of times ra entry was found that d=
eep
>  					 * in the cache (10percentiles). [10] =3D not found */
> +#ifdef __KERNEL__
>  #ifdef CONFIG_NFSD_V4
>  	unsigned int	nfs4_opcount[LAST_NFS4_OP + 1];	/* count of individual nfs=
v4 operations */
>  #endif
> +#endif /* __KERNEL__ */
> =20
>  };

The only variable in the kernel of type "struct nfsd_stats" is only
exported to user mode via procfs, so this whole structure could probably
go inside __KERNEL__.  Then looking harder, I wonder if this header
should be exported to user mode at all.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Jan_2009_11_24_29_+1100_YrWGFK.9COO2jjcI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklzyD0ACgkQjjKRsyhoI8yt9QCgmEHLhNSAB2fYNfqbvgl+WPEm
rRoAnRBfynsNZYdMSfUK9yUqeTiWdV62
=eQRT
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jan_2009_11_24_29_+1100_YrWGFK.9COO2jjcI--
