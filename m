Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PX2Xd-0004Fd-V8
	for linux-mtd@lists.infradead.org; Mon, 27 Dec 2010 02:10:31 +0000
From: Liu Hui-R64343 <r64343@freescale.com>
To: Ming Lei <tom.leiming@gmail.com>, "David.Woodhouse@intel.com"
	<David.Woodhouse@intel.com>
Subject: RE: Issue : jffs2 and ecc layout
Date: Mon, 27 Dec 2010 02:12:10 +0000
Message-ID: <2CF7613B9822A943BEF13EF7ACEC5BD106D221@039-SN1MPN1-001.039d.mgd.msft.net>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
	<201012241602.36582.manningc2@actrix.gen.nz>
	<AANLkTi=DfzP5mkwJ3zWePSp+gthWV-OT1_kBVFtkpNWU@mail.gmail.com>
	<AANLkTi=YM2ONPfA9g4tFDQcJwfstGi_FLsrXTEcyby7b@mail.gmail.com>
	<AANLkTikNP4HU3cHHQXjSBCXqxz0ES1AhCZpt3ZqKu9KT@mail.gmail.com>
In-Reply-To: <AANLkTikNP4HU3cHHQXjSBCXqxz0ES1AhCZpt3ZqKu9KT@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi, Ming,=20
Yes, this patch has some issues and Artem has reverted it.
This patch is intent to fix the mtd_oobtest, step 4 issue, but it's wrong.
Please revert it. Sorry for that.


Best Regards,
Jason Liu


>-----Original Message-----
>From: Ming Lei [mailto:tom.leiming@gmail.com]
>Sent: Friday, December 24, 2010 10:11 PM
>To: Liu Hui-R64343; David.Woodhouse@intel.com
>Cc: Ghorai, Sukumar; linux-mtd@lists.infradead.org; linux-
>omap@vger.kernel.org; Charles Manning
>Subject: Re: Issue : jffs2 and ecc layout
>
>Hi Jason,
>
>2010/12/24 Ming Lei <tom.leiming@gmail.com>:
>> 2010/12/24 Ming Lei <tom.leiming@gmail.com>:
>>> Hi,
>>>
>>> 2010/12/24 Charles Manning <manningc2@actrix.gen.nz>:
>>>
>>>> THis might be due to the way the omap2.c driver is now screwed up so
>>>> that it does not read when not u32 aligned.
>>>>
>>>> Try this:
>>>> http://www.spinics.net/linux/lists/linux-omap/msg42422.html
>>>>
>>>> Please report back if that fixes the problem for you.
>>>
>>> No, the patch doesn't fix the issue.
>>
>> #mount -t jffs2 /dev/mtdblock4 /mnt/cf
>>
>> mount: /dev/mtdblock4: can't read superblock
>>
>> [ =A0 41.216796] nand_do_read_oob: Attempt to read past end of page [
>> 41.216827] cannot read OOB for EB at 00000000, requested 152 bytes,
>> read 0 bytes, error -22
>
>When I revert the patch below from Jason,
>
>       http://marc.info/?l=3Dlinux-kernel&m=3D129015697513966&w=3D2
>
>mount will be OK but with some info printed, see below:
>
>root@beagleboard:~# mount -t jffs2 /dev/mtdblock4 /mnt/cf
>[   39.662963] JFFS2 notice: (1324) jffs2_build_xattr_subsystem:
>complete building xattr subsystem, 0
>of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
>
>#mount
>......
>/dev/mtdblock4 on /media/cf type jffs2 (rw,relatime)
>
>So seems the patch from Jason does cause the issue, maybe should be
>dropped or fixed further.
>
>thanks,
>--
>Lei Ming
