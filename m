Received: from mail-px0-f176.google.com ([209.85.216.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDqqG-0007Cn-FJ
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 02:13:43 +0000
Received: by pxi6 with SMTP id 6so520420pxi.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Jun 2009 19:13:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244440779.5847.334.camel@localhost.localdomain>
References: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
	<1244440779.5847.334.camel@localhost.localdomain>
Date: Mon, 8 Jun 2009 19:13:33 -0700
Message-ID: <1c3f4270906081913g7e9b0334r183e87d782b2406d@mail.gmail.com>
Subject: Re: write error while using UBI/UBIFS
From: Manoj <manoj23@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the pointers. But I am using kernel v2.6.27.7. :-(

Meanwhile, I disabled all extra checks and
CONFIG_MTD_NAND_VERIFY_WRITE as recommended. Now, I see this when I
unmount and re-mount ubifs:

# mount -o sync -t ubifs ubi0:rootfs /tmp/flash/
[  101.480000] UBIFS error (pid 164): ubifs_scan: corrupt empty space
at LEB 1:14336
[  101.490000] UBIFS error (pid 164): ubifs_scanned_corruption:
corrupted data at LEB 1:14336
[  101.500000] UBIFS error (pid 164): ubifs_scan: LEB 1 scanning failed
[  101.530000] UBIFS error (pid 164): ubifs_recover_master_node:
failed to recover master node
mount: mounting ubi0:rootfs on /tmp/flash/ failed: Invalid argument
.

On Sun, Jun 7, 2009 at 10:59 PM, Artem Bityutskiy<dedekind@infradead.org> w=
rote:
> Hi,
>
> On Fri, 2009-06-05 at 20:05 -0700, Manoj wrote:
>> I have created a ubi image that I have programmed to NAND flash using
>> ubiformat. After I mount the ubifs, I am trying to write a 3MB file to
>> the flash and I am seeing some issues.
>
> Please, make sure you have all the latest UBI and UBIFS fixes:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source
> I think I fixed debugging problems recently. I suspect this fix may
> help you:
> http://git.infradead.org/ubi-2.6.git?a=3Dcommit;h=3Df9fd3ec55e099ccd6894d=
7e639e2419c53a823e0
>
>> I have enabled UBI debug and CONFIG_MTD_NAND_VERIFY_WRITE.
>
> Please, also take this into account:
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail
>
>
>> Also, as an experiment, I used mtd_debug utility to write a 10MB image
>> to the flash and I don't see any issues there. So, it doesn't sound
>> like a driver issue?
>> HW ECC is enabled and I am presuming that no maintenance data is
>> stored in spare area for UBI/UBIFS (from documentation). I don't see
>> errors with ECC off.
>
> Enabling debugging checks for verification is good. But please, bear
> in mind that they make your system slower.
>
> If you enable just debugging - it is light-weight, but if you also
> enable additional checks - they are very slow, so you should later
> disable them.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
