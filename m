Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avXQs-0005cj-Rp
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 21:55:43 +0000
Subject: Re: secure file deletion/SECRM support for JFFS2 and UBIFS
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
References: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
 <CAFLxGvz9ybdeSqqjUwy6zUe7aO9h1TeRXVHnA_WRERmahrxe-Q@mail.gmail.com>
 <CAFLxGvyXnP7VkrYcsokcz-iU3G=u0QmFvZnr6txbjMvYHk6gYA@mail.gmail.com>
 <66249822349e4de191f8f67ca1a5c35c@svr-chch-ex1.atlnz.lc>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Henry Shen <Henry.Shen@alliedtelesis.co.nz>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57213543.2070107@nod.at>
Date: Wed, 27 Apr 2016 23:55:15 +0200
MIME-Version: 1.0
In-Reply-To: <66249822349e4de191f8f67ca1a5c35c@svr-chch-ex1.atlnz.lc>
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

Am 27.04.2016 um 23:49 schrieb Chris Packham:
> On 04/27/2016 07:06 PM, Richard Weinberger wrote:
>> On Wed, Apr 27, 2016 at 9:05 AM, Richard Weinberger
>> <richard.weinberger@gmail.com> wrote:
>>>> Is that something people on this list would be interested in? I realize
>>>> JFFS2 is kind of in a twilight phase but we're really not able to
>>>> migrate some customers away from it.
>>>
>>> This is definitely a nice feature.
>>> But please keep in mind that you can overwrite data on flash. :-)
>>
>> Should be read "can't", of course...
>>
> 
> You can't overwrite with arbitrary data. But for NOR flash at least you 
> _can_ overwrite with 0 (at least I think you can). In other words if the 
> erased state is 0xff you can write 0xaa you would not be able to write 
> 0x55 without erasing the block first but you would be able to write 0x00.
> 
> I was hoping to avoid having to do an immediate erase but if I'm wrong 
> that's what we'd have to do.

Well, UBIFS and JFFS2 work on generic MTD, so having a special hack for NOR
is not really what we want.

Thanks,
//richard
