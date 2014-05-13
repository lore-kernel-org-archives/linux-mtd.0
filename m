Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk92i-0001Eu-RG
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 09:30:37 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH 2/2] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Tue, 13 May 2014 09:29:55 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3EF335@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11F5@post.tritech.se>,
 <1397567532.4441.9.camel@karhu>,
 <ED3E0BCACD909541BA94A34C4A164D4C5B3D17D4@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3D17D4@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi again Artem,=0A=
=0A=
Another bump...=0A=
=0A=
I'll be leaving this project shortly but I'm prepared to give this another =
shot=0A=
provided that I understand what you want. Please explain or otherwise I'll=
=0A=
just drop this now.=0A=
=0A=
Best Regards,=0A=
Mats=0A=
=0A=
On Tuesday, April 15, 2014 5:07 PM, Mats K=E4rrman wrote:=0A=
>Hi Artem,=0A=
>=0A=
>Ehhhh.... I think either you have confused things a bit or I totally misun=
derstand you.=0A=
>=0A=
>Both the "-p" and the "-P" options enable UBIFS power-cut tests. AfaIk the=
re is no such thing for UBI (?).=0A=
>My problem is that I like to run the tests on my target platform that uses=
 UBIFS as root FS.=0A=
>If I enable "power-cut" emulation globally (i.e. echo 1 > /sys/kernel/debu=
g/ubifs/tst_recovery) this will=0A=
>enable "power-cuts" not only for the tested partition (good) but also for =
my root fs (bad).=0A=
>UBIFS gives the opportunity to also enable "power-cuts" for a specific UBI=
 volume (e.g.=0A=
>echo 1 > /sys/kernel/debug/ubifs/ubi1_0/tst_recovery) but this only works =
until the UBI partition=0A=
>is reattached (the flag is initialized to 0).=0A=
>What "-P" does differently from "-p" is that it re-enables the power-cut e=
mulation for the used=0A=
>partition before continuing the test after a remount.=0A=
>=0A=
>It seems that the help-text of integck suggests that the power-cut test mo=
de is available for=0A=
>any filesystem that is "able to emulate power-cuts" so the "(currently imp=
lemented for UBIFS only)"=0A=
>is there because this is the only fs integck is (currently) able to reenab=
le emulation for. ("-p"=0A=
>requires emulation to be enabled before launching integck which took me a =
while to figure out=0A=
>so this should perhaps also be written in the help text).=0A=
>=0A=
>BR // Mats=0A=
>=0A=
>________________________________________=0A=
>From: Artem Bityutskiy [dedekind1@gmail.com]=0A=
>Sent: Tuesday, April 15, 2014 3:12 PM=0A=
>To: Mats K=E4rrman=0A=
>Cc: linux-mtd@lists.infradead.org=0A=
>Subject: Re: [PATCH 2/2] mtd-utils: integck: add support for volume specif=
ic power-cut test=0A=
>=0A=
>Hi Mats,=0A=
>=0A=
>pushed the first patch out, thanks.=0A=
>=0A=
>On Mon, 2014-04-14 at 11:47 +0000, Mats K=E4rrman wrote:=0A=
>> -"continues forever.\n";=0A=
>> +"continues forever.\n"=0A=
>> +"Whereas -p requires power cut emulation to be enabled globally, the -P=
 option\n"=0A=
>> +"automatically enables the use of power cut emulation on the tested fs =
instance\n"=0A=
>> +"only (currently implemented for UBIFS only).\n";=0A=
>=0A=
>Could we please invent an easy to understand way of naming this and the=0A=
>option.=0A=
>=0A=
>So essentially, this is about emulating power cuts at UBI and UBIFS=0A=
>levels. The "reenabling" thing is a small details which should not be=0A=
>visible in --help, because it is confusing anyway.=0A=
>=0A=
>I'd suggest to split this patch on 2. First patch renames the option to=0A=
>'--ubi-power-cut', refines help message, may be some comments and=0A=
>function names, if needed.=0A=
>=0A=
>The second patch introduces '--ubifs-power-cut', and explains that this=0A=
>makes sure that power cuts happen in the UBIFS driver, versus the=0A=
>underlying UBI driver.=0A=
>=0A=
>Thanks!=0A=
>=0A=
>--=0A=
>Best Regards,=0A=
>Artem Bityutskiy=0A=
