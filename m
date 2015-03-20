Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZ2Bo-0000Fa-2N
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 19:02:37 +0000
Received: by pdbni2 with SMTP id ni2so116639016pdb.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2015 12:02:14 -0700 (PDT)
Date: Fri, 20 Mar 2015 12:02:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Message-ID: <20150320190205.GV32500@ld-irv-0074>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
 <CACna6rz-4nKE_iV2-8aG3ZEcrpN88A0iX4cHC+FudJ-==H9p7w@mail.gmail.com>
 <20150312105352.GC30145@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150312105352.GC30145@leverpostej>
Cc: Marek Vasut <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 12, 2015 at 10:53:52AM +0000, Mark Rutland wrote:
> On Thu, Mar 12, 2015 at 10:36:29AM +0000, Rafał Miłecki wrote:
> > On 12 March 2015 at 11:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
> > > <computersforpeace@gmail.com> wrote:
> > >> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
> > >> index 4611aa83531b..1b2997d4cee4 100644
> > >> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
> > >> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> > >> @@ -3,9 +3,12 @@
> > >>  Required properties:
> > >>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
> > >>    representing partitions.
> > >> -- compatible : Should be the manufacturer and the name of the chip. Bear in mind
> > >> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can be
> > >> +               identified by the JEDEC READ ID opcode (0x95).
> > >> +               Additionally, may include a device-specific string consisting of
> > >> +               the manufacturer and name of the chip. Bear in mind
> > >
> > > For the casual reader, this suggests putting "nor-jedec" first, which is not
> > > what we want. So I would write it like e.g.
> > >
> > > "Should be the manufacturer and the name of the chip. Additionally,
> > >  should contain "nor-jedec" for any SPI NOR flash that can be
> > >  identified by the JEDEC READ ID opcode (0x95)."
> > 
> > I don't really like above. It suggests using manufacturer,name
> > always/in most cases. This is what we want to avoid. Let's use
> > "nor-jedec" wherever possible (when dealing with JEDEC compatible
> > flashes).
> 
> The compatible property is a list. We should have "nor-jedec" in the
> list, but a more specific string should come first. If we don't
> recognise the more specific string, we'll still recognise nor-jedec, if
> we do recognise it then we can do more advacned things with the HW (or
> work around errata).

Right, I think this is fair, and that was really the intention, even if
it wasn't communicated well.

I *do* want to communicate that (where applicable) "nor-jedec" must be
included, since that would eliminate the need for maintaining a stable
list of bindings for >95% of flash. But the 'manufacturer,model' option
is still a good safeguard, and it would definitely come first in the
compatible list.

I'll reword this so the more specific option comes first, but still make
it clear that "nor-jedec" is strongly suggested.

Brian
