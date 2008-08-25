Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXeOz-0006ag-PP
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 15:54:46 +0000
Subject: Re: ubifs mount size
From: Artem Bityutskiy <dedekind@infradead.org>
To: dfoley <dfoley@telus.net>
In-Reply-To: <1219339475.18027.87.camel@sauron>
References: <g85ka8$cpi$1@ger.gmane.org>  <1219339475.18027.87.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 25 Aug 2008 18:51:37 +0300
Message-Id: <1219679497.18027.110.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2008-08-21 at 20:24 +0300, Artem Bityutskiy wrote:
> > root@tsi-sa2410:~# ubimkvol /dev/ubi1 -N root -s 55MiB
> > Volume ID 0, size 3755 LEBs (57676800 bytes, 55.0 MiB), LEB size 15360=20
> > bytes (15.0 KiB), dynamic, name "root", alignment 1
> > root@tsi-sa2410:~# mount -t ubifs ubi1:root /mnt/linux2-root/
> > UBIFS: default file-system created
> > UBIFS: background thread "ubifs_bgt1_0" started, PID 930
> > UBIFS: mounted UBI device 1, volume 0, name "root"
> > UBIFS: file system size: 57292800 bytes (55950 KiB, 54 MiB, 3730 LEBs)
> > UBIFS: journal size: 2872320 bytes (2805 KiB, 2 MiB, 187 LEBs)
> > UBIFS: default compressor: LZO
> > UBIFS: media format 4, latest format 4
> > root@tsi-sa2410:~# df
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > rootfs                    8059      5284      2366  69% /
> > /dev/root                 8059      5284      2366  69% /
> > /dev/root                 8059      5284      2366  69% /dev/.static/de=
v
> > ubi1:root                33968         0     31204   0% /mnt/linux2-roo=
t
>=20
> I've explored this a little. Currently UBIFS indeed reports 15%-20% less
> free space than it actually has, and we'll try to fix this.

We have improved UBIFS free space reporting and it should be much better
now. Please, pull master branch of the ubifs-2.6.git tree to find the
fixes.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
