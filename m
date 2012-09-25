Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGRWK-0006ia-MR
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 09:33:37 +0000
Received: by wibhn17 with SMTP id hn17so4339673wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2012 02:33:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348499094.4880.65.camel@sauron.fi.intel.com>
References: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
 <1348499094.4880.65.camel@sauron.fi.intel.com>
Date: Tue, 25 Sep 2012 11:33:35 +0200
Message-ID: <CACna6ryu06qsgX99kdkeDaB+XJv4XwC0-O+5ysNFa1iOMEgNow@mail.gmail.com>
Subject: Re: Problem with verify-ing patch (error: arch/m68k/Kconfig.cpu:
 patch does not apply)
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/24 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2012-09-24 at 13:14 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> I wanted to verify my patch before sending it.
>>
>> TRY[0]:
>> > ./verify ../wireless-testing/ mips-bcm47xx_defconfig < ../nand4/0001-m=
td-prepare-place-for-BCMA-NAND-flash-driver-s.patch
>> error: patch failed: arch/m68k/Kconfig.cpu:28
>> error: arch/m68k/Kconfig.cpu: patch does not apply
>>
>> Weird. My patch doesn't touch m68k and applies cleanly to the
>> ../wireless-testing tree:
>>
>> > cd ../wireless-testing/
>> > git am ../nand4/0001-mtd-prepare-place-for-BCMA-NAND-flash-driver-s.pa=
tch
>> Applying: mtd: prepare place for BCMA NAND flash driver(s)
>>
>> Help? :|
>
> It tries to apply quick fixes - I carry them because the kernel gets
> broken in various places all the time. So you need to fix the quick
> fixes patch - probably a fix was applied in upstream already.
>
> Obviously, quick fixes are in maintaining.git, not in the generic aiaiai
> tools. They are in 'quick_fixes.mbox'.
>
> In this case it easy - the m68k patch get merged upstream and just can
> be dropped from quick_fixes.mbox. Just done that and pushed out.

Thanks. Unfortunately I'm still having problems with verify/aiaiai :|

After your change I started verify again and it took 3 minutes to let
me know it needs mips-linux-gcc. I had to install it (OpenWRT is using
it's own toolchain).

Then I started again and after 3 minutes: lacking sparse

3 minutes later: lacking smatch

3 minutes later: lacking cppcheck

3 minutes later: lacking spatch

I'm not sure what's going to be next. I'm sure that things are obvious
for you, but beginner can really get irritated before he manages to
setup everything... ;/

--=20
Rafa=C5=82
