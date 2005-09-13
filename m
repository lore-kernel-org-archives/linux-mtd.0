Received: from zproxy.gmail.com ([64.233.162.197])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFDUV-0000y8-3k
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 12:18:46 -0400
Received: by zproxy.gmail.com with SMTP id 14so162206nzn
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2005 09:18:38 -0700 (PDT)
Message-ID: <90c5722505091309184e49ac08@mail.gmail.com>
Date: Tue, 13 Sep 2005 18:18:37 +0200
From: Matthieu it <matthieu.it@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: finfo_uaddr in jedec_probe.c
Reply-To: matthieu.it@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,=20

I have some difficulties to understand the way the function
finfo_uaddr is working, especially for probing non x8 flash :

static inline __u8 finfo_uaddr(const struct amd_flash_info *finfo, int
device_type)
{
=09int uaddr_idx;
=09__u8 uaddr =3D MTD_UADDR_NOT_SUPPORTED;

=09switch ( device_type ) {
=09case CFI_DEVICETYPE_X8:  uaddr_idx =3D 0; break;
=09case CFI_DEVICETYPE_X16: uaddr_idx =3D 1; break;
=09case CFI_DEVICETYPE_X32: uaddr_idx =3D 2; break;
=09default:
=09=09printk(KERN_NOTICE "MTD: %s(): unknown device_type %d\n",
=09=09       __func__, device_type);
=09=09goto uaddr_done;
=09}

=09uaddr =3D finfo->uaddr[uaddr_idx];

=09if (uaddr !=3D MTD_UADDR_NOT_SUPPORTED ) {
=09=09/* ASSERT("The unlock addresses for non-8-bit mode
=09=09   are bollocks. We don't really need an array."); */
=09=09uaddr =3D finfo->uaddr[0];
=09}

 uaddr_done:
=09return uaddr;
}

I would have replaced the line :=20
if (uaddr !=3D MTD_UADDR_NOT_SUPPORTED )
by=20
if (uaddr =3D=3D MTD_UADDR_NOT_SUPPORTED )

(at least, it makes my 2.6.12 kernel recognising the flash I have on
my board, with correct uaddr values in the table).

but it seems so strange that I may have missed something...

Can someone told me if I am wrong ?=20

Regards,
