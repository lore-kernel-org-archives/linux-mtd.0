Received: from mail-pa0-f51.google.com ([209.85.220.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfAX1-0002CI-Gr
 for linux-mtd@lists.infradead.org; Tue, 29 Apr 2014 16:05:20 +0000
Received: by mail-pa0-f51.google.com with SMTP id fb1so418983pad.24
 for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2014 09:04:53 -0700 (PDT)
Message-ID: <535F94BF.60004@monstr.eu>
Date: Tue, 29 Apr 2014 14:02:07 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: JFFS2 locking issue on 3.14 + patches
References: <535E7A58.8090102@monstr.eu> <20140428165108.GU32070@ld-irv-0074>
In-Reply-To: <20140428165108.GU32070@ld-irv-0074>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="XaUnpI1olQCdW8I2nc1tA6DwpeN8CII2D"
Cc: Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>,
 Li Zefan <lizefan@huawei.com>, linux-mtd@lists.infradead.org,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Wang Guoli <andy.wangguoli@huawei.com>
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
--XaUnpI1olQCdW8I2nc1tA6DwpeN8CII2D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/28/2014 06:51 PM, Brian Norris wrote:
> On Mon, Apr 28, 2014 at 05:57:12PM +0200, Michal Simek wrote:
>> we are having this problem with JFFS2 rootfs. It is v3.14 kernel
>> with these 5 patches which cherry-picked from 3.15.
>>
>> 41bf1a2 jffs2: Fix crash due to truncation of csize
>> 3367da5 jffs2: Fix segmentation fault found in stress test
>> 01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
>> 13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
>> 3ead957 jffs2: remove from wait queue after schedule()
>=20
> Have you bisected these? And possibly test the patches in isolation
> (there are only 5)?

=46rom top to down - reverts on the top of these 5 patches.

HEAD: Locking issue I have sent in origin email and CRC problems

Reverting
41bf1a2 jffs2: Fix crash due to truncation of csize
Generates a lot of warnings like this.
[    6.250541] jffs2: warning: (682) jffs2_get_inode_nodes: Eep. No valid=
 nodes for ino #261.
[    6.258732] jffs2: warning: (682) jffs2_do_read_inode_internal: no dat=
a nodes found for ino #261


Reverting one patch
3367da5 jffs2: Fix segmentation fault found in stress test
on the top of 5 patches
- lock issue is present but CRC issue is gone on uniprocessor system. CRC=
 issue is present on SMP case

Reverting two patches
3367da5 jffs2: Fix segmentation fault found in stress test
01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
on the top of 5 patches
- only locking issue is reported, CRC issue is gone on uniprocessor syste=
m


Reverting 3 patches
3367da5 jffs2: Fix segmentation fault found in stress test
01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
on the top of 5 patches
- locking issue still present with CRC issue again and data problems.

[   18.959144] jffs2: notice: (630) check_node_data: wrong data CRC in da=
ta node at 0x0015348c: read 0x8fb195d5, calculated 0xbc622daa.
[   18.971009] jffs2: warning: (630) jffs2_do_read_inode_internal: no dat=
a nodes found for ino #392
[   18.979766] jffs2: Returned error for crccheck of ino #392. Expect bad=
ness...
[   39.152478] jffs2: notice: (630) check_node_data: wrong data CRC in da=
ta node at 0x00492cd8: read 0xe62c6036, calculated 0xf875522b.
[   39.167465] jffs2: warning: (630) jffs2_do_read_inode_internal: Trunca=
ting ino #822 to 41568 bytes failed because it only had 40960 bytes to st=
art with!


Reverting 3 patches
3367da5 jffs2: Fix segmentation fault found in stress test
01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
3ead957 jffs2: remove from wait queue after schedule()
on the top of 5 patches
- locking issue still present with CRC issue again and data problems.


Origin testing was done on zynq with qspi and I have also
retest it on microblaze and NOR flash and issue is just there.

Bisecting these five patches don't solve anything.

Locking issue was introduced 3.6-rc3 by this commit.
I will check CONFIG_JFFS2_FS_WRITEBUFFER option.

commit a445f784ae5558a3da680aa6b39ed53c95a551c1
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Thu Aug 23 10:10:07 2012 +0300

    JFFS2: fix unmount regression

    This patch fixes regression introduced by
    "8bdc81c jffs2: get rid of jffs2_sync_super". We submit a delayed wor=
k in order
    to make sure the write-buffer is synchronized at some point. But we d=
o not
    flush it when we unmount, which causes an oops when we unmount the fi=
le-system
    and then the delayed work is executed.

    This patch fixes the issue by adding a "cancel_delayed_work_sync()" i=
nfocation
    in the '->sync_fs()' handler. This will make sure the delayed work is=
 canceled
    on sync, unmount and re-mount. And because VFS always callse 'sync_fs=
()' before
    unmounting or remounting, this fixes the issue.

    Reported-by: Ludovic Desroches <ludovic.desroches@atmel.com>
    Cc: stable@vger.kernel.org [3.5+]
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
    Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>


Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--XaUnpI1olQCdW8I2nc1tA6DwpeN8CII2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNflMEACgkQykllyylKDCFXewCffngs5ofLs2c50tCwUP4VrqB0
+lcAn1UQd0z0UB8vKYwyMcZaSs/G8xBF
=M3MZ
-----END PGP SIGNATURE-----

--XaUnpI1olQCdW8I2nc1tA6DwpeN8CII2D--
