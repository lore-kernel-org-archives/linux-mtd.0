Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sOU-0008F3-QM
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:49:43 +0000
Message-ID: <1345809271.2848.294.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: remove __DATE__ and __TIME__
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Date: Fri, 24 Aug 2012 14:54:31 +0300
In-Reply-To: <1344534194-16321-1-git-send-email-jslaby@suse.cz>
References: <1344534194-16321-1-git-send-email-jslaby@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wD+OcB/ynwp7P+izDQGr"
Mime-Version: 1.0
Cc: Michal Marek <mmarek@suse.cz>, jirislaby@gmail.com,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wD+OcB/ynwp7P+izDQGr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-09 at 19:43 +0200, Jiri Slaby wrote:
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index e354832..67af316 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1431,7 +1431,6 @@ static int mount_ubifs(struct ubifs_info *c)
>  	ubifs_msg("reserved for root:  %llu bytes (%llu KiB)",
>  		c->report_rp_size, c->report_rp_size >> 10);
> =20
> -	dbg_msg("compiled on:         " __DATE__ " at " __TIME__);
>  	dbg_msg("min. I/O unit size:  %d bytes", c->min_io_size);
>  	dbg_msg("max. write size:     %d bytes", c->max_write_size);
>  	dbg_msg("LEB size:            %d bytes (%d KiB)",

Pushed to linux-ubifs.git, thanks! Does it make sense to hurry up and
send this to 3.6? Or it can be merged to 3.7 normally?

--=20
Best Regards,
Artem Bityutskiy

--=-wD+OcB/ynwp7P+izDQGr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2t3AAoJECmIfjd9wqK014oP/RkJQdfW9UfsOn4lVqdiFsO8
gO2Rv9P2R8qC+ywWPosNZxqUMibRUCI9DaFkrvOLFAJsfnltnUXiGzFFFFfzq0YV
Ni1xCH/hSmFMLKuhZ2L9qiSkxECDEnozoM409Qmc/Yetiy7FsTetlL201Wq9SIqR
mOucSgrB0ujKEaJfsIZfgDqkAwO+v9oQTjiICzL9Orax0mk56Cvq7z63F110VPzM
fqK655nIx1zHOTOsE4dqtTDdZdmgnE37WFJgubcFgOo1J9Ea7mpHpZ09ob6NAshM
XC+CEsGt5LoOub5tUurd4KfvkdSjxQr6txF67LZwV59v3UamZpi7RKy6Rjx3YS3U
tkGhWuVf9joOQaGmf8ewYDg52C305/k+JvJxOS1RsD7dVRxnsxF6XohU5SuAi1c7
nkPbpBfxa2wUr8J3ZfFbLykpPxue1nVl6B44M+BmjQJPtboHJtCFb34EL4luB4Vp
mpm2ScyyHobiuPSkhkiPXmdDCJDGeMRxY7tKDFPAcTwXuNvm2VUy/c2NJV5qHAvM
sip/RviWbFnTqVUi28dBf+MNQg3FQOU/C/wg+90LDZ5+FPvIixIPoTltLezIXLr0
+NZONUgnofe9/sutyMlfgcSUbuvNtJs3Akyzku5D+VIpc548eGINYayoLCMPKcov
/iOCcFUCSREZ8PF4hqNR
=TfPa
-----END PGP SIGNATURE-----

--=-wD+OcB/ynwp7P+izDQGr--
