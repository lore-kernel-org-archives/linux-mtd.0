Received: from dswu27.btconnect.com ([193.113.154.28])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A41tH-00044e-Ra
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2003 18:32:55 +0100
From: David Goodenough <david.goodenough@btconnect.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 29 Sep 2003 13:51:58 +0100
References: <1064826976.29857.116.camel@host35>
In-Reply-To: <1064826976.29857.116.camel@host35>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200309291351.58512.david.goodenough@btconnect.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 29 September 2003 10:16, Daniel Toussaint wrote:
> Hi,
>
> Does anyone know where I can find an x86 based sbc with nand chips on
> board(NOT implemented as ide flash disk) OR maybe an ISA/pci add-on card
> of some sort ? I need it to do a proof of concept , write some drivers
> and a bootloader (x86 legacy bios extension)  ....
>
> Thanks,

How about the Compulab boards.  They come with both NOR and NAND
flash on the x86CORE boards.  Unfortunately there is no MTD driver for=20
them, and while there is Linux support, it comes as part binary only.

=46rom what I can see there is not enough formal documentation to=20
write a driver, but there are odd bits of information which someone
knowledgable about with the MTD driver might be able to interpret
into a real driver.  You would be doing the Compulab users a favor
if you built such a driver.

There do also appear to be drivers for two of the AMD Elan SC520
reference boards, but at least one seems to have lots of comments
in it saying that handling it is a kludge.  The Compulab 586CORE
is Elan SC520 based.

Regards

David
