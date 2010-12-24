Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PW8Lr-0005w2-W7
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 14:10:37 +0000
Received: by wwb17 with SMTP id 17so7914398wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Dec 2010 06:10:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=YM2ONPfA9g4tFDQcJwfstGi_FLsrXTEcyby7b@mail.gmail.com>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
	<201012241602.36582.manningc2@actrix.gen.nz>
	<AANLkTi=DfzP5mkwJ3zWePSp+gthWV-OT1_kBVFtkpNWU@mail.gmail.com>
	<AANLkTi=YM2ONPfA9g4tFDQcJwfstGi_FLsrXTEcyby7b@mail.gmail.com>
Date: Fri, 24 Dec 2010 22:10:33 +0800
Message-ID: <AANLkTikNP4HU3cHHQXjSBCXqxz0ES1AhCZpt3ZqKu9KT@mail.gmail.com>
Subject: Re: Issue : jffs2 and ecc layout
From: Ming Lei <tom.leiming@gmail.com>
To: Jason Liu <r64343@freescale.com>, David.Woodhouse@intel.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Charles Manning <manningc2@actrix.gen.nz>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Ghorai, Sukumar" <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jason,

2010/12/24 Ming Lei <tom.leiming@gmail.com>:
> 2010/12/24 Ming Lei <tom.leiming@gmail.com>:
>> Hi,
>>
>> 2010/12/24 Charles Manning <manningc2@actrix.gen.nz>:
>>
>>> THis might be due to the way the omap2.c driver is now screwed up so th=
at it
>>> does not read when not u32 aligned.
>>>
>>> Try this:
>>> http://www.spinics.net/linux/lists/linux-omap/msg42422.html
>>>
>>> Please report back if that fixes the problem for you.
>>
>> No, the patch doesn't fix the issue.
>
> #mount -t jffs2 /dev/mtdblock4 /mnt/cf
>
> mount: /dev/mtdblock4: can't read superblock
>
> [ =A0 41.216796] nand_do_read_oob: Attempt to read past end of page
> [ =A0 41.216827] cannot read OOB for EB at 00000000, requested 152
> bytes, read 0 bytes, error -22

When I revert the patch below from Jason,

       http://marc.info/?l=3Dlinux-kernel&m=3D129015697513966&w=3D2

mount will be OK but with some info printed, see below:

root@beagleboard:~# mount -t jffs2 /dev/mtdblock4 /mnt/cf
[   39.662963] JFFS2 notice: (1324) jffs2_build_xattr_subsystem:
complete building xattr subsystem, 0
of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.

#mount
......
/dev/mtdblock4 on /media/cf type jffs2 (rw,relatime)

So seems the patch from Jason does cause the issue, maybe should be
dropped or fixed further.

thanks,
--=20
Lei Ming
