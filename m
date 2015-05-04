Received: from moh2-ve1.go2.pl ([193.17.41.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpFiQ-0007aW-VN
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 12:43:19 +0000
Received: from moh2-ve1.go2.pl (unknown [10.0.0.186])
 by moh2-ve1.go2.pl (Postfix) with ESMTP id F019044D14A
 for <linux-mtd@lists.infradead.org>; Mon,  4 May 2015 14:42:52 +0200 (CEST)
Received: from o2.pl (unknown [10.0.0.3])
 by moh2-ve1.go2.pl (Postfix) with SMTP
 for <linux-mtd@lists.infradead.org>; Mon,  4 May 2015 14:42:52 +0200 (CEST)
Subject: =?UTF-8?Q?File_in_JFFS2_corrupted_after_power?=
 =?UTF-8?Q?_loss_during_removal_of_other_files?=
From: =?UTF-8?Q?Marcin_Adamski?= <mass85@tlen.pl>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Message-ID: <553983c4.1e577cd2.5547694c.c00cd@tlen.pl>
Date: Mon, 04 May 2015 14:42:52 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I=20am=20working=20with=20Linux=20(3.4.31+)=20embedded=20system=20booting=
=20from=20JFFS2=20partition.=20I=20frequently=20encounter=20a=20problem=20=
of=20a=20file=20corruption=20when=20power=20loss=20occurs=20while=20other=
=20files=20are=20being=20removed.=20It=20happens=20during=20upgrade=20pro=
cedure=20of=20the=20platform.=20These=20are=20simplified=20steps=20of=20t=
he=20upgrade:
1.=20Download=20tar.gz=20containing=20(among=20other=20files)=20rootfs.sq=
uashfs=20image=20of=20file=20system=20that=20I=20am=20upgrading=20to,=20v=
erify=20md5=20checksum=20of=20the=20image.
2.=20Boot=20linux=20from=20a=20small=20JFFS2=20partition=20that=20has=20a=
=20minimal=20set=20of=20tools=20required=20to=20perform=20upgrade.
3.=20Mount=20the=20large=20partition=20that=20must=20be=20upgraded.
4.=20Mount=20rootfs.squashfs=20which=20is=20stored=20in=20the=20big=20par=
tition.
5.=20Remove=20all=20files=20from=20the=20large=20partition=20except=20fro=
m=20some=20migrated=20data=20files,=20the=20rootfs.squashfs=20image=20etc=
.
6.=20Copy=20all=20files=20from=20mounted=20rootfs.squashfs=20to=20the=20l=
arge=20partition
7.=20Boot=20from=20the=20large=20partition

The=20mentioned=20power=20loss=20occurs=20in=205.=20step.=20Note=20that=20=
the=20rootfs.squashfs=20is=20mounted=20as=20read=20only=20and=20is=20neve=
r=20altered=20during=20upgrade.=20Even=20though=20this=20file=20gets=20co=
rrupted=20and=20after=20device=20is=20powered=20on=20you=20can=20see=20th=
at=20the=20file's=20md5=20checksum=20is=20different,=20size=20stays=20unc=
hanged,=20image=20can=20be=20mounted=20but=20it=20is=20impossible=20to=20=
read=20some=20of=20the=20files=20from=20this=20image.

Shouldn't=20JFFS2=20deal=20with=20this=20kind=20of=20scenario?=20Is=20the=
re=20any=20way=20to=20recover=20from=20this=20situation?

Regards
Marcin=20Adamski
