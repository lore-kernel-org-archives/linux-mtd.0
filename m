Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8YuI-0003u6-Lu
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 19:35:39 +0000
Received: by pfbo64 with SMTP id o64so31695579pfb.1
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 11:35:17 -0800 (PST)
Date: Mon, 14 Dec 2015 11:35:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonas Gorski <jogo@openwrt.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Simon Arlott <simon@fire.lp0.eu>, Rob Herring <robh+dt@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
Message-ID: <20151214193515.GC10460@google.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
 <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
 <20151207175835.GM120110@google.com>
 <20151209011256.GV120110@google.com>
 <CAMuHMdVGW-7dQ3vAqVpUN_S7=T7dVp+jkMJR7nyZ9ePd+NnsyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGW-7dQ3vAqVpUN_S7=T7dVp+jkMJR7nyZ9ePd+NnsyQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2015 at 03:49:14PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 9, 2015 at 2:12 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Mon, Dec 07, 2015 at 09:58:35AM -0800, Brian Norris wrote:
> >> On Sat, Dec 05, 2015 at 12:45:36PM +0100, Jonas Gorski wrote:
> >> > On Fri, Dec 4, 2015 at 3:02 AM, Brian Norris
> >> > <computersforpeace@gmail.com> wrote:
> >> > >         // proposed
> >> > >         partitions {
> >> > >                 compatible = "partitions";
> >> >
> >> > "partitions" sounds mode like a device_type thing than a compatible
> >> > name, maybe "fixed-partitions"? IMHO that would describe better what
> >> > these are, and doesn't invite to think using compatible =
> >> > "arm,arm-flash-structure", "partitions"; is a good idea.
> >>
> >> "fixed-partitions" sounds OK to me. If no objections, I'll apply these
> >> patches, with (approximately) a:
> >>
> >> s/"partitions"/"fixed-partitions"/
> >
> > Pushed to linux-mtd.git with the above change.
> 
> Aarghl, hadn't seen this patch before.
> 
> This breaks the users that have already added the partitions subnodes
> (armada-xp-lenovo-ix4-300d.dts and a few shmobile).

Sorry, I checked Linus' master and not linux-next :(

> Will send patches to fix it...

Thanks.

Brian
