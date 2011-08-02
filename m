Received: from comal.ext.ti.com ([198.47.26.152])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoHOL-0006Hw-Os
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 16:00:26 +0000
From: "Nori, Sekhar" <nsekhar@ti.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>, "Rajashekhara, Sudhakar"
	<sudhakar.raj@ti.com>
Date: Tue, 2 Aug 2011 21:30:07 +0530
Subject: RE: [PATCH] mtd: nand: davinci: Add cpufreq support
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB593024DE78781@dbde02.ent.ti.com>
References: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
	<CAPcSpELvskFmRxEyBcZVGOqW8nKthk-1AbLXG4c4pUs_XQ2xmA@mail.gmail.com>
In-Reply-To: <CAPcSpELvskFmRxEyBcZVGOqW8nKthk-1AbLXG4c4pUs_XQ2xmA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben,

On Tue, Aug 02, 2011 at 18:32:39, Ben Gardiner wrote:
> Hi Sudhakar,
>=20
> On Thu, Jul 21, 2011 at 5:39 AM, Rajashekhara, Sudhakar
> <sudhakar.raj@ti.com> wrote:
> > This patch adds cpufreq support for NAND driver. During cpufreq
> > transition, 'davinci_aemif_setup_timing()' function will be called
> > to reconfigure that AEMIF timings for the new frequency.
>=20
> I can see that this will work fine for dacinci_nand -- and it is a
> welcomed feature also -- thank you for the effort to push this
> upstream.
>=20
> Seeing this support added directly to davinci_nand driver made me
> think -- now this driver has another reference to platform-specific
> functions in arch/arm/mach-davinci/aemif.c. Recently the c6x project
> pushed a fix to remove references to a platform specific include. Not
> that you are re-introducing this include but in a more general sense:
> perhaps the features/functions of the AEMIF _bus_ should be removed
> from the davinci_nand driver?

Good point! arch/arm/mach-davinci/aemif.c should be moved to drivers/
Because AEMIF is present on C6x and OMAP architectures as well and
not limited to DaVinci.

I am not sure if there are any existing "memory interface" drivers.
Moving to drivers/misc/ may be a good point to start.

Making AEMIF a new bus type is an interesting idea as well.

Thanks,
Sekhar
