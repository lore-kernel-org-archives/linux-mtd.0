Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1egd-0001uZ-El
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 09:44:43 +0000
Subject: Re: [PATCH][JFFS2] Reschedule during scan of partly empty eraseblock
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nielsen David Marqvar <David.Nielsen@frequentis.com>
In-Reply-To: <B80D0E83691CB840ACE9714151F863850157100C@VIECLEX01.frequentis.frq>
References: <B80D0E83691CB840ACE9714151F863850157100C@VIECLEX01.frequentis.frq>
Content-Type: text/plain; charset=utf-8
Date: Thu, 29 May 2008 12:46:32 +0300
Message-Id: <1212054392.31023.66.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-29 at 11:29 +0200, Nielsen David Marqvar wrote:
> This patch adds rescheduling to the loop that scans an empty area of an
> eraseblock.
>=20
> Rationale:
> When scanning the an empty area of an eraseblock no scheduling occurs. Bu=
t
> this scan may take significantly long to complete depending on the size o=
f=20
> the empty space within the eraseblock and the speed of the flash (on my
> system
> it could theoretically be up to 100 ms).
> The patch will add a call to cond_resched() for each 2 KiB scanned (while=
 the
> first check may be done before 2 KiB the code is simple and fast).
>=20
> The patch has been tested and running on our systems for a month now.
...
>                                 }
>=20
> +                               /* check for resched - searching an
> eraseblock may take several ms */
> +                               if ( (ofs & 0x7ff /* for each 2KiB */) =
=3D=3D 0)
> +                                       cond_resched();
> +
>                                 inbuf_ofs+=3D4;
>                                 ofs +=3D 4;
>                         }

I would rather add cond_resched() to jffs2_fill_scan_buf()
unconditionally. Conditional cond_resched() really looks bad.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
