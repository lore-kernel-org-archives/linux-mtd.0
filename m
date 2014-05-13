Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkCJW-0006ej-EU
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 13:00:11 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH 2/2] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Tue, 13 May 2014 12:59:40 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3EF5E5@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11F5@post.tritech.se>	,
 <1397567532.4441.9.camel@karhu>
 <ED3E0BCACD909541BA94A34C4A164D4C5B3D17D4@post.tritech.se>,
 <1399978838.1797.35.camel@sauron.fi.intel.com>
In-Reply-To: <1399978838.1797.35.camel@sauron.fi.intel.com>
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

On Sent: Tuesday, May 13, 2014 1:00 PM, Artem Bityutskiy wrote:=0A=
> On Tue, 2014-04-15 at 15:07 +0000, Mats K=E4rrman wrote:=0A=
>> Both the "-p" and the "-P" options enable UBIFS power-cut tests. AfaIk t=
here is no such thing for UBI (?).=0A=
>> My problem is that I like to run the tests on my target platform that us=
es UBIFS as root FS.=0A=
>> If I enable "power-cut" emulation globally (i.e. echo 1 > /sys/kernel/de=
bug/ubifs/tst_recovery) this will=0A=
>> enable "power-cuts" not only for the tested partition (good) but also fo=
r my root fs (bad).=0A=
>=0A=
> OK, thanks for explaining.=0A=
>=0A=
>> UBIFS gives the opportunity to also enable "power-cuts" for a specific U=
BI volume (e.g.=0A=
>> echo 1 > /sys/kernel/debug/ubifs/ubi1_0/tst_recovery) but this only work=
s until the UBI partition=0A=
>> is reattached (the flag is initialized to 0).=0A=
>=0A=
> Why wouldn't we have this to be the default, and the only way?=0A=
=0A=
I assume we're still talking about changing integck and not about changing =
the UBIFS linux=0A=
kernel driver ability to enable power-cuts globally.=0A=
>=0A=
>> What "-P" does differently from "-p" is that it re-enables the power-cut=
 emulation for the used=0A=
>> partition before continuing the test after a remount.=0A=
>=0A=
> Do we really need 2 options for this test? May be we can just use per-FS=
=0A=
> knob in the old option?=0A=
=0A=
Perhaps I'm overly concerned about backwards compatibility... =0A=
Also I was uncertain about if it may be relevant whether power-cut emulatio=
n is enabled=0A=
during the remount but I guess that in that case it is still possible to ha=
ve power-cuts =0A=
enabled globally.=0A=
>=0A=
>> It seems that the help-text of integck suggests that the power-cut test =
mode is available for=0A=
>> any filesystem that is "able to emulate power-cuts" so the "(currently i=
mplemented for UBIFS only)"=0A=
>=0A=
> Well, this was probably a mistake to add this comment, feel free to kill=
=0A=
> it. This is ubifs-specific.=0A=
>=0A=
>> is there because this is the only fs integck is (currently) able to reen=
able emulation for. ("-p"=0A=
>> requires emulation to be enabled before launching integck which took me =
a while to figure out=0A=
>> so this should perhaps also be written in the help text).=0A=
>=0A=
> You are always welcome with a patch :-)=0A=
=0A=
So, what you're suggesting is that we should change integck so that:=0A=
a) it has only one power-cut emulation switch: -p=0A=
b) this switch should enable (and re-enable) power-cut emulation per fs ins=
tance (always).=0A=
=0A=
Right?=0A=
=0A=
BR // mats=0A=
