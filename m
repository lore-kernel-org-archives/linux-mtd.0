From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Mathew Chasan'" <mathew@exbiblio.com>,
	<linux-mtd@lists.infradead.org>
References: <79F7EE04-68BE-48FA-986D-77090A9D597B@exbiblio.com>
Subject: RE: newbie needs help getting onenand to work...
Date: Fri, 8 Jun 2007 11:24:26 +0900
Message-ID: <003b01c7a974$3091caf0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <79F7EE04-68BE-48FA-986D-77090A9D597B@exbiblio.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Hi List,
> 
> I'm trying to get a Samsung KFH4G16Q2M Onenand to work with the
> Freescale i.MX31.  I'm using a modified version of the 2.6.19.2 tree
> available on the freescale website.
> 
> Basically i have yet to get anywhere.  I've enabled the MTD and
> OneNand drivers in the kernel  but thats about it.  Interestingly, i
> don't see any sort of indication that the OneNand drivers are even
> getting initialized in any way during kernel boot.
> 
> I know that i'm going to need to somehow explain to the kernel where
> to look for my oneNand device, and what to look for, but i haven't
> figured out how to do this.  There's quite a lot out there on NAND
> and NOR devices of course, but i'm not clear on what needs to be the
> same and different for a OneNand part.  I spent all day yesterday
> searching for any sort of documentation either online or in the code,
> and found very little talking about oneNand.  Today i'm looking
> through the code trying to put together what i need to do, but was
> hoping someone might be able to help me, either by pointing me to a
> preexisting document, or by quickly telling me what steps i need to
> take/what i need to define to get this to work.

Hi,
There's OneNAND reference board, Apollon.
linux/arch/arm/mach-omap2/board-apollon.c [1]

First, you define mtd partitions.
Second, define the OneNAND address at struct resource.
Third, register struct platform_device with namd "onenand"

static struct platform_device apollon_onenand_device = {
        .name           = "onenand",
        .id             = -1,
        .dev            = {
                .platform_data  = &apollon_flash_data,
        },
        .num_resources  = ARRAY_SIZE(apollon_flash_resource),
        .resource       = apollon_flash_resource,
};

Finally, you can see some message at boot.

Muxed OneNAND 256MB 1.8V 16-bit (0x40)
Scanning device for bad blocks
Bad eraseblock 411 at 0x03360000
Bad eraseblock 716 at 0x05980000
Bad eraseblock 1176 at 0x09300000
Creating 6 MTD partitions on "onenand":
0x00000000-0x00020000 : "X-Loader + U-Boot"
0x00020000-0x00040000 : "params"
0x00040000-0x00240000 : "kernel"
0x00240000-0x01240000 : "rootfs"
0x01240000-0x03240000 : "filesystem00"
0x03240000-0x10000000 : "filesystem01"

As Nishanth Menon wrote omap2430sdp for reference but it is OMAP2 specific. It's
not work on other architectures. Also it's not yet merged mtd tree.

Thank you,
Kyungmin Park

1.
http://source.mvista.com/git/gitweb.cgi?p=linux-omap-2.6.git;a=blob;h=16428f6290
20b1d19516d75f54631e51fd13b84c;hb=e0e0c1591b129da1246eaa51b91f040f6dfb2a2e;f=arc
h/arm/mach-omap2/board-apollon.c
