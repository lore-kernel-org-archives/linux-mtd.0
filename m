Received: from exprod6og106.obsmtp.com ([64.18.1.191])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0HFl-0004qF-Ez
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 16:08:09 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
Date: Tue, 20 Oct 2009 12:08:00 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E2481C@mi8nycmail19.Mi8.com>
In-Reply-To: <20091021.002941.41633716.anemo@mba.ocn.ne.jp>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
	<20091021.002941.41633716.anemo@mba.ocn.ne.jp>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 20, 2009 8:30 AM, Atsushi Nemoto wrote:
> On Mon, 19 Oct 2009 13:31:46 -0400, "H Hartley Sweeten" =
<hartleys@visionengravers.com> wrote:
>> During the probe for physmap platform flash devices there are a
>> number error exit conditions that all do a goto err_out which
>> then calls physmap_flash_remove().  In that function one of the
>> cleanup steps is:
>>=20
>> #ifdef CONFIG_MTD_CONCAT
>> 	if (info->cmtd !=3D info->mtd[0])
>> 		mtd_concat_destroy(info->cmtd);
>> #endif
>>=20
>> This test will succeed since info->cmtd =3D=3D NULL and info->mtd[0] =
is
>> valid.
>
> Oh I had missed this case when fixing physmap_flash_remove last time.
>
>> Fix this by exiting the remove function when info->cmtd =3D=3D NULL.
>
> No, map_destroy loop at the end of the function should not be skipped
> even when info->cmtd =3D=3D NULL.

Missed that part.  I will modify the patch and repost.

>> Also, cleanup the #ifdef CONFIG_MTD_PARTITIONS stuff by using
>> mtd_has_partitions().
>
> And this cleanup cause build errors when CONFIG_MTD_PARTITIONS was not
> set.  A separate patch might be better for such cleanup.

Hmm..  Not sure why that would cause a build error.  Regardless, I will
remove that change from this patch.

Regards,
Hartley
