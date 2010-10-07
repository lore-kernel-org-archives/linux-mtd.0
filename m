Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3uK2-0000J6-Eb
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 17:32:03 +0000
Received: by qyk34 with SMTP id 34so604600qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 10:31:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B0356594397@dbde02.ent.ti.com>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B0356594397@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 7 Oct 2010 23:01:36 +0530
Message-ID: <AANLkTi=y1JwSBrELd=KyUsmhitSCF2eWW9iYFg3a_-J4@mail.gmail.com>
Subject: Re: Issue : jffs2 and ecc layout
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 4, 2010 at 12:59 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
>
>
>> -----Original Message-----
>> From: linux-omap-owner@vger.kernel.org [mailto:linux-omap-
>> owner@vger.kernel.org] On Behalf Of Ghorai, Sukumar
>> Sent: Tuesday, September 28, 2010 6:17 PM
>> To: linux-mtd@lists.infradead.org
>> Cc: linux-omap@vger.kernel.org
>> Subject: Issue : jffs2 and ecc layout
>>
>> Hi,
>> I was using the following ecc layout which is not working to mount the
>> jffs2 File-system. I was in 2.6.32 kernel and working; but same layout i=
s
>> not working with latest 2.6 kernel.
>>
>> Observation is that - no read request issued to the driver (say omap2.c)=
.
>>
>> # mount -t jffs2 /dev/mtdblock4 /mnt/nand
>> [=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 bytes=
, read
>> 0 bytes, error -22
>> mount: Mounting /dev/mtdblock4 on /mnt/nand failed: Input/output error
>>
>> # dmesg
>> <3>[=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 by=
tes,
>> read 0 bytes, error -22
>>
I do not think above issue has anything to do with the ECC layout.
But as I earlier pointed (in [1]), this change [2] has messed up
function 'omap_hwcontrol'.
All read/write functions read/write data from/to address
info->nand.IO_ADDR_(R/W), which is not set by new function
'gpmc_nand_write' (which still take care of writing address/cmd to
write registers). But since above pointer is not set (hence points to
address '0'), driver tries to read data from wrong location.

In fact, I would even suggest to try dumping nand command registers(or
use T32) and verify if commands issued were written correctly to
appropriate registers.



[1]: http://marc.info/?l=3Dlinux-omap&m=3D128302624528822&w=3D2
[2] commit: http://git.infradead.org/mtd-2.6.git/commitdiff/2c01946c6b9ebaa=
5a89710bc42ca224a7f52f227

--=20
Regards,
Vimal Singh
