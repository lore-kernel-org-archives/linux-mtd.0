From: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
CC: Mark Brown <broonie@kernel.org>, Michal Simek <michals@xilinx.com>,
 "Soren Brinkmann" <sorenb@xilinx.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 "juhosg@openwrt.org" <juhosg@openwrt.org>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Harini Katakam <harinik@xilinx.com>,
 "Punnaiah Choudary Kalluri" <punnaia@xilinx.com>, "ran27jit@gmail.com"
 <ran27jit@gmail.com>
Subject: RE: [RFC PATCH 0/2] spi: add dual parallel & stacked mode support
 in Zynq MPSoC GQSPI controller
Date: Fri, 17 Jul 2015 12:03:48 +0000
Message-ID: <7CFCFE83B8145347A1D424EC939F1C3CA7F18F@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
 <20150714164005.GE11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA7E53D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150715160146.GS11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA7E758@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150716085739.GT11162@sirena.org.uk>
In-Reply-To: <20150716085739.GT11162@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Thursday, July 16, 2015 2:28 PM
> To: Ranjit Abhimanyu Waghmode
> Cc: Michal Simek; Soren Brinkmann; dwmw2@infradead.org;
> computersforpeace@gmail.com; zajec5@gmail.com; marex@denx.de;
> shijie.huang@intel.com; juhosg@openwrt.org; ben@decadent.org.uk; linux-
> mtd@lists.infradead.org; linux-spi@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Harini Katakam;
> Punnaiah Choudary Kalluri; ran27jit@gmail.com
> Subject: Re: [RFC PATCH 0/2] spi: add dual parallel & stacked mode suppor=
t in
> Zynq MPSoC GQSPI controller
>
> On Thu, Jul 16, 2015 at 07:27:34AM +0000, Ranjit Abhimanyu Waghmode wrote=
:
>
> > For an example take two flashes connected in stacked mode.
> > For user it doesn't matter whether how many flashes are really connecte=
d.
> > There will be situation like, single partition is spread across two fla=
shes
> (partition staring at the end of one flash and continued to the second fl=
ash). But
> it has to be shown contiguous to user.
> > In this scenario, I am not clear how MTD layer will handle the case.
> > It would be great if you could just put some light on it.
>
> That's something for the MTD layer or possibly even a layer above it to w=
orry
> about - this situation is the same as we have with disks where we have md=
 which
> combines other devices, if something similar is needed for flash we shoul=
d use a
> similar pattern.

Kindly help in understanding, how can we represent the stacked mode and par=
allel mode changes in MTD layer?

Thanks & Regards,
Ranjit


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
