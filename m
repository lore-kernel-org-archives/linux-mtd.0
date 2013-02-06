From: "Philip, Avinash" <avinashphilip@ti.com>
To: Tony Lindgren <tony@atomide.com>
Subject: RE: [PATCH 1/4] arch: arm: gpmc: gpmc migration support
Date: Wed, 6 Feb 2013 11:38:57 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA6E6A3@DBDE01.ent.ti.com>
References: <1358933176-12409-1-git-send-email-avinashphilip@ti.com>
 <1358933176-12409-2-git-send-email-avinashphilip@ti.com>
 <20130201220510.GY22517@atomide.com>
In-Reply-To: <20130201220510.GY22517@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Hilman, Kevin" <khilman@ti.com>, "Mohammed, Afzal" <afzal@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hiremath,
 Vaibhav" <hvaibhav@ti.com>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 02, 2013 at 03:35:10, Tony Lindgren wrote:
> * Philip Avinash <avinashphilip@ti.com> [130123 01:28]:
> > With recent GPMC driver conversion, usage of gpmc_save/restore_context
> > can done from gpmc driver itself. Hence removes the usage from pm34xx.c=
.
> > Also removes the conditional compilation primitives ARCH_OMAP3 for
> > gpmc_save/restore_context.
>=20
> Hmm I think this will break GPMC for deeper idle modes. Note that we
> need to save and restore the context every time hitting off-idle, not
> just for suspend and resume. Or am I missing something here?

I understand dependency on idle modes. So I will send a second version
with this patch eliminated so that user initiated suspend/resume work
for am335x platforms.

Thanks
Avinash

>=20
> Regards,
>=20
> Tony
>=20
