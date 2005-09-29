Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvYJ-0004bg-IA
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:24:49 -0400
Message-ID: <433BC021.7090409@yandex.ru>
Date: Thu, 29 Sep 2005 14:21:21 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<20050929101247.GD18741@wohnheim.fh-wedel.de>
In-Reply-To: <20050929101247.GD18741@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> On Thu, 29 September 2005 13:59:53 +0400, Artem B. Bityutskiy wrote:
>>>The first way stores a reference in the first (usable) erase block. (I=
f
>>>it is not free, it moves the data to somewhere else, and reserve). It
>>>stores only a reference to it at umount, and a "mount-log" at mount
>>>(just to mark that it is invalid in case of unclean umount). It means
>>>one page write at mount, one page write at umount. If the erase block
>>>consist 16 pages than it is necesarry to erase the first erase block
>>>after every 8 mounts. So the typical timelife of it is about 8*100.000=

>>>mounting, I think it is big enough.
>>
>>This spoils the overall wear-leveling, which is no good. But should wor=
k.
>=20
>=20
> Dummy argument.  Wear levelling is just a means to avoid the real
> problem - early wear-out of specific blocks.  Spending one erase block
> for cs is pretty sane, as long as this block doesn't wear-out well
> before the rest.
"As long as" is the essential part. If it is true - nice. In general=20
this can't be true. And, anticipating your remark, I agree that it still =

may have its place. :-)

>>>The other way is to specify the cenratlized summary information with
>>>mount option (not to use the first erase block to store this pointer).=

>>>In this case some other system have to store it (typically on an other=

>>>file system), and the new location after umount can be read using sysf=
s.
>>
>>This also spoils wear-levelling...
>=20
>=20
> How?
The same way as above unless you evenly rotete the CS eraseblock. And if =

("as long as" =3D=3D TRUE) then all is ok.

> CS definitely doesn't solve all problems and it trades the mount time
> for additional writes - plus the special first erase block.  Still, it
> may have its place.
Thanks, I have no doubts. :-)

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
