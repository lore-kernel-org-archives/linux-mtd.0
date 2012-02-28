From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Subject: RE: [PATCH v5 2/3] arm:davinci: move emif driver to mfd framework
Date: Tue, 28 Feb 2012 05:44:39 +0000
Message-ID: <A73F36158E33644199EB82C5EC81C7BC3176D103@DBDE01.ent.ti.com>
References: <y> <1330005504-25321-3-git-send-email-prakash.pm@ti.com>
 <20120227142638.GN27687@sortiz-mobl>
In-Reply-To: <20120227142638.GN27687@sortiz-mobl>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "Nori,
 Sekhar" <nsekhar@ti.com>,
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

On Mon, Feb 27, 2012 at 19:56:38, Samuel Ortiz wrote:
[snip]
> So it seems you're passing a platform devices array through your mfd aemi=
f
> platform data pointer. And from what I can see, it's mostly a 1 entry arr=
ay
> (for the NAND case) or a 2 entries array (for the NAND and NOR case).
> In that case, adding an MFD driver in the middle brings basically nothing=
 but
> confusion and overhead (and 200+ lines of code).
> So unless someone explains to me how this is doing any good to the kernel=
 in
> general, I'm not going to take this patchset.
>=20
> Cheers,
> Samuel.
>

In this way we trying to isolate future modification of aemif driver not to=
 depict
as platform code change, the need for this is based on discussion in below =
thread
http://davinci-linux-open-source.1494791.n2.nabble.com/PATCH-arm-davinci-co=
nfigure-davinci-aemif-chipselects-through-OF-tt7059739.html#none

Earlier also concern was expressed to move aemif driver out of arch/arm to =
drivers folder.
Here is the link for the same: http://lists.infradead.org/pipermail/linux-m=
td/2011-August/037308.html
Since aemif driver supports NAND/NOR devices, we feel MFD is the place hold=
er.

Thanks,
Prakash
