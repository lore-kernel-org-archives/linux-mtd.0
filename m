Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp93V-0008J0-8F
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 12:46:46 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: "David A. Marlin" <dmarlin@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 14 Jan 2005 06:52:38 +1300
References: <41E699F9.10704@redhat.com>
In-Reply-To: <41E699F9.10704@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050113174617.4786F4188@blood.actrix.co.nz>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: NAND fail testing
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I suggest you read the Toshiba NAND design guide before you try things like 
this. Google for "toshiba nand flash applications design guide"

NAND is always written in a per-page mode, even if you only change a single 
byte. Attempting what you propose will not only wear the single byte, but 
will wear the whole page and block.

IMHO the best way to do testing is to emulate a device in RAM. It is 
relatively simple to modify RAM contents and force the higher level to do its 
test stuff. Trying to do it with a real hardware failure will take a long 
time and is far harder to reproduce etc.


On Friday 14 January 2005 04:55, David A. Marlin wrote:
> Is there a simple way (using existing drivers and utilities) to "wear
> out" one byte on a NAND type chip by repeatedly rewriting a single byte
> (single address)?
>
> I want to cause a single byte failure on a chip in order to perform
> tests on erase and write error processing, but I only see how to write a
> 'page' of data, not a single address.
>
>
> Thank you,
>
> d.marlin
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
