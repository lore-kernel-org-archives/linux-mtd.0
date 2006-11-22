Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GmwjG-0003yF-SJ
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 13:21:56 -0500
Subject: Re: jffs2_truncate_fragtree does not handle NULL return from
	jffs2_lookup_node_frag
From: Artem Bityutskiy <dedekind@infradead.org>
To: Dragan Marinkovic <marinkovic.dragan@gmail.com>
In-Reply-To: <d33135570611220849o7775a594o151d02583df9c1e5@mail.gmail.com>
References: <d33135570611212335p76f32b82k13c3a8a0671d4e24@mail.gmail.com>
	<1164212824.19298.21.camel@sauron>
	<d33135570611220849o7775a594o151d02583df9c1e5@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 22 Nov 2006 18:55:17 +0200
Message-Id: <1164214517.19298.27.camel@sauron>
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

On Wed, 2006-11-22 at 08:49 -0800, Dragan Marinkovic wrote:
> Thanks Artem, I'll take a look.
>=20
> "JFFS2 partition is being updated" means that the file has been
> written to at the moment of the power loss. What's interesting is that
> if I'm writing 1MB file to the JFFS2 partition (which gives me enough
> time to reliably pull the plug during write operation) the power loss
> is always handled properly: the old version of the file is always
> there when the power is back on.
>=20
> To be more precise, I have trouble with the file size of about 11K
> (this really isn't any magic number, basically smaller files). I have
> /tmp dir. on tmpfs . I'm moving the file there, doing some
> manipulation on it (sed, cat, etc.) and copy the file back to its
> original location (JFFS2 fs). If I experience the power loss at the
> moment of the file copy operation, the file just vanishes. The same is
> true if the file is manipulated directly on the JFFS2 partition. I've
> tried 'mv', 'cat' and 'cp' -- all with the same result.
>=20
> The erase block size on the JFFS2 partition is set to 128K (131072
> bytes) . I can post USB stick and kernel config specific details if
> needed.

USB stick? How do you use JFFS2 on USB stick? Do you use block2mtd?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
