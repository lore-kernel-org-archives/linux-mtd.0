Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ10F-0004LZ-34
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 09:42:05 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Charles Manning <manningc2@actrix.gen.nz>
Content-Class: urn:content-classes:message
Date: Thu, 18 Nov 2010 09:41:55 +0000
Subject: RE: Are there UBI layout changes between 2.6.35 and 2.6.36?
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EF69021@Cloud.RL.local>
In-Reply-To: <201011181244.04745.manningc2@actrix.gen.nz>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> Folk
>
> I have been helping some people get an omap3 overo-based system going.
> Everything is working fine using 2.6.35 and software ECC, but
> when I changed
> I change to 2.6.36 and hwecc things stop working. I get the following
> problem, and obviously no boot :-(.
>
> UBI: attaching mtd7 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI: corrupted PEBs will be formatted
> UBI: max. sequence number:       0
> UBI error: vtbl_check: bad CRC at record 0: 0xc4ef3d92, not 0x639e7026
> UBI error: vtbl_check: bad CRC at record 0: 0xc4ef3d92, not 0x639e7026
> UBI error: process_lvol: both volume tables are corrupted
> UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
> UBI error: ubi_init: cannot attach mtd7

...

> mkfs.ubifs  -m 2048 -e 126KiB -c 1000 -r .  $tmp_dir/ubifs.tmp
> ubinize -o $out_file -p 128KiB -s 512 -m 2048 ubinize.cmd
>
> Has something changed between 2.6.35 and 2.6.36 that will
> mess up the way the
> volumes are managed?

A couple of months ago there was a bad patch to mtd.utils that
caused mkfs.ubifs to generate bogus CRCs. That cause similar
symptoms for me. It was fixed before 2.6.36 came out of -rc.

Did you update your mtd.utils as well as the kernel?

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
