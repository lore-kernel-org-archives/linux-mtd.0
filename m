Received: from chambertin.convergence.de ([212.84.236.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154eXk-0006M6-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 09:07:56 +0100
Message-ID: <3B13574C.D0026516@convergence.de>
Date: Tue, 29 May 2001 10:01:16 +0200
From: Frank Neuber <neuber@convergence.de>
MIME-Version: 1.0
To: Frederic Giasson <fgiasson@mediatrix.com>
CC: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Bug in MTD xconfig?
References: <F1BED55F35F4D3118C0F00E0295CFF4D99546A@mail.mediatrix.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Frederic Giasson wrote:

Hi Frederic,
I work with the cvs-code from May 21 13:13 and I don't have this
Problem.
Maybe you have entered the number in hex format into kernel
configuration, You don't.
If you wish to map from 0x8000000 with size 0x4000000 you should only
enter 8000000
and 4000000 without the 0x prefix.


> 
> Hi,
> 
>         I downloaded the lastest MTD code from infradead's CVS site and I am
> experiencing a problem with the kernel configuration.  In menu "Memory
> Technology Devices" / "Maping drivers for chips access", I set "CFI Flash
> device in physical memory map" to 'y', but I whenever I enter values for
> Physical start address and length,  my values always change to something
> like 0x8000000 and 0x4000000.  I had to hardcode the real values for the
> flash physical address and length of my board in autoconf.h.  Did you ever
> heard/dealed with this problem?
> 
> Thank you!

Frank

PS: My hardware is an ARM-Integrator board with intel-flash ...

-- 
Dipl.-Ing. Elektrotechnik     convergence integrated media gmbh / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 50
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
