Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkXRL-0004kz-LA
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 08:52:20 +0000
Received: by mail-iy0-f177.google.com with SMTP id k12so713355iak.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 00:52:19 -0800 (PST)
Message-ID: <1326185675.8847.16.camel@sauron.fi.intel.com>
Subject: Re: delayed close on mtdblock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Date: Tue, 10 Jan 2012 10:54:35 +0200
In-Reply-To: <14259449.DIx1JTusJU@ws-stein>
References: <14259449.DIx1JTusJU@ws-stein>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GI/BWldrZNykHN1EuOhz"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GI/BWldrZNykHN1EuOhz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-04 at 15:18 +0100, Alexander Stein wrote:
> Hello,
>=20
> I observed an somewhat interesting situation regarding mtdblock. I have a=
 NOR-
> Flash with several mtd partitions. One holds the configuration from the=
=20
> bootloader and another one contains UBI/UBIFS.
> During bootup I attach UBI and mount UBIFS, no problems so far. To read t=
he=20
> bootloader coniguration I open the corresponding mtdblock with O_RDONLY, =
do an=20
> lseek, read and close it afterwards, nothing special. But I noticed the=
=20
> close() call take >1s which seems to far big, as there is nothing to be=
=20
> written into this mtdblock device.
> I digged into the kernel and get to mtdblock_release(). I can see that=
=20
> write_cached_data does nothing as the cache is clean. But mbd->mtd->sync=
=20
> (cfi_amdstd_sync in my case) takes a while because the chip state is curr=
ently=20
> FL_ERASING. The retry loop is taken several times before exiting the func=
tion.
> If I don't mount UBIFS there is no such delay. I'm wondering if there is=
=20
> actually a need to sync the chip if the cache is clean. Can someone expla=
in=20
> this to me?

Most probably this is because NOR flash erase is very slow. You probably
do writes to the UBIFS partition, which initiates many erase operations.
When you close the mtdblock device - it syncs the flash chip which
blocks until the pending erase operations initiated by UBIFS finish
(because these are 2 partitions on the same chip).

I think the quick fix for you would be to avoid calling mtd->sync() in
mtdblock if the device is R/O - makes no sense anyway. Care to submit a
patch?

--=20
Best Regards,
Artem Bityutskiy

--=-GI/BWldrZNykHN1EuOhz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPC/zLAAoJECmIfjd9wqK0JpIP/jqTEGzTXcgn9OViPUiFmbBT
66xiRT5qjWYgzsisWTJXe9ojNuV4DRya1pLpDVF6jCR9/siUJjFGve0VK8lFUQLu
oNDp9BRd81uAhU7u7COEL+SKtAIBYIAVd36JFGbdjD0Vydc+sM2ylicvc1+EzD++
ljkEu4F7fSJ9xOfTr8osxpJysjOmJPdWHKEiEDlnLCXqv97TZ5WINAZKBxBRZMmx
+VsdIowWV/JYFPPW9D03jCd5pH6PtT7SgH5iaALQ+WUFuY4zFps7z27Z7nzBeyzi
x6thal6ayYd4MH6yDquKpivOINXcQjp51zvip+E+879ZvZgFNGq8l7kg43chXiK+
b2yXZrDYxj3ktcvsfVu3w2aGxUaw/tAwx8Nb432GXBFFjJfHfNLv2unL1OcIizNL
vp3+5qyaHxCqcZ8c4sDLIdEG4D/eOaYyaoXUOY6RSZvsO+BTjzuaXkTVWHnoD2Os
E8u+WyGNNLY9B5DfzLDsRd7J2eUkdVA5W7lEjEa1/X8ktD2Z+rmvWeiTgB6yGPd/
ygyYaxlnKpBWu+dlbi5mNoCUCIVzD9KgKFFn8KYoVjh11C+xZn66qZf3EvPDfXtS
7U/JNwhEgsLZHdgPRp/EBtBpWZpjVgECLlq1J69+XUhhHU4a7qYruI5H5nzi6W6B
aC+SvvVsWP5/F60PVFGN
=5WIL
-----END PGP SIGNATURE-----

--=-GI/BWldrZNykHN1EuOhz--
