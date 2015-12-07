Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a603v-00055W-PK
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 17:59:00 +0000
Received: by pacdm15 with SMTP id dm15so128348979pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 09:58:38 -0800 (PST)
Date: Mon, 7 Dec 2015 09:58:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Simon Arlott <simon@fire.lp0.eu>, Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
Message-ID: <20151207175835.GM120110@google.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
 <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 05, 2015 at 12:45:36PM +0100, Jonas Gorski wrote:
> On Fri, Dec 4, 2015 at 3:02 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> >         // proposed
> >         partitions {
> >                 compatible = "partitions";
> 
> "partitions" sounds mode like a device_type thing than a compatible
> name, maybe "fixed-partitions"? IMHO that would describe better what
> these are, and doesn't invite to think using compatible =
> "arm,arm-flash-structure", "partitions"; is a good idea.

"fixed-partitions" sounds OK to me. If no objections, I'll apply these
patches, with (approximately) a:

s/"partitions"/"fixed-partitions"/

Thanks,
Brian

> >                 #address-cells = <x>;
> >                 #size-cells = <y>;
> >                 partition@0 {
> >                         ...;
> >                 };
> >         };
