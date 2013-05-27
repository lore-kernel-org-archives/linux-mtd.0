Received: from imta21.fe.bosch.de ([139.15.243.226])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UgxPU-00006m-8s
 for linux-mtd@lists.infradead.org; Mon, 27 May 2013 13:24:26 +0000
Received: from smtp6-v.fe.bosch.de (imta23.fe.bosch.de [139.15.243.227])
 by imta21.fe.bosch.de (Postfix) with ESMTP id B2204C0342
 for <linux-mtd@lists.infradead.org>; Mon, 27 May 2013 15:14:54 +0200 (CEST)
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: Jan Kara <jack@suse.cz>
Date: Mon, 27 May 2013 15:13:49 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
In-Reply-To: <20130527121828.GA32625@quack.suse.cz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem and/or Adrian,

As you see we ran into some issue looking at UBIFS.
(We use a custom build Linux-2.6.37.6 kernel/distro)

Here you see a part of our log-output
UBIFS DBG (pid 767): ubifs_bg_thread: background thread "ubifs_bgt1_1" star=
ted, PID 767
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 1, volume 1, name "datafs"
UBIFS: file system size:   640475136 bytes (625464 KiB, 610 MiB, 1241 LEBs)
UBIFS: journal size:       10452992 bytes (10208 KiB, 9 MiB, 21 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS DBG (pid 1): mount_ubifs: compiled on:         May 27 2013 at 13:08:2=
4
UBIFS DBG (pid 1): mount_ubifs: min. I/O unit size:  4096 bytes
UBIFS DBG (pid 1): mount_ubifs: max. write size:     4096 bytes
UBIFS DBG (pid 1): mount_ubifs: LEB size:            516096 bytes (504 KiB)
UBIFS DBG (pid 1): mount_ubifs: data journal heads:  1
UBIFS DBG (pid 1): mount_ubifs: UUID:                1D1AD726-53AB-4623-8D8=
6-B7773B5EFA83
UBIFS DBG (pid 1): mount_ubifs: big_lpt              0
UBIFS DBG (pid 1): mount_ubifs: log LEBs:            4 (3 - 6)
UBIFS DBG (pid 1): mount_ubifs: LPT area LEBs:       2 (7 - 8)
UBIFS DBG (pid 1): mount_ubifs: orphan area LEBs:    1 (9 - 9)
UBIFS DBG (pid 1): mount_ubifs: main area LEBs:      1241 (10 - 1250)
UBIFS DBG (pid 1): mount_ubifs: index LEBs:          31
UBIFS DBG (pid 1): mount_ubifs: total index bytes:   702944 (686 KiB, 0 MiB=
)
UBIFS DBG (pid 1): mount_ubifs: key hash type:       0
UBIFS DBG (pid 1): mount_ubifs: tree fanout:         8
UBIFS DBG (pid 1): mount_ubifs: reserved GC LEB:     166
UBIFS DBG (pid 1): mount_ubifs: first main LEB:      10
UBIFS DBG (pid 1): mount_ubifs: max. znode size      240
UBIFS DBG (pid 1): mount_ubifs: max. index node size 192
UBIFS DBG (pid 1): mount_ubifs: node sizes:          data 48, inode 160, de=
ntry 56
UBIFS DBG (pid 1): mount_ubifs: node sizes:          trun 56, sb 4096, mast=
er 512
UBIFS DBG (pid 1): mount_ubifs: node sizes:          ref 64, cmt. start 32,=
 orph 32
UBIFS DBG (pid 1): mount_ubifs: max. node sizes:     data 4144, inode 4256 =
dentry 312, idx 188
UBIFS DBG (pid 1): mount_ubifs: dead watermark:      4096
UBIFS DBG (pid 1): mount_ubifs: dark watermark:      8192
UBIFS DBG (pid 1): mount_ubifs: LEB overhead:        2240
UBIFS DBG (pid 1): mount_ubifs: max. dark space:     10166272 (9928 KiB, 9 =
MiB)
UBIFS DBG (pid 1): mount_ubifs: maximum bud bytes:   8388608 (8192 KiB, 8 M=
iB)
UBIFS DBG (pid 1): mount_ubifs: BG commit bud bytes: 6815744 (6656 KiB, 6 M=
iB)
UBIFS DBG (pid 1): mount_ubifs: current bud bytes    405504 (396 KiB, 0 MiB=
)
UBIFS DBG (pid 1): mount_ubifs: max. seq. number:    8295846
UBIFS DBG (pid 1): mount_ubifs: commit number:       1434
UBIFS error (pid 1): ubifs_iget: failed to read inode 1, error -2
UBIFS DBG (pid 767): ubifs_bg_thread: background thread "ubifs_bgt1_1" stop=
s

Looking into the code I see the failed to read inode 1, error -2 is cause b=
y:
"ubifs_lookup_level0 -> -ENOENT" located in tnc.c

Looking inside the ubifs_lookup_level0 function it flows out of the functio=
n through:
        if (exact || !is_hash_key(c, key) || *n !=3D -1) {
                dbg_tnc("found %d, lvl %d, n %d", exact, znode->level, *n);
                return exact;
        }

Where:=20
	exact =3D 0
	*n =3D -1
	So: "!is_hash_key(c, key)" must be true.

'exact' is in the calling functioned interpret as found (where !found gener=
ates the error); this seems a littlebit curious to me.
But on first sight its complex code and maybe you can give some glue?

I suppose a piece of 'tree node cache' has been build-up during recovery...=
 could the problem be there?

Thanks in advance,

Anton

-----Original Message-----
From: Jan Kara [mailto:jack@suse.cz]=20
Sent: maandag 27 mei 2013 14:18
To: Prins Anton (ST-CO/ENG1.1)
Cc: jack@suse.cz; Artem Bityutskiy; Adrian Hunter; linux-mtd@lists.infradea=
d.org
Subject: Re: UBIFS failure & stable page writes

  Dear Prins,

On Mon 27-05-13 13:17:42, Prins Anton (ST-CO/ENG1.1) wrote:
> We are doing experiments with file systems on NAND flashes and experience
> some problems with UBIFS.  If required; it recovers correct, but on a
> certain moment (at boot) it seems it cannot find its root node anymore
> (recovery succeeded)
>=20
> While reading the logs on the kernel.org I came across your patch:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/fs=
/ubifs?id=3D182dcfd648aef0705fd04c42cbe507c09e00c25d
>=20
> Do you have some information what you experience in case of failure? Is
> it possible to lose (consequent) a root-node because unstable page
> writes?
  No, stable page write work shouldn't have any impact on this. NAND flash
isn't the kind of storage that requires stable pages. I think it's the best
if you ask ubifs maintainers directly - I've CCed them. BTW, you didn't
mention which kernel version you are using.

								Honza
--=20
Jan Kara <jack@suse.cz>
SUSE Labs, CR
