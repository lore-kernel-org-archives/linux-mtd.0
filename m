Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKGNf-0004sw-7j
	for linux-mtd@lists.infradead.org; Sun, 21 Nov 2010 20:19:24 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: Re: Are there UBI layout changes between 2.6.35 and 2.6.36?
Date: Mon, 22 Nov 2010 09:19:16 +1300
References: <70E876B0EA86DD4BAF101844BC814DFE093EF69021@Cloud.RL.local>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093EF69021@Cloud.RL.local>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201011220919.17031.manningc2@actrix.gen.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 November 2010 22:41:55 Jon Povey wrote:
> linux-mtd-bounces@lists.infradead.org wrote:
> > Folk
> >
> > I have been helping some people get an omap3 overo-based system going.
> > Everything is working fine using 2.6.35 and software ECC, but
> > when I changed
> > I change to 2.6.36 and hwecc things stop working. I get the following
> > problem, and obviously no boot :-(.
> >
> > UBI: attaching mtd7 to ubi0
> > UBI: physical eraseblock size:   131072 bytes (128 KiB)
> > UBI: logical eraseblock size:    129024 bytes
> > UBI: smallest flash I/O unit:    2048
> > UBI: sub-page size:              512
> > UBI: VID header offset:          512 (aligned 512)
> > UBI: data offset:                2048
> > UBI: corrupted PEBs will be formatted
> > UBI: max. sequence number:       0
> > UBI error: vtbl_check: bad CRC at record 0: 0xc4ef3d92, not 0x639e7026
> > UBI error: vtbl_check: bad CRC at record 0: 0xc4ef3d92, not 0x639e7026
> > UBI error: process_lvol: both volume tables are corrupted
> > UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
> > UBI error: ubi_init: cannot attach mtd7
>
> ...
>
> > mkfs.ubifs  -m 2048 -e 126KiB -c 1000 -r .  $tmp_dir/ubifs.tmp
> > ubinize -o $out_file -p 128KiB -s 512 -m 2048 ubinize.cmd
> >
> > Has something changed between 2.6.35 and 2.6.36 that will
> > mess up the way the
> > volumes are managed?
>
> A couple of months ago there was a bad patch to mtd.utils that
> caused mkfs.ubifs to generate bogus CRCs. That cause similar
> symptoms for me. It was fixed before 2.6.36 came out of -rc.
>
> Did you update your mtd.utils as well as the kernel?
>

I too stumbled across that bug.
I am using the latest utils from git with both .35 and .36 so that should not 
be the problem unless there was a volume format change.

I shall investigate further.

Thanks

Charles
