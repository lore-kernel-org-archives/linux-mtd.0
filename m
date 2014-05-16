Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlBro-0000y2-W4
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 06:43:42 +0000
Received: by mail-ve0-f172.google.com with SMTP id oz11so2613317veb.17
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 23:43:18 -0700 (PDT)
Message-ID: <5375B37D.7050101@monstr.eu>
Date: Fri, 16 May 2014 08:43:09 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: JFFS2 locking issue on 3.14 + patches
References: <535E7A58.8090102@monstr.eu> <20140428165108.GU32070@ld-irv-0074>
 <535F94BF.60004@monstr.eu> <20140429170530.GA9418@norris-Latitude-E6410>
 <53608D6C.3020008@monstr.eu> <20140516061037.GC2413@norris-Latitude-E6410>
In-Reply-To: <20140516061037.GC2413@norris-Latitude-E6410>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="mFbFv3Kg4qR2t7mechNBfKPefkWeF79Ns"
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wang Guoli <andy.wangguoli@huawei.com>,
 hujianyang <hujianyang@huawei.com>, Li Zefan <lizefan@huawei.com>,
 linux-mtd@lists.infradead.org, Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>
Reply-To: monstr@monstr.eu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mFbFv3Kg4qR2t7mechNBfKPefkWeF79Ns
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/16/2014 08:10 AM, Brian Norris wrote:
> On Wed, Apr 30, 2014 at 07:43:08AM +0200, Michal Simek wrote:
>> On 04/29/2014 07:05 PM, Brian Norris wrote:
>>> On Tue, Apr 29, 2014 at 02:02:07PM +0200, Michal Simek wrote:
>>>> commit a445f784ae5558a3da680aa6b39ed53c95a551c1
>>>> Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>>> Date:   Thu Aug 23 10:10:07 2012 +0300
>>>>
>>>>     JFFS2: fix unmount regression
>>>>
>>>>     This patch fixes regression introduced by
>>>>     "8bdc81c jffs2: get rid of jffs2_sync_super". We submit a delaye=
d work in order
>>>>     to make sure the write-buffer is synchronized at some point. But=
 we do not
>>>>     flush it when we unmount, which causes an oops when we unmount t=
he file-system
>>>>     and then the delayed work is executed.
>>>>
>>>>     This patch fixes the issue by adding a "cancel_delayed_work_sync=
()" infocation
>>>>     in the '->sync_fs()' handler. This will make sure the delayed wo=
rk is canceled
>>>>     on sync, unmount and re-mount. And because VFS always callse 'sy=
nc_fs()' before
>>>>     unmounting or remounting, this fixes the issue.
>>>>
>>>>     Reported-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>>>>     Cc: stable@vger.kernel.org [3.5+]
>>>>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.co=
m>
>>>>     Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>>>>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
>>>
>>> Bisection turned you up here?
>>
>> I have looked at it more and JFFS2_FS_WRITEBUFFER is broken from this =
commit.
>=20
> Write buffer support may or may not be necessary. What type of flash ar=
e
> you using?
>=20
>> When you disable it is working till this commit on Microblaze.
>>
>> commit ac093f8d5e76be1f2654acfd7a59d339ba037654
>> Author:     Michael S. Tsirkin <mst@redhat.com>
>>
>>     microblaze: uaccess s/might_sleep/might_fault/
>=20
> Hmm, that's only a debugging change. It only has an effect if you have
> CONFIG_PROVE_LOCKING or CONFIG_DEBUG_ATOMIC_SLEEP enabled. So that's no=
t
> the issue.

Yes I know.

>=20
>> And surprisingly the same change is causing problem on ARM.
>>
>> commit ad72907acd2943304c292ae36960bb66e6dc23c9
>> Author:     Will Deacon <will.deacon@arm.com>
>>
>>     ARM: 7528/1: uaccess: annotate [__]{get,put}_user functions with m=
ight_fault()
>=20
> *Not* surprisingly; it's the same thing, where we're enabling a
> debugging feature. Assuming the might_fault() code is accurate, it
> simply means we can now discover a bug that already exists, right?

yes.

What is more problematic is that the issue have been reported
in past but probably never fixed.
http://lists.infradead.org/pipermail/linux-mtd/2013-June/047312.html
http://lists.infradead.org/pipermail/linux-mtd/2013-June/047316.html
http://lists.infradead.org/pipermail/linux-mtd/2013-February/045888.html
http://www.spinics.net/lists/linux-rt-users/msg07617.html

On v3.6 we didn't observe any problem but it can be just because of
not sufficient testing.

>> I have revert these 2 patches and disable JFFS2_FS_WRITEBUFFER
>> on the top of that 5 patches and everything seems to work.
>>
>> Then I have tried to disable debug locking features which I have ON
>> and I have ended up that disabling CONFIG_PROVE_LOCKING
>> and CRC problem is back again.
>=20
> OK, so I don't think you've bisected properly. The might_fault() patche=
s
> seem unlikely to be a real source of the problem. If anything, they may=

> be helping to uncover it. But I do not know. I don't have very good
> information to go off of here.

I wouldn't say that I didn't bisected this properly. When commits
above are the first broken one that bisect was fine.
What wasn't sufficient was my tests because I wasn't able to reach
any problem before these commits.
Do you have written somewhere what tests should be run to do proper
FS testing? It can be the part of any other testing system like LTP.

Are there any standard tests which you are running on others FS?

>>> Honestly, I'm not too familiar with JFFS2. Maybe Artem can comment,
>>> since he authored this commit.
>>
>> Is someone doing any testing on JFFS2 at all?
>> From this debugging it looks like that JFFS2 have some serious issues
>> for quite a long time.
>=20
> I do not know who is doing JFFS2 testing these days. Most people have
> moved to UBIFS, which gets better support. JFFS2 is mostly in
> maintenance mode, with little active work.

I am not surprised.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--mFbFv3Kg4qR2t7mechNBfKPefkWeF79Ns
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlN1s30ACgkQykllyylKDCFTnwCfXUKqrYPJoiIYj6cxlJXQ3Emk
OBAAnjo65rsxLMOhaAJVShg/0zakG6HO
=pkR0
-----END PGP SIGNATURE-----

--mFbFv3Kg4qR2t7mechNBfKPefkWeF79Ns--
