Received: from martinlund.org ([173.255.130.145]
 helo=slmp-550-86.slc.westdc.net)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNf1Q-0005TL-1F
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 14:23:02 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33273)
 by slmp-550-86.slc.westdc.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <martin.lund@keep-it-simple.com>) id 1gNf1D-00ECRd-Mw
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 07:22:47 -0700
Received: by mail-ot1-f46.google.com with SMTP id i20so15005121otl.0
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2018 06:22:47 -0800 (PST)
MIME-Version: 1.0
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CAB7pii3kx75ajF=8TsU7mWrmrzoHLiy7uAb+PirGw04BH65bZg@mail.gmail.com>
 <6ce1726a-f24d-17b8-d839-0a51c424a850@xilinx.com>
 <MWHPR02MB26231009A82C0372F62B5292AFDD0@MWHPR02MB2623.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB26231009A82C0372F62B5292AFDD0@MWHPR02MB2623.namprd02.prod.outlook.com>
From: Martin Lund <martin.lund@keep-it-simple.com>
Date: Fri, 16 Nov 2018 15:22:35 +0100
Message-ID: <CAB7pii2XYoP8bejamD2Rp0gtu6u07De+io0Yh3p1b=B-wE1_Fw@mail.gmail.com>
Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
To: nagasure@xilinx.com
Cc: michals@xilinx.com, Martin Lund <martin.lund@keep-it-simple.com>,
 naga sureshkumar <nagasuresh12@gmail.com>, boris.brezillon@bootlin.com,
 richard@nod.at, linux-kernel@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, the clk_ prefix is kind of unnecessary. Though, all the
clock-names in zynqmp.dtsi are still using the prefix - hopefully that
will eventually be cleaned out.

Either way, we just need to make sure the device tree doc clock-names
are consistent with whatever is used by the driver.

Br, Martin
On Fri, Nov 16, 2018 at 2:50 PM Naga Sureshkumar Relli
<nagasure@xilinx.com> wrote:
>
> Hi,
>
> > -----Original Message-----
> > From: Michal Simek [mailto:michal.simek@xilinx.com]
> > Sent: Friday, November 16, 2018 6:04 PM
> > To: Martin Lund <martin.lund@keep-it-simple.com>; Naga Sureshkumar Rell=
i
> > <nagasure@xilinx.com>
> > Cc: boris.brezillon@bootlin.com; miquel.raynal@bootlin.com; richard@nod=
.at; David
> > Woodhouse <dwmw2@infradead.org>; Brian Norris <computersforpeace@gmail.=
com>; Marek
> > Va=C5=A1ut <marek.vasut@gmail.com>; naga sureshkumar <nagasuresh12@gmai=
l.com>; linux-
> > mtd@lists.infradead.org; linux-kernel@vger.kernel.org; robh@kernel.org
> > Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device=
 tree binding
> > documentation
> >
> > On 16. 11. 18 12:50, Martin Lund wrote:
> > > Hi Naga,
> > >
> > > I've been working on running up the latest kernel (v4.20-rc2) on our
> > > custom Xilinx hw board so that I can test the v12 version of your
> > > Arasan nand driver.
> > >
> > > I've managed to get the driver successfully up and running and ready
> > > for testing with a Micron MT29F64G08AFAAAWP device. However, setting
> > > it up I've found a few inaccuracies in the documentation of the devic=
e
> > > tree bindings.
> > >
> > > This is the device configuration that ended up working for me with
> > > linux v4.20-rc2:
> > >
> > >        nfc: nand@ff100000 {
> > >             compatible =3D "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
> > >             reg =3D <0x0 0xff100000 0x0 0x1000>;
> > >             clock-names =3D "clk_sys", "clk_flash";
> > >             clocks =3D <&clk200>, <&clk100>;
> > >             interrupt-parent =3D <&gic>;
> > >             interrupts =3D <0 14 4>;
> > >             #address-cells =3D <1>;
> > >             #size-cells =3D <0>;
> > >
> > >             nand@0 {
> > >                 reg =3D <0>;
> > >                 nand-ecc-mode =3D "hw";
> > >             };
> > >         };
> > >
> > > Compared with the example you will notice that "clock-name" should be
> > > "clock-names". reg was missing a "0x0".
> >
> > clock-names and even that names - you are right it is not correct and s=
hould be fixed.
> Clock-names I will change from "clock-name" to "clock-names".
> But I got some review comments previously, to use "sys" instead of  "clk_=
sys" and "flash" instead of "clk_flash".
> And I have to change this in driver.
> I will update that.
>
> Thanks,
> Naga Sureshkumar Relli
>
> >
> > Missing 0x0 in reg doesn't matter because it depends on address/size ce=
lls.
> >
> > > I think it is helpful to provide a real-world working example, so you
> > > might also consider changing the example "clocks" configuration to
> > > clk200/clk100 since there is no clk_misc among the clock sources of
> > > any of the xilinx zynqmp board device tree configurations.
> >
> > Real example is the best normally just c&p from existing dts is the way=
 to go.
> > But in connection to clocks it doesn't matter what exactly should be th=
ere and I don't think
> > there is any consistency in that. Hopefully this will be removed by yam=
l conversion.
> >
> > Thanks,
> > Michal
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
