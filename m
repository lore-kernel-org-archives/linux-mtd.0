Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-00021K-E7
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:25:40 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Corey Minyard <minyard@acm.org>, openipmi-developer@lists.sourceforge.net
Subject: [PATCH 02/30] IPMI.txt: standardize document format
Date: Thu, 18 May 2017 22:23:54 -0300
Message-Id: <8842e78c24ee70c74578416814be59427e085476.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- fix document type;
- add missing markups for subitems;
- mark literal blocks;
- add whitespaces and blank lines where needed;
- use bulleted list markups where neded.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/IPMI.txt | 76 +++++++++++++++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/Documentation/IPMI.txt b/Documentation/IPMI.txt
index 6962cab997ef..aa77a25a0940 100644
--- a/Documentation/IPMI.txt
+++ b/Documentation/IPMI.txt
@@ -1,9 +1,8 @@
+=====================
+The Linux IPMI Driver
+=====================
 
-                          The Linux IPMI Driver
-			  ---------------------
-			      Corey Minyard
-			  <minyard@mvista.com>
-			    <minyard@acm.org>
+:Author: Corey Minyard <minyard@mvista.com> / <minyard@acm.org>
 
 The Intelligent Platform Management Interface, or IPMI, is a
 standard for controlling intelligent devices that monitor a system.
@@ -141,7 +140,7 @@ Addressing
 ----------
 
 The IPMI addressing works much like IP addresses, you have an overlay
