Received: from web54402.mail.yahoo.com ([206.190.49.132])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQNpg-0006KH-U7
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 09:43:49 -0400
Date: Wed, 29 Aug 2007 06:37:02 -0700 (PDT)
From: David Anders <dave123_aml@yahoo.com>
Subject: Re: Direct Access to flash chips
To: "Jörn" Engel <joern@logfs.org>, John Klonatos <megaklon@gmail.com>
In-Reply-To: <20070829103108.GD23020@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <154983.97140.qm@web54402.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn,

the alauda based card readers are getting pretty hard to find. although they work, they aren't a
long term solution for accessing raw NAND flash. by far the best solution i've run across is to
use the FTDI FT2232 chip to bit bang NAND flash access. there are both an opensource library and
proprietary library for the FT2232 usage under linux.(see projects like OpenOCD for example
usage).

chip information:
http://www.ftdichip.com/Products/FT2232C.htm

prototype modules:
http://www.dlpdesign.com/usb/2232m.shtml

there are some other products that would work as well including the EZ-Usb products, however they
do require custom firmware to properly access the NAND flash.

http://moin.elinux.org/wiki/EzUsb

there are several NAND flash vendors that have NAND flash evaluation kits that include a device
for accessing NAND flash, but these are generally beyond the cost of most developers.

Dave Anders



> On Wed, 29 August 2007 11:30:46 +0300, John Klonatos wrote:
> > 
> >          I am new to flash technology. From what i understand so far
> > in order to use the mtd layer, one must have direct access to the
> > flash chip.
> >          If this is correct in the first place, i would like to know
> > how one can achieve this kind of direct connection. I have searched
> > through the web and so far nothing. I know there are card flash
> > readers (SmartMedia and Xd-Picture) but what the host system see is
> > the usb interface.
> >        So, is there a (free) platform available to make possible this
> > type of direct connection. Or it is enough to use the usb
> > interface/protocol.
> 
> Olympus MAUSB-10 and Fijufilm DPC-R1 allow raw access.  You can use this
> driver:
> http://logfs.org/~joern/patches/alauda_mtd.patch.26
> 
> David, any reason not to merge it?
> 
> Jörn
> 
> -- 
> In America you can have either a flimsy box banged together out of two
> by fours and drywall, or a McMansion -- a flimsy box banged together
> out of two by fours and drywall, but larger, more dramatic-looking,
> and full of expensive fittings.
> -- Paul Graham
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 



       
____________________________________________________________________________________
Be a better Globetrotter. Get better travel answers from someone who knows. Yahoo! Answers - Check it out.
http://answers.yahoo.com/dir/?link=list&sid=396545469
