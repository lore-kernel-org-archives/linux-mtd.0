From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: RE: [PATCH v2 3/3] arm: da830: move NAND and NOR devices as aemif
 MFD slaves
Date: Mon, 30 Jan 2012 06:58:12 +0000
Message-ID: <A73F36158E33644199EB82C5EC81C7BC3175BD35@DBDE01.ent.ti.com>
References: <1327487156-10238-1-git-send-email-prakash.pm@ti.com>
 <1327487156-10238-3-git-send-email-prakash.pm@ti.com>
 <4F2016F4.2080302@mvista.com>
In-Reply-To: <4F2016F4.2080302@mvista.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

On Wed, Jan 25, 2012 at 20:21:32, Sergei Shtylyov wrote:
> Hello.
>=20
> On 01/25/2012 01:25 PM, Manjunathappa, Prakash wrote:
>=20
> > NAND and NOR device are made as aemif devices slave, hence device
> > registration achieved via aemif MFD driver.
>=20
> > Signed-off-by: Manjunathappa, Prakash<prakash.pm@ti.com>
> > ---
> > Since v1:
> > Patch is generated using -M option.
>=20
> >   arch/arm/mach-davinci/board-da830-evm.c |   31 ++++++++++++++++++++++=
+--------
> >   1 files changed, 23 insertions(+), 8 deletions(-)
>=20
>     Why only this file? Don't other board files have NAND/NOR devices?

Yes I thought of sending board-da850 changes in separate patch. Should I ha=
ve to send those changes also in this patch?

Thanks,
Prakash
>=20
> WBR, Sergei
>=20
