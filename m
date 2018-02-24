Date: Sat, 24 Feb 2018 17:09:18 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, oss@buserror.net, leoyang.li@nxp.com
Subject: Re: [PATCH 0/4][v4][RESEND] dt-bindings: mtd-physmap: Add endianness
 supports
Message-ID: <20180224090917.GQ3217@dragon>
References: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
 <20180222112814.3717af47@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180222112814.3717af47@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 22, 2018 at 11:28:14AM +0100, Boris Brezillon wrote:
> Hi Prabhakar,
> 
> On Thu, 22 Feb 2018 15:45:05 +0530
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
> 
> > Connection between flash and controller is not necessary to be always
> > of same type. It may varies from platform to platform.
> > 
> > Adding endianness (optional) property to provide connection type
> > information. This endianness property is checked in physmap_of_core.c
> > to decide swap type. 
> > 
> > This patch also set "big-endian" property for ls1021a, ls1043a
> > and ls1046a device tree. here connection between IFC controller
> > and NOR flash is big-endian.
> > 
> > Prabhakar Kushwaha (4):
> >   dt-bindings: mtd-physmap: Add endianness supports
> >   driver: mtd: update struct map_info's swap as per map requirement
> >   ARM: dts: Add NOR connection type with IFC
> >   ARM64: dts: Add NOR connection type with IFC
> 
> First of all, can you stop sending dts changes until we've agreed on
> the dt-bindings/driver changes.

+1

Shawn
