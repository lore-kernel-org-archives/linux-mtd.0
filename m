From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 08/12] memory: davinci-aemif: add bindings for AEMIF driver
Date: Mon, 11 Nov 2013 17:09:01 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D3A@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-9-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384187188-5776-9-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add bindings for AEMIF controller drivers/memory/davinici-aemif.c=0A=
=0A=
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=0A=
---=0A=
 .../bindings/memory-controllers/davinci-aemif.txt  |  198 ++++++++++++++++=
++++=0A=
 1 file changed, 198 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/da=
vinci-aemif.txt=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/memory-controllers/davinci-a=
emif.txt b/Documentation/devicetree/bindings/memory-controllers/davinci-aem=
if.txt=0A=
new file mode 100644=0A=
index 0000000..5e5319a=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/memory-controllers/davinci-aemif.tx=
t=0A=
@@ -0,0 +1,198 @@=0A=
+* Device tree bindings for Texas instruments Davinci/Keystone AEMIF contro=
ller=0A=
+=0A=
+Th Async External Memory Interface (EMIF16/AEMIF) controller is intended t=
o=0A=
+provide a glue-less interface to a variety of asynchronous memory devices =
like=0A=
+ASRA M, NOR and NAND memory. A total of 256M bytes of any of these memorie=
s=0A=
+can be accessed at any given time via four chip selects with 64M byte acce=
ss=0A=
+per chip select. Synchronous memories such as DDR1 SD RAM, SDR SDRAM=0A=
+and Mobile SDR are not supported.=0A=
+=0A=
+Documentation:=0A=
+Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf=0A=
+OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf=0A=
+Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf=0A=
+=0A=
+Required properties:=0A=
+=0A=
+- compatible:          "ti,davinci-aemif"=0A=
+                       "ti,keystone-aemif"=0A=
+                       "ti,omap-L138-aemif"=0A=
+=0A=
+- #address-cells:      Must be 2. The first cell is the memory partition=
=0A=
+                       number. The 0 partition is for chip selects. And th=
e=0A=
+                       second cell is the offset into the partition, for t=
he 0=0A=
+                       partition it corresponds to chip select offset.=0A=
+=0A=
+- #size-cells:         Must be set to 1.=0A=
+=0A=
+- reg:                 contains offset/length value for AEMIF control regi=
sters=0A=
+                       space.=0A=
+=0A=
+- ranges:              Must be set up to reflect the memory layout for 4=
=0A=
+                       chipselects and for AEMIF control range.=0A=
+=0A=
+- clocks:              phandle reference to the controller clock. Required=
 only=0A=
