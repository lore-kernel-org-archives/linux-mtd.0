Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avhVc-0001ST-6E
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 08:41:17 +0000
Date: Thu, 28 Apr 2016 10:40:43 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Richard Weinberger <richard@nod.at>
CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Henry Shen
 <Henry.Shen@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: secure file deletion/SECRM support for JFFS2 and UBIFS
In-Reply-To: <5721BB53.6010008@nod.at>
Message-ID: <alpine.DEB.2.02.1604281037050.31333@lnxricardw1.se.axis.com>
References: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
 <CAFLxGvz9ybdeSqqjUwy6zUe7aO9h1TeRXVHnA_WRERmahrxe-Q@mail.gmail.com>
 <CAFLxGvyXnP7VkrYcsokcz-iU3G=u0QmFvZnr6txbjMvYHk6gYA@mail.gmail.com>
 <66249822349e4de191f8f67ca1a5c35c@svr-chch-ex1.atlnz.lc>
 <57213543.2070107@nod.at>
 <808151eb1f5a4d63ae100d9e6b29e550@svr-chch-ex1.atlnz.lc>
 <5721BB53.6010008@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 28 Apr 2016, Richard Weinberger wrote:

> Am 28.04.2016 um 00:35 schrieb Chris Packham:
> >> Well, UBIFS and JFFS2 work on generic MTD, so having a special hack for NOR
> >> is not really what we want.
> > 
> > Agreed. I was hoping there was a similar trick for NAND which I'm less 
> > familiar with. The fallback behavior of an immediate erase is still 
> > doable but it has more corner cases that we'd need to be weary of.
> 
> Nope, on NAND you're forced to erase.

I know generally there is a recommendation not to overwrite bits already 
set to 0 with 0 for NAND, but I can't remember if that is related to the 
subsequent readability of surrounding data, or if may cause a future erase 
not to perform properly, or actually physically damages the bit cell (or 
there is some other reason).

If it's just related to the readability of surrounding bit cells, one 
could imaging overwriting a page with zeros since we were not going to 
read it anyway.

With MLC it's going to be a problem though due to bits being paired 
between separate pages.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
