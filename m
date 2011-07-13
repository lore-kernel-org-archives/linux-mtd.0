Received: from mail132.messagelabs.com ([216.82.242.115])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qh7iF-0008Uw-P8
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2011 22:15:28 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Date: Wed, 13 Jul 2011 17:15:17 -0500
Subject: RE: [PATCH] new helper to define common struct resource constructs
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F383E058E9@AUSP01VMBX24.collaborationhost.net>
References: <14C4E31473AF7E4B98176CB73615181C19FBD3@039-SN1MPN1-006.039d.mgd.msft.net>
	<201107121529.17611.arnd@arndb.de>
	<20110713141849.b8cbf675.akpm@linux-foundation.org>
	<201107132342.18648.arnd@arndb.de>
In-Reply-To: <201107132342.18648.arnd@arndb.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Wolfram Sang <w.sang@pengutronix.de>,
	"thierry.nolf.barco@gmail.com" <thierry.nolf.barco@gmail.com>,
	Huang Shijie <b32955@freescale.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Lothar_Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, July 13, 2011 2:42 PM, Arnd Bergmann wrote:
> On Wednesday 13 July 2011 23:18:49 Andrew Morton wrote:
>>> On Monday 11 July 2011, Uwe Kleine-K__nig wrote:
>>>> resource definitions that just define start, end and flags =3D IORESOU=
RCE_MEM
>>>> or IORESOURCE_IRQ (with start=3Dend) are quite common. So introduce a =
shortcut
>>>> for them. Also make available a macro to specify named resources of bo=
th
>>>> types which are less common.
>>>>=20
>>>> Signed-off-by: Uwe Kleine-K____nig <u.kleine-koenig@pengutronix.de>
>>>=20
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>=20
>>> What do others think, is this worthwhile?
>>> Should we also define macros for IORESOURCE_IO and IORESOURCE_DMA?
>>>=20
>>
>> It would help if we could see some usage examples (ie: sample
>> conversions), to get a better idea of the value of this.
>
> Uwe posted a patch '[PATCH] ARM: mxc: use new helpers to define
> common struct resource entries' that converts one ARM platform to use
> it, with reasonable outcome:
>
> 26 files changed, 72 insertions(+), 308 deletions(-)

ep93xx doesn't have that many but converting it's core.c gives:

 1 files changed, 19 insertions(+), 93 deletions(-)

Regards,
Hartley
