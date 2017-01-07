Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPiIi-0003Wf-SA
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2017 04:08:18 +0000
Received: by mail-qk0-x235.google.com with SMTP id n21so483939293qka.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2017 20:07:56 -0800 (PST)
MIME-Version: 1.0
From: Madhu Macaque Labs <madhu@macaque.in>
Date: Sat, 7 Jan 2017 09:37:55 +0530
Message-ID: <CAPb2fE86wZMOkaWAU3S97_JRveB2KBb_=wdq4D0zawjntgyQoA@mail.gmail.com>
Subject: Open Source ONFI 4.0 and NVMe 2.x
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our open source ONFI and NVMe controller are getting to be stable
and so we have started on the SW development for them. The ONFI
4.0 controller will be used for NAND boot in our open source RISC-V
SoCs but we are hoping it will get adopted by other open and proprietary
SoCs as reference ONFI controller.

Need some advice on the appropriate SW systems to for testing our RTL.
For the ONFI controller, presumably appropriate Micron NAND drivers
would do. We are creating two open platform along with our IP.
One is a FMC NAND module that can be used with any FPGA board with
an FMC connector. The flash is a Micro 3D NAND. Ideal candidate is the
Xilinx or Altera ARM FPGA board since you get an ARM CPU
with an AXI bus. Our ONFI controller support both an AXI interface or a
generic parallel interface. The other is an FPGA based NVMe card with
6+ ONFI channels. It is basically an enterprise grade NVMe card with an
open interface for the NAND modules so that any 3rd party NAND module
can be plugged in and you can mix and match SLC or TLC or MLC.
Features like battery backup and NVRAM cache will be added in later versions.
It also supports native fabric interface (2 or 4 lanes of 10G SFP+ ) so that it
can run NVMe over fabric natively. We may end up opening up the schematics
and gerber files if one of our he dev  partners waive their rights. In
any case the
RTL code (in bluespec and verilog) is open source.

I am curious if the NAND team will find access to the internals of an ONFI
controller to be of any advantage.  It is just a standard ONFI 4.0 controller
but as part of our research we are enhancing ONFI to  allow higher level
software  to have more access to the flash devices. If some
one needs an extra features in the controller let me know, if it makes sense we
will add it. Enhancing ONFI is one of our key goals since with an open SSD
approach what we will end up with is ONFI over a fabric since in a distributed
block store, an enhanced ONFI may  more sense than NVMe . If nothing else
I am hoping  our HW platform becomes some kind of a ref. platform for testing
NAND sub-systems.

For the NVMe controller, we will be supporting both device side FTL and host
side FTL based on the openchannelSSD work from ITU Copenhagen. For the
device side FTL, I am planning to take the UBI sub-system and enhance it.
Since our NVMe controller also support 32 cores and multiple fabric interfaces
(PCIe and SRIO for now, GenZ as soon as the specs are ready), we also plan
to have full fledged distributed block storage layer running on these
cores (of course
then its is something more than an NVMe controller). The idea  is that
a collection
of these cards (along with an optional appliance controller) will present a
distributed block storage system. Of course higher level sub-systems
like database
storage engines  KV stores can also run on these cores but our initial focus
 is an enhanced version of UBI.

Any feedback on our  approach is greatly appreciated. As with the ONFI
controller,
we will consider any useful feature requests.

The code is in

 bitbucket dot org slash casl
l
and is under the 3 part BSD lic for the HW and
GPL for the SW.

A note: While it will take a fair amount of beta testing to get the
bugs sorted out,
the project will maintain and support these IPs to make them
competitive with any
commercial IP in terms of stability and hopefully documentation.


Regards,
Madhu
