Received: from mail1.bemta7.messagelabs.com ([216.82.254.106])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlQKX-00081X-0k
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 23:14:49 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Richard Weinberger <richard@nod.at>, Josh Cartwright <joshc@ni.com>
Date: Fri, 24 Apr 2015 09:13:24 +1000
Subject: RE: Adding subpage support to NAND driver -- backwards
 compatibility concerns
Message-ID: <EACD232272DA4849B060F0828564D13B95342BDE88@ntcex01.corp.netcomm.com.au>
References: <20150422172944.GA4134@bshelton-desktop>
 <EACD232272DA4849B060F0828564D13B95342BDE78@ntcex01.corp.netcomm.com.au>
 <20150423183957.GR27115@jcartwri.amer.corp.natinst.com>,
 <5539486F.60407@nod.at>
In-Reply-To: <5539486F.60407@nod.at>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Ben Shelton <ben.shelton@ni.com>, "xander.huff@ni.com" <xander.huff@ni.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "punnaiah.choudary.kalluri@xilinx.com" <punnaiah.choudary.kalluri@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Apr 2015 05:30:55 +1000
Richard Weinberger <richard@nod.at> wrote:

> Am 23.04.2015 um 20:39 schrieb Josh Cartwright:

> > Is there no metadata in the UBI data structures in flash that
> > indicate the min IO boundary?  Assuming no, is another option to,
> > at the time of attach, try both the min IO access size, and, if
> > that doesn't work, try the page size?
>=20
> Correct. UBI has no information about that.
> If you add subpage support to the driver I'd make it opt-in such that
> existing setups won't break.

I'm wondering, given that EC headers contain vid header offset
and data offset fields, shouldn't UBI be able to deduce at attach
time what the relevant parameters are on a partition?

Something along the lines of using the parameters of the first
PEB with valid EC header, then balking if another EC header is
encountered with different info. As long as MTD allows the
so deduced minimum access size, it seems safe.

This could help enormously in situations like this, where
MTD drivers experience sudden bursts of improvement.


Best regards,

Iwo
