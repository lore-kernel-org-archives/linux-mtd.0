Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOuiH-0003rr-Jt
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 19:25:30 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, "olof@lixom.net"
 <olof@lixom.net>, "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "tony@atomide.com" <tony@atomide.com>, "avinashphilipk@gmail.com"
 <avinashphilipk@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "Balbi, Felipe" <balbi@ti.com>
Subject: RE: [PATCH v6 1/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Date: Wed, 25 Sep 2013 19:24:26 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA16884@DBDE04.ent.ti.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-2-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA15ED7@DBDE04.ent.ti.com>
 <20130925134619.GG10746@radagast>
 <20130925175527.GA23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20130925175527.GA23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
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

Hi Brian,

>=20
> Hi Pekon,
>=20
> On Wed, Sep 25, 2013 at 08:46:19AM -0500, Felipe Balbi wrote:
> > + akpm
> >
> > On Tue, Sep 24, 2013 at 01:04:05PM -0500, Gupta, Pekon wrote:
[snip]
> > >
> > > Dear Olof and other DT Maintainers,
> > >
> > > This patch series has missed multiple merge windows, and
> > > much of the other development work on mtd/nand/omap
> > > driver is gated due to this.
>=20
> Also, to be fair here: you only started CC'ing the appropriate DT
> people/list around v4, after which you got a (somewhat) prompt and
> thorough review of the DT bindings. Then several months passed before
> you addressed the reviews. So the "multiple merge windows" is not
> entirely to be blamed on others ;)
>=20
> Brian

Few points I would like to clarify here, *without* pointing anyone..

(1) It was Olof's comments which directed me to cc: devicetree-discuss list=
.
So wrong list was always cc-ed till v4.
Refer http://permalink.gmane.org/gmane.linux.ports.arm.kernel/249662

(2) The devicetree list has been updated in MAINTAINER file towards
end of July (22/July/2013) in following commit. Whereas the patch v4
was submitted on 2/July/2013. So I wasn't aware of this new DT maillist.
commit d0fb18c5c0caf2ed0eecf3d0145450ae708ed75a
Commit:     Grant Likely <grant.likely@linaro.org>
CommitDate: 2013-07-22

(3) When a maintainer gives a NAK, I expect him to at-least give
directions on what to change in the patch. There were no comments
given, neither new patch reviewed by the DT maintainer even after
sending multiple request directly.
http://lists.infradead.org/pipermail/linux-mtd/2013-July/047441.html
http://lists.infradead.org/pipermail/linux-mtd/2013-July/047629.html

Its only when Artem and yourself pitched in by sending a mail to
new DT mail-list that the DT maintainer reviewed and provided the
comments for fixes.
But by that time 3.11-rc6 had already gone past, and so I knew this
Series cannot go in, so I wanted to wait some more, to see if there
were any more comments on this. And frankly I was too much
frustrated by then.

Just to speak my opinion.
We all understand that maintainers are heavily loaded by tons of
emails, And reviewing each patch instantly is not possible.

But this load is now passing to developers like me as frustration,
because most of energy is being spent in re-submitting patches
again and again, without any proper direction or conclusion.
And then there is no time and energy left for good work, where
we can contribute to optimizing frame-works for performance or
adding new features.
So I see many good developers distracting away from mainline.

Thus, there should be a mechanism, where such load can be
distributed, and there are less emails. And developers don't
have to re-submit patch multiple times, by collecting most reviews
at once.  This way developer's like me can spend more time in doing
other constructive things.

Please consider this as constructive feedback, without targeting
any individual or team.


with regards, pekon
