Received: from mail-ie0-f172.google.com ([209.85.223.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfNPd-0000gn-Ul
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 05:50:36 +0000
Received: by mail-ie0-f172.google.com with SMTP id as1so1404919iec.17
 for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2014 22:50:12 -0700 (PDT)
Message-ID: <53608D6C.3020008@monstr.eu>
Date: Wed, 30 Apr 2014 07:43:08 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: JFFS2 locking issue on 3.14 + patches
References: <535E7A58.8090102@monstr.eu> <20140428165108.GU32070@ld-irv-0074>
 <535F94BF.60004@monstr.eu> <20140429170530.GA9418@norris-Latitude-E6410>
In-Reply-To: <20140429170530.GA9418@norris-Latitude-E6410>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="w0DpwUKhP3KRb5OXnLjDPNOH90I3ANbn5"
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wang Guoli <andy.wangguoli@huawei.com>,
 Li Zefan <lizefan@huawei.com>, linux-mtd@lists.infradead.org,
 Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>
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
--w0DpwUKhP3KRb5OXnLjDPNOH90I3ANbn5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/29/2014 07:05 PM, Brian Norris wrote:
> + Artem
>=20
> On Tue, Apr 29, 2014 at 02:02:07PM +0200, Michal Simek wrote:
>> On 04/28/2014 06:51 PM, Brian Norris wrote:
>>> On Mon, Apr 28, 2014 at 05:57:12PM +0200, Michal Simek wrote:
>>>> we are having this problem with JFFS2 rootfs. It is v3.14 kernel
>>>> with these 5 patches which cherry-picked from 3.15.
>>>>
>>>> 41bf1a2 jffs2: Fix crash due to truncation of csize
>>>> 3367da5 jffs2: Fix segmentation fault found in stress test
>>>> 01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
>>>> 13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
>>>> 3ead957 jffs2: remove from wait queue after schedule()
>>>
>>> Have you bisected these? And possibly test the patches in isolation
>>> (there are only 5)?
> [...]
>> Bisecting these five patches don't solve anything.
>=20
> BTW, for your bisecting, did you have a clean version of your
> filesystem? After a bug creates CRC / data errors, it's possible
> that--no matter what kernel you boot--you will retain those errors on
> your flash media.

I didn't see any problem like this. It means filesystem
is not corrupted when CRC problem happen.


>> Locking issue was introduced 3.6-rc3 by this commit.
>> I will check CONFIG_JFFS2_FS_WRITEBUFFER option.
>=20
> Sorry, I think I misread your first report; your problem is probably no=
t
> with any of these 5 patches, but with some other yet-unsolved issue.

Yes that's my impression too.

>> commit a445f784ae5558a3da680aa6b39ed53c95a551c1
>> Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Date:   Thu Aug 23 10:10:07 2012 +0300
>>
>>     JFFS2: fix unmount regression
>>
>>     This patch fixes regression introduced by
>>     "8bdc81c jffs2: get rid of jffs2_sync_super". We submit a delayed =
work in order
>>     to make sure the write-buffer is synchronized at some point. But w=
e do not
>>     flush it when we unmount, which causes an oops when we unmount the=
 file-system
>>     and then the delayed work is executed.
>>
>>     This patch fixes the issue by adding a "cancel_delayed_work_sync()=
" infocation
>>     in the '->sync_fs()' handler. This will make sure the delayed work=
 is canceled
>>     on sync, unmount and re-mount. And because VFS always callse 'sync=
_fs()' before
>>     unmounting or remounting, this fixes the issue.
>>
>>     Reported-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>>     Cc: stable@vger.kernel.org [3.5+]
>>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>=

>>     Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
>=20
> Bisection turned you up here?

I have looked at it more and JFFS2_FS_WRITEBUFFER is broken from this com=
mit.
When you disable it is working till this commit on Microblaze.

commit ac093f8d5e76be1f2654acfd7a59d339ba037654
Author:     Michael S. Tsirkin <mst@redhat.com>

    microblaze: uaccess s/might_sleep/might_fault/

And surprisingly the same change is causing problem on ARM.

commit ad72907acd2943304c292ae36960bb66e6dc23c9
Author:     Will Deacon <will.deacon@arm.com>

    ARM: 7528/1: uaccess: annotate [__]{get,put}_user functions with migh=
t_fault()


I have revert these 2 patches and disable JFFS2_FS_WRITEBUFFER
on the top of that 5 patches and everything seems to work.

Then I have tried to disable debug locking features which I have ON
and I have ended up that disabling CONFIG_PROVE_LOCKING
and CRC problem is back again.


> Honestly, I'm not too familiar with JFFS2. Maybe Artem can comment,
> since he authored this commit.

Is someone doing any testing on JFFS2 at all?
=46rom this debugging it looks like that JFFS2 have some serious issues
for quite a long time.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--w0DpwUKhP3KRb5OXnLjDPNOH90I3ANbn5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNgjW0ACgkQykllyylKDCFtTwCfVN2/OJ7ujeV2kxZZs7VCgmKb
2mkAn3Cheb4UMoXHVsYkQYt61GEJME9b
=cnQQ
-----END PGP SIGNATURE-----

--w0DpwUKhP3KRb5OXnLjDPNOH90I3ANbn5--
