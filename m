Received: from mail.rdsor.ro ([193.231.238.10])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClpFW-00020M-RQ
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2005 09:01:28 -0500
From: Balint Cristian <rezso@rdsor.ro>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 4 Jan 2005 16:01:17 +0200
References: <41D9949B.5070207@ieee.org> <41DA9D43.70807@ieee.org>
	<1104846254.13016.293.camel@hades.cambridge.redhat.com>
In-Reply-To: <1104846254.13016.293.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501041601.17638.rezso@rdsor.ro>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 04 January 2005 15:44, you wrote:

> You'd probably do better to add DiskOnChip support to RedBoot.

Yes. right.

 As the discution on this arised:

 I have personaly an DoC Millenium Plus 32M on an xscale [the very only one ], i very wanted to add to openwice-jtag [hope you know the tool] the 
flash/dump/read faclity directly via JTAG but is possible only if the driver is 16 bit clean [xscale use DoC in 16 bit mode at early boot time], 
and to write/rewrite an redboot/brendnew bootloader for arm platform need to have a very handy tool to debug preferable via JTAG.

 The jtag work flowless in 8 bit DoC HW mode [i acheive this by a patch using MTD old pieces of code not the nand one] but as the chiken-egg law says: 
xscale/arm want 16 bit .... [so cant write/debug a bootloader code on arm :) its horribly painfull without access to DoC by JTAG]

---> and so on etc etc ---> i can use only the new _nand_ driver, as pointed out evryone on this list .......
  
But,
The new nand driver is still unsuported for 32DOCMilplus32.
That fact can be grepped in the source code.


So,

 David, everyone pointed out that you are the "man" on this issue, can tell me please:

 a) what can i do to make nand to work with my chip, assuming that i can convert DOC MilPlus 16 one, few hint enough for a small magic over the code.
 b) have you some plan to do this, can help me ? [i am ready to test the code]
 c) i ask stupid thing ? [please notify]
 d) i speak/wrote terrible english. [please notify]

 
Thanks to evryone,

~cristian
