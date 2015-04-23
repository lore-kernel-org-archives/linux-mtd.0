Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yl7Ch-0005hF-L3
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 02:49:28 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Ben Shelton <ben.shelton@ni.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date: Thu, 23 Apr 2015 12:48:53 +1000
Subject: RE: Adding subpage support to NAND driver -- backwards
 compatibility concerns
Message-ID: <EACD232272DA4849B060F0828564D13B95342BDE78@ntcex01.corp.netcomm.com.au>
References: <20150422172944.GA4134@bshelton-desktop>
In-Reply-To: <20150422172944.GA4134@bshelton-desktop>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "punnaiah.choudary.kalluri@xilinx.com"
 <punnaiah.choudary.kalluri@xilinx.com>, "joshc@ni.com" <joshc@ni.com>,
 "xander.huff@ni.com" <xander.huff@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Apr 2015 03:29:44 +1000
Ben Shelton <ben.shelton@ni.com> wrote:

> We'd like to upstream our patch, but my concern is that UBIFS behaves
> differently when it knows that the flash device supports subpages.  I
> have a couple of questions related to that:
>=20
> - I know from experience that bad things happen when you use a kernel
>   without subpage support with an UBIFS filesystem that was formatted
>   with subpage support.  Is it safe to do the opposite (kernel with
>   subpage support / UBIFS filesystem formatted without subpage
> support)?
>=20
> - Assuming that it isn't safe, what's the best way to add subpage
>   support to this driver in an upstreamable way / without breaking
>   people?  Would it be sufficient to add subpage support as a Kconfig
>   option that's disabled by default with a strongly-worded message
>   describing the consequences of enabling it?

Hi Ben,


from what I understand, the only part of the UBI/UBIFS stack that
uses / cares about subpages are the UBI EC and VID headers. If you
have subpage access, the two headers will share a page, if not, they
live in separate pages. With subpages, you half your UBI overhead.

This affects the LEB size for UBIFS as well as the UBI header and data
locations within the PEB, so the filesystems are incompatible.

If you add subpage support to a system that previously had none, and
presumably want to use the old file systems, you need to force the
ubiattach command to use the page size as the VID header offset.

Something like

	PAGESIZE=3D`cat /sys/class/mtd/mtd0/writesize`
	ubiattach /dev/ubi_ctrl -O $PAGESIZE ...

Same applies to any ubiformat commands.

This stops UBI from using the subpage capability. You also don't
get the benefit of the lower overhead, of course.

Traditionally, if someone changes the kernel config, breaking things
is definitely expected consequences. So, making subpage support
a default-off option for the driver has my vote.


Best regards,

Iwo
