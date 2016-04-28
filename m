Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avgMP-0004Fd-23
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 07:27:42 +0000
Subject: Re: secure file deletion/SECRM support for JFFS2 and UBIFS
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
References: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
 <CAFLxGvz9ybdeSqqjUwy6zUe7aO9h1TeRXVHnA_WRERmahrxe-Q@mail.gmail.com>
 <CAFLxGvyXnP7VkrYcsokcz-iU3G=u0QmFvZnr6txbjMvYHk6gYA@mail.gmail.com>
 <66249822349e4de191f8f67ca1a5c35c@svr-chch-ex1.atlnz.lc>
 <57213543.2070107@nod.at>
 <808151eb1f5a4d63ae100d9e6b29e550@svr-chch-ex1.atlnz.lc>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Henry Shen <Henry.Shen@alliedtelesis.co.nz>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5721BB53.6010008@nod.at>
Date: Thu, 28 Apr 2016 09:27:15 +0200
MIME-Version: 1.0
In-Reply-To: <808151eb1f5a4d63ae100d9e6b29e550@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.04.2016 um 00:35 schrieb Chris Packham:
>> Well, UBIFS and JFFS2 work on generic MTD, so having a special hack for NOR
>> is not really what we want.
> 
> Agreed. I was hoping there was a similar trick for NAND which I'm less 
> familiar with. The fallback behavior of an immediate erase is still 
> doable but it has more corner cases that we'd need to be weary of.

Nope, on NAND you're forced to erase.
Also erase itself is a problem (at least on UBIFS), it does not erase blocks
synchronous and also not immediately after they are no longer needed.
So, you'd have to touch some code...
Blindly doing a synchronous erase will hurt the performance as you
block the callers.

Thanks,
//richard
