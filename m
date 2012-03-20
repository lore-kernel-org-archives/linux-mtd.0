From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Subject: RE: [PATCH v5 2/3] arm:davinci: move emif driver to mfd framework
Date: Tue, 20 Mar 2012 12:57:55 +0000
Message-ID: <A73F36158E33644199EB82C5EC81C7BC3178627F@DBDE01.ent.ti.com>
References: <y> <1330005504-25321-3-git-send-email-prakash.pm@ti.com>
 <20120227142638.GN27687@sortiz-mobl>
 <A73F36158E33644199EB82C5EC81C7BC3176D103@DBDE01.ent.ti.com>
 <20120301112329.GI9008@sortiz-mobl>
 <A73F36158E33644199EB82C5EC81C7BC317702E9@DBDE01.ent.ti.com>
 <20120316172908.GG20524@sortiz-mobl>
In-Reply-To: <20120316172908.GG20524@sortiz-mobl>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Hi Samuel,

On Fri, Mar 16, 2012 at 22:59:08, Samuel Ortiz wrote:
> Hi Prakash,
>=20
> On Tue, Mar 06, 2012 at 01:12:25PM +0000, Manjunathappa, Prakash wrote:
> > Hi Samuel,
> >=20
> > May be I did not do a good job giving complete information on this earl=
ier.
> > So I have replied on top of my mail with below information (seems you m=
issed it)
> >=20
> I did get it, sorry for not being able to reply earlier.
>=20
>=20
> > Taking above points into consideration Arnd Bergmann suggested to move =
AEMIF driver to
> > MFD framework [1], relevant portion of his mail as follows,
> >=20
> > " If you want it to provide endpoint devices that are handled by
> > distinct subsystems in Linux, I would make it an mfd multifunction
> > device and make the common... "
> You're missing that part of the quote:
>=20
> "...code a driver that scans the connected memories in order to register
> its child devices for each of the subsystems."
>=20

emif is not discoverable interface, does not support scanning for connected=
 devices.

Could you please let me know if there is any other way to achieve this? I w=
ill be happy
to incorporate that and submit next version of the patch.

Thanks,
Prakash
