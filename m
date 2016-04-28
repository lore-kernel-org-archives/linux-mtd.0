Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avhdd-0005Jk-7a
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2016 08:49:34 +0000
Subject: Re: secure file deletion/SECRM support for JFFS2 and UBIFS
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
References: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
 <CAFLxGvz9ybdeSqqjUwy6zUe7aO9h1TeRXVHnA_WRERmahrxe-Q@mail.gmail.com>
 <CAFLxGvyXnP7VkrYcsokcz-iU3G=u0QmFvZnr6txbjMvYHk6gYA@mail.gmail.com>
 <66249822349e4de191f8f67ca1a5c35c@svr-chch-ex1.atlnz.lc>
 <57213543.2070107@nod.at>
 <808151eb1f5a4d63ae100d9e6b29e550@svr-chch-ex1.atlnz.lc>
 <5721BB53.6010008@nod.at>
 <alpine.DEB.2.02.1604281037050.31333@lnxricardw1.se.axis.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Henry Shen <Henry.Shen@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Han Xu <han.xu@nxp.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5721CE82.7010907@nod.at>
Date: Thu, 28 Apr 2016 10:49:06 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1604281037050.31333@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.04.2016 um 10:40 schrieb Ricard Wanderlof:
> 
> On Thu, 28 Apr 2016, Richard Weinberger wrote:
> 
>> Am 28.04.2016 um 00:35 schrieb Chris Packham:
>>>> Well, UBIFS and JFFS2 work on generic MTD, so having a special hack for NOR
>>>> is not really what we want.
>>>
>>> Agreed. I was hoping there was a similar trick for NAND which I'm less 
>>> familiar with. The fallback behavior of an immediate erase is still 
>>> doable but it has more corner cases that we'd need to be weary of.
>>
>> Nope, on NAND you're forced to erase.
> 
> I know generally there is a recommendation not to overwrite bits already 
> set to 0 with 0 for NAND, but I can't remember if that is related to the 
> subsequent readability of surrounding data, or if may cause a future erase 
> not to perform properly, or actually physically damages the bit cell (or 
> there is some other reason).

I have been told that overwriting data on NAND can lead to physically damage,
but don't ask for a reference. ;-)
Maybe NAND fracturing folks can give more details on this topic.

Thanks,
//richard
