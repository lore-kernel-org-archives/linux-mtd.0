Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp9SF-0000Xy-To
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 13:12:21 -0500
Message-ID: <41E6B9DF.3000707@redhat.com>
Date: Thu, 13 Jan 2005 12:11:43 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: manningc2@actrix.gen.nz
References: <41E699F9.10704@redhat.com>
	<20050113174617.4786F4188@blood.actrix.co.nz>
In-Reply-To: <20050113174617.4786F4188@blood.actrix.co.nz>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: NAND fail testing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Charles:

Thank you for your reply.  Some additional information, the chips I am 
using are Renesas AG-AND (HN29V1G91T-30).  It was a note from Renesas 
that suggested this approach to permit erase/write fail testing.  I 
think this chip permits a "Random Data Input" operation that would 
permit writing a single byte, but I need to confirm this.  Since this 
does not appear to be a feature shared with other NAND/AND chips, it 
seems I may not be able to use our current driver/utilities to 
accomplish it (without modification).

Charles Manning wrote:
> I suggest you read the Toshiba NAND design guide before you try things like 
> this. Google for "toshiba nand flash applications design guide"
> 
> NAND is always written in a per-page mode, even if you only change a single 
> byte. Attempting what you propose will not only wear the single byte, but 
> will wear the whole page and block.
> 
> IMHO the best way to do testing is to emulate a device in RAM. It is 
> relatively simple to modify RAM contents and force the higher level to do its 
> test stuff. Trying to do it with a real hardware failure will take a long 
> time and is far harder to reproduce etc.

Agreed, but part of the testing is reading error status information back 
from the chips after the erase/write fail and determining if hardware 
ECC is possible.  I have not tried to emulate this device in RAM, but I 
don't think it is a viable option for me since producing and reading 
these error codes are part of the testing I need to perform.


Thanks again,

d.marlin
