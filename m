Received: from [203.194.209.83] (helo=machine36.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19B2u1-0005BK-D0
	for <linux-mtd@lists.infradead.org>; Thu, 01 May 2003 02:30:25 +0100
From: Mark Meade <mark@lakeshoremicro.com>
To: Stephen Lee <splee@plexio.com>,
 mtd <linux-mtd@lists.infradead.org>
Date: Wed, 30 Apr 2003 21:29:28 -0400
References: <1051745960.27756.15.camel@ralph.plexio.private>
	<1051749228.27798.28.camel@ralph.plexio.private>
In-Reply-To: <1051749228.27798.28.camel@ralph.plexio.private>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304302128.41316.mark@lakeshoremicro.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Which version of M-SYS DFORMAT?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 April 2003 08:33 pm, Stephen Lee wrote:
> Replying to my own message. The answer is that "dformat /win:d800
> /BDKF0:grub_firware" only works with v5.14. The next question is did I
> screwup the mtd patch? It doesn't appear to be as all kinds of
> MTD-related kernel config settings appeared after patching. I should
> also mention that Grub was installed correctly onto the DOC2000 as it
> booted up to the Grub prompt as expected. The only thing I can't do is
> mount /dev/nftla1 to install the kernel and menu.lst. Suggestions?

Stephen,

I apologize if the instructions aren't clear - if you use version 5.x of 
DFORMAT, you'll have to use your patched kernel twice.  In order to mount 
/dev/nftla1 and copy the bzImage to the DiskOnChip, you would need to boot 
from a hard drive using the patched kernel, or insmod the appropriately 
patched modules.

Once you are able to copy the kernel to /dev/nftla1, the patched kernel will 
also be necessary to boot directly from the DiskOnChip.

Mark
