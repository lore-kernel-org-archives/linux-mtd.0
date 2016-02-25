From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "Thomas.Betker@rohde-schwarz.com" <Thomas.Betker@rohde-schwarz.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "sztomi89@gmail.com" <sztomi89@gmail.com>, "wangzaiwei@top-vision.cn"
 <wangzaiwei@top-vision.cn>, "deng.chao1@zte.com.cn" <deng.chao1@zte.com.cn>,
 "liu.ming50@gmail.com" <liu.ming50@gmail.com>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux-mtd-bounces@lists.infradead.org"
 <linux-mtd-bounces@lists.infradead.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: Re: JFFS2 deadlock
Date: Thu, 25 Feb 2016 07:46:20 +0000
Message-ID: <1456386428.3632.2.camel@infinera.com>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
 <1453910781.20662.35.camel@infinera.com>
 <20160128000559.GA14270@google.com>
 <OF7C1394C5.2BBD0A26-ONC1257F48.002BF506-C1257F48.002D6C9C@rohde-schwarz.com>
 <1454336914.133285.297.camel@infradead.org>
 <OF2969B332.8B296F0B-ONC1257F4C.006307EB-C1257F4C.0067DE44@LocalDomain>
 <OF19585295.84AA7860-ONC1257F5D.0031E02A-C1257F5D.0036B10E@rohde-schwarz.com>
In-Reply-To: <OF19585295.84AA7860-ONC1257F5D.0031E02A-C1257F5D.0036B10E@rohde-schwarz.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <6FA7532076B97A4A9F819518844EF5A5@infinera.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-02-18 at 10:57 +0100, Thomas.Betker@rohde-schwarz.com wrote:
> Hello David:
>=20
> >=20
> > >=20
> > > Please could you try what's in the tree at
> > > http://git.infradead.org/users/dwmw2/jffs2-fixes.git
> >=20
> > Your patch looks much simpler, and I will definitely test it. It may
> > take a few days, though, as I have to unearth the test scripts, and=A0
> > find a time slot for testing.
> Here is what I did (sorry for the wait, things were piling up):
>=20
> 1) Removed Deng Chao's patch from my kernel, added your patch "jffs2: Fix=
=A0
> page lock / f->sem deadlock". I am still on linux-3.14, but jffs2 hasn't=
=A0
> changed much since then, so this shouldn't make a difference. Added a=A0
> printk() before mutex_unlock(&f->sem) to check if the prospective page wa=
s=A0
> locked, i.e. if the deadlock situation actually occurs.
>=20
> 2) On my target system, started wangzaiwei's test (with some fixes), plus=
=A0
> a loop copying a large file over and over (to get GC rolling, which=A0
> increases the chance of a deadlock).
>=20
> 3) After 24 hours, the system was still alive, and the printk() had been=
=A0
> hit 32 times.
>=20
> So yes, I am confident that your patch avoids the deadlock, and if that's=
=A0
> good enough for you, please add my Tested-by:. However, I am going to run=
=A0
> some more stress tests here just to check that there weren't any=A0
> unexpected side effects. (Don't get me wrong -- I am sure the patch is=A0
> fine, but for me it's a case of "once bitten, twice shy" ...)

Can we get this upstream before next release? I don't think there will much=
 more
testing at this point.

=A0Jocke=
