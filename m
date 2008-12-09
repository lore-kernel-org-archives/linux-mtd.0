Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9zzF-0006oJ-Vj
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 10:38:42 +0000
Subject: Re: [PATCH] [UBI] 0/4 notifications
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@gmail.com
In-Reply-To: <1228759154.7622.26.camel@hp.diimka.lan>
References: <1228759154.7622.26.camel@hp.diimka.lan>
Content-Type: text/plain; charset=utf-8
Date: Tue, 09 Dec 2008 12:36:21 +0200
Message-Id: <1228818981.13686.171.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-08 at 20:59 +0300, dmitry pervushin wrote:
> I am glad to present the serie of patches that implement volume
> notifications in UBI and based on these notifications reworked MTD
> emulation layer and a simple mtdblock-like FTL.
>=20
> UBI volume notifications is intended to create the API to get clients
> notified about volume creation/deletion, renaming and changing(actually,
> resizing). A client can subscribe to these notifications using
> ubi_volume_register and cancel the subsription using
> ubi_volume_unregister. When UBI volume change occurs, the atomic
> notifier will be called. Client also can request "added" event on all
> volumes that existed before client subscribed to the notifications.
>=20
> Using notifications instead of calling functions ubi_gluebi_xxx allows
> MTD emulation layer to be more flexible; say, now is it possible to
> build it as a module and load/unload it on demand.
>=20
> The simple FTL uses the same notification mechanism and provides
> mtdblock-like layer.

Hi,

minor general notes:

1. Please, make sure checkpatch.pl is happy - here are complaints about
trailing white-spaces.

2. Would you please add kernel-doc style comments functions you
introduce? Lets maintain consistent code style please.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