-to handle the different address types.  The overlay is:
+to handle the different address types.  The overlay is::
 
   struct ipmi_addr
   {
@@ -153,7 +152,7 @@ to handle the different address types.  The overlay is:
 The addr_type determines what the address really is.  The driver
 currently understands two different types of addresses.
 
-"System Interface" addresses are defined as:
+"System Interface" addresses are defined as::
 
   struct ipmi_system_interface_addr
   {
@@ -166,7 +165,7 @@ straight to the BMC on the current card.  The channel must be
 IPMI_BMC_CHANNEL.
 
 Messages that are destined to go out on the IPMB bus use the
-IPMI_IPMB_ADDR_TYPE address type.  The format is
+IPMI_IPMB_ADDR_TYPE address type.  The format is::
 
   struct ipmi_ipmb_addr
   {
@@ -184,16 +183,16 @@ spec.
 Messages
 --------
 
-Messages are defined as:
+Messages are defined as::
 
-struct ipmi_msg
-{
+  struct ipmi_msg
+  {
 	unsigned char netfn;
 	unsigned char lun;
 	unsigned char cmd;
 	unsigned char *data;
 	int           data_len;
-};
+  };
 
 The driver takes care of adding/stripping the header information.  The
 data portion is just the data to be send (do NOT put addressing info
@@ -208,7 +207,7 @@ block of data, even when receiving messages.  Otherwise the driver
 will have no place to put the message.
 
 Messages coming up from the message handler in kernelland will come in
-as:
+as::
 
   struct ipmi_recv_msg
   {
@@ -246,6 +245,7 @@ and the user should not have to care what type of SMI is below them.
 
 
 Watching For Interfaces
+^^^^^^^^^^^^^^^^^^^^^^^
 
 When your code comes up, the IPMI driver may or may not have detected
 if IPMI devices exist.  So you might have to defer your setup until
@@ -256,6 +256,7 @@ and tell you when they come and go.
 
 
 Creating the User
+^^^^^^^^^^^^^^^^^
 
 To use the message handler, you must first create a user using
 ipmi_create_user.  The interface number specifies which SMI you want
@@ -272,6 +273,7 @@ closing the device automatically destroys the user.
 
 
 Messaging
+^^^^^^^^^
 
 To send a message from kernel-land, the ipmi_request_settime() call does
 pretty much all message handling.  Most of the parameter are
@@ -321,6 +323,7 @@ though, since it is tricky to manage your own buffers.
 
 
 Events and Incoming Commands
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The driver takes care of polling for IPMI events and receiving
 commands (commands are messages that are not responses, they are
@@ -367,7 +370,7 @@ in the system.  It discovers interfaces through a host of different
 methods, depending on the system.
 
 You can specify up to four interfaces on the module load line and
-control some module parameters:
+control some module parameters::
 
   modprobe ipmi_si.o type=<type1>,<type2>....
        ports=<port1>,<port2>... addrs=<addr1>,<addr2>...
@@ -437,7 +440,7 @@ default is one.  Setting to 0 is useful with the hotmod, but is
 obviously only useful for modules.
 
 When compiled into the kernel, the parameters can be specified on the
-kernel command line as:
+kernel command line as::
 
   ipmi_si.type=<type1>,<type2>...
        ipmi_si.ports=<port1>,<port2>... ipmi_si.addrs=<addr1>,<addr2>...
@@ -474,16 +477,22 @@ The driver supports a hot add and remove of interfaces.  This way,
 interfaces can be added or removed after the kernel is up and running.
 This is done using /sys/modules/ipmi_si/parameters/hotmod, which is a
 write-only parameter.  You write a string to this interface.  The string
-has the format:
+has the format::
+
    <op1>[:op2[:op3...]]
-The "op"s are:
+
+The "op"s are::
+
    add|remove,kcs|bt|smic,mem|i/o,<address>[,<opt1>[,<opt2>[,...]]]
-You can specify more than one interface on the line.  The "opt"s are:
+
+You can specify more than one interface on the line.  The "opt"s are::
+
    rsp=<regspacing>
    rsi=<regsize>
    rsh=<regshift>
    irq=<irq>
    ipmb=<ipmb slave addr>
+
 and these have the same meanings as discussed above.  Note that you
 can also use this on the kernel command line for a more compact format
 for specifying an interface.  Note that when removing an interface,
@@ -496,7 +505,7 @@ The SMBus Driver (SSIF)
 The SMBus driver allows up to 4 SMBus devices to be configured in the
 system.  By default, the driver will only register with something it
 finds in DMI or ACPI tables.  You can change this
-at module load time (for a module) with:
+at module load time (for a module) with::
 
   modprobe ipmi_ssif.o
 	addr=<i2caddr1>[,<i2caddr2>[,...]]
@@ -535,7 +544,7 @@ the smb_addr parameter unless you have DMI or ACPI data to tell the
 driver what to use.
 
 When compiled into the kernel, the addresses can be specified on the
-kernel command line as:
+kernel command line as::
 
   ipmb_ssif.addr=<i2caddr1>[,<i2caddr2>[...]]
 	ipmi_ssif.adapter=<adapter1>[,<adapter2>[...]]
@@ -565,9 +574,9 @@ Some users need more detailed information about a device, like where
 the address came from or the raw base device for the IPMI interface.
 You can use the IPMI smi_watcher to catch the IPMI interfaces as they
 come or go, and to grab the information, you can use the function
-ipmi_get_smi_info(), which returns the following structure:
+ipmi_get_smi_info(), which returns the following structure::
 
-struct ipmi_smi_info {
+  struct ipmi_smi_info {
 	enum ipmi_addr_src addr_src;
 	struct device *dev;
 	union {
@@ -575,7 +584,7 @@ struct ipmi_smi_info {
 			void *acpi_handle;
 		} acpi_info;
 	} addr_info;
-};
+  };
 
 Currently special info for only for SI_ACPI address sources is
 returned.  Others may be added as necessary.
@@ -590,7 +599,7 @@ Watchdog
 
 A watchdog timer is provided that implements the Linux-standard
 watchdog timer interface.  It has three module parameters that can be
-used to control it:
+used to control it::
 
   modprobe ipmi_watchdog timeout=<t> pretimeout=<t> action=<action type>
       preaction=<preaction type> preop=<preop type> start_now=x
@@ -635,7 +644,7 @@ watchdog device is closed.  The default value of nowayout is true
 if the CONFIG_WATCHDOG_NOWAYOUT option is enabled, or false if not.
 
 When compiled into the kernel, the kernel command line is available
-for configuring the watchdog:
+for configuring the watchdog::
 
   ipmi_watchdog.timeout=<t> ipmi_watchdog.pretimeout=<t>
 	ipmi_watchdog.action=<action type>
@@ -675,6 +684,7 @@ also get a bunch of OEM events holding the panic string.
 
 
 The field settings of the events are:
+
 * Generator ID: 0x21 (kernel)
 * EvM Rev: 0x03 (this event is formatting in IPMI 1.0 format)
 * Sensor Type: 0x20 (OS critical stop sensor)
@@ -683,18 +693,20 @@ The field settings of the events are:
 * Event Data 1: 0xa1 (Runtime stop in OEM bytes 2 and 3)
 * Event data 2: second byte of panic string
 * Event data 3: third byte of panic string
+
 See the IPMI spec for the details of the event layout.  This event is
 always sent to the local management controller.  It will handle routing
 the message to the right place
 
 Other OEM events have the following format:
-Record ID (bytes 0-1): Set by the SEL.
-Record type (byte 2): 0xf0 (OEM non-timestamped)
-byte 3: The slave address of the card saving the panic
-byte 4: A sequence number (starting at zero)
-The rest of the bytes (11 bytes) are the panic string.  If the panic string
-is longer than 11 bytes, multiple messages will be sent with increasing
-sequence numbers.
+
+* Record ID (bytes 0-1): Set by the SEL.
+* Record type (byte 2): 0xf0 (OEM non-timestamped)
+* byte 3: The slave address of the card saving the panic
+* byte 4: A sequence number (starting at zero)
+  The rest of the bytes (11 bytes) are the panic string.  If the panic string
+  is longer than 11 bytes, multiple messages will be sent with increasing
+  sequence numbers.
 
 Because you cannot send OEM events using the standard interface, this
 function will attempt to find an SEL and add the events there.  It
-- 
2.9.4