+                       if clock tree data present in device tree.=0A=
+                       See clock-bindings.txt=0A=
+=0A=
+- clock-names:         clock name. It has to be "aemif". Required only if =
clock=0A=
+                       tree data present in device tree, in another case d=
on't=0A=
+                       use it.=0A=
+                       See clock-bindings.txt=0A=
+=0A=
+- clock-ranges:                Empty property indicating that child nodes =
can inherit=0A=
+                       named clocks. Required only if clock tree data pres=
ent=0A=
+                       in device tree.=0A=
+                       See clock-bindings.txt=0A=
+=0A=
+=0A=
+Child chip-select (cs) nodes contain the memory devices nodes connected to=
=0A=
+such as NOR (e.g. cfi-flash) and NAND (ti,davinci-nand, see davinci-nand.t=
xt).=0A=
+There might be board specific devices like FPGAs.=0A=
+=0A=
+Required child cs node properties:=0A=
+=0A=
+- compatible:          "ti,davinci-cs"=0A=
+=0A=
+- #address-cells:      Must be 2. The first cell is the memory partition=
=0A=
+                       number. The 0 partition is for chip selects. And th=
e=0A=
+                       second cell is the offset into the partition, for t=
he 0=0A=
+                       partition it corresponds to chip select offset.=0A=
+=0A=
+- #size-cells:         Must be 1.=0A=
+=0A=
+- ranges:              Empty property indicating that child nodes can inhe=
rit=0A=
+                       memory layout.=0A=
+=0A=
+- clock-ranges:                Empty property indicating that child nodes =
can inherit=0A=
+                       named clocks. Required only if clock tree data pres=
ent=0A=
+                       in device tree.=0A=
+=0A=
+Optional child cs node properties:=0A=
+=0A=
+=0A=
+- ti,bus-width:                        width of the asynchronous device's =
data bus=0A=
+                               8 or 16 if not preset 8=0A=
+=0A=
+- ti,davinci-cs-ss:            enable/disable select strobe mode=0A=
+                               In select strobe mode chip select behaves a=
s=0A=
+                               the strobe and is active only during the st=
robe=0A=
+                               period. If present then enable.=0A=
+=0A=
+- ti,davinci-cs-ew:            enable/disable extended wait mode=0A=
+                               if set, the controller monitors the EMIFWAI=
T pin=0A=
+                               mapped to that chip select to determine if =
the=0A=
+                               device wants to extend the strobe period. I=
f=0A=
+                               present then enable.=0A=
+=0A=
+- ti,davinci-cs-ta:            minimum turn around time, ns=0A=
+                               Time between the end of one asynchronous me=
mory=0A=
+                               access and the start of another asynchronou=
s=0A=
+                               memory access. This delay is not incurred=
=0A=
+                               between a read followed by read or a write=
=0A=
+                               followed by a write to same chip select.=0A=
+=0A=
+- ti,davinci-cs-rsetup:                read setup width, ns=0A=
+                               Time between the beginning of a memory cycl=
e=0A=
+                               and the activation of read strobe.=0A=
+                               Minimum value is 1 (0 treated as 1).=0A=
+=0A=
+- ti,davinci-cs-rstobe:                read strobe width, ns=0A=
+                               Time between the activation and deactivatio=
n of=0A=
+                               the read strobe.=0A=
+                               Minimum value is 1 (0 treated as 1).=0A=
+=0A=
+- ti,davinci-cs-rhold:         read hold width, ns=0A=
+                               Time between the deactivation of the read=
=0A=
+                               strobe and the end of the cycle (which may =
be=0A=
+                               either an address change or the deactivatio=
n of=0A=
+                               the chip select signal.=0A=
+                               Minimum value is 1 (0 treated as 1).=0A=
+=0A=
+- ti,davinci-cs-wsetup:                write setup width, ns=0A=
+                               Time between the beginning of a memory cycl=
e=0A=
+                               and the activation of write strobe.=0A=
+                               Minimum value is 1 (0 treated as 1).=0A=
+=0A=
+- ti,davinci-cs-wstrobe:       write strobe width, ns=0A=
+                               Time between the activation and deactivatio=
n of=0A=
+                               the write strobe.=0A=
+                               Minimum value is 1 (0 treated as 1).=0A=
+=0A=
+- ti,davinci-cs-whold:         write hold width, ns=0A=
+                               Time between the deactivation of the write=
=0A=
+                               strobe and the end of the cycle (which may =
be=0A=
+                               either an address change or the deactivatio=
n of=0A=
+                               the chip select signal.=0A=
+                               Minimum value is 1 (0 treated as 1).=0A=
+=0A=
+If any of the above parameters are absent, current parameter value will be=
 taken=0A=
+from the corresponding HW reg.=0A=
+=0A=
+The name for cs node must be in format csN, where N is the cs number.=0A=
+For compatibles "ti,davinci-aemif" and "ti,keystone-aemif" N =3D [0-3].=0A=
+For compatible "ti,omap-L138-aemif" N =3D [2-5].=0A=
+=0A=
+Example for aemif, davinci nand and nor flash chip select shown below.=0A=
+=0A=
+memory-controller@21000A00 {=0A=
+       compatible =3D "ti,keystone-aemif";=0A=
+       #address-cells =3D <2>;=0A=
+       #size-cells =3D <1>;=0A=
+       clocks =3D <&clkaemif 0>;=0A=
+       clock-names =3D "aemif";=0A=
+       clock-ranges;=0A=
+       reg =3D <0x2100A00 0x00000100>;=0A=
+       ranges =3D <0 0 0x70000000 0x10000000=0A=
+                 1 0 0x21000A00 0x0000100>;=0A=
+=0A=
+       nand:cs2 {=0A=
+               compatible =3D "ti,davinci-cs";=0A=
+               #address-cells =3D <2>;=0A=
+               #size-cells =3D <1>;=0A=
+               clock-ranges;=0A=
+               ranges;=0A=
+=0A=
+               /* all timings in nanoseconds */=0A=
+               ti,davinci-cs-ta =3D <0>;=0A=
+               ti,davinci-cs-rhold =3D <7>;=0A=
+               ti,davinci-cs-rstrobe =3D <42>;=0A=
+               ti,davinci-cs-rsetup =3D <14>;=0A=
+               ti,davinci-cs-whold =3D <7>;=0A=
+               ti,davinci-cs-wstrobe =3D <42>;=0A=
+               ti,davinci-cs-wsetup =3D <14>;=0A=
+=0A=
+               nand@0,0x8000000 {=0A=
+                       compatible =3D "ti,davinci-nand";=0A=
+                       reg =3D <0 0x8000000 0x4000000=0A=
+                              1 0x0000000 0x0000100>;=0A=
+=0A=
+                       .. see davinci-nand.txt=0A=
+               };=0A=
+       };=0A=
+=0A=
+       nor:cs0 {=0A=
+               compatible =3D "ti,davinci-cs";=0A=
+               #address-cells =3D <2>;=0A=
+               #size-cells =3D <1>;=0A=
+               clock-ranges;=0A=
+               ranges;=0A=
+=0A=
+               /* all timings in nanoseconds */=0A=
+               ti,davinci-cs-ta =3D <0>;=0A=
+               ti,davinci-cs-rhold =3D <8>;=0A=
+               ti,davinci-cs-rstrobe =3D <40>;=0A=
+               ti,davinci-cs-rsetup =3D <14>;=0A=
+               ti,davinci-cs-whold =3D <7>;=0A=
+               ti,davinci-cs-wstrobe =3D <40>;=0A=
+               ti,davinci-cs-wsetup =3D <14>;=0A=
+               ti,davinci-cs-asize =3D <1>;=0A=
+=0A=
+               flash@0,0x0000000 {=0A=
+                       compatible =3D "cfi-flash";=0A=
+                       reg =3D <0 0x0000000 0x4000000>;=0A=
+=0A=
+                       ...=0A=
+               };=0A=
+       };=0A=
+};=0A=
--=0A=
1.7.9.5=0A=
=0A=
