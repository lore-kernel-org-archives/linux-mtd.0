Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRdWz-0002hf-7t
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 07:41:06 +0000
Date: Thu, 3 Oct 2013 09:40:43 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Avery Pennarun <apenwarr@gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
In-Reply-To: <CAHqTa-3HxoQJ=wEZ_w8Vcp9VXS12=xNbiJ2v8fSsJbMb9BT_4w@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1310030932150.18310@lnxricardw.se.axis.com>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
 <l2grtn$svg$1@ger.gmane.org>
 <CAHqTa-3HxoQJ=wEZ_w8Vcp9VXS12=xNbiJ2v8fSsJbMb9BT_4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Romain Izard <romain.izard.pro@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 Oct 2013, Avery Pennarun wrote:

> On Wed, Oct 2, 2013 at 3:18 AM, Romain Izard <romain.izard.pro@gmail.com> wrote:
>> On 2013-10-01, Avery Pennarun <apenwarr@gmail.com> wrote:
>>> Steps:
>>> - Disable ECC to avoid any confusion (ECC turns out to not affect the
>>> test results, but I wanted to make sure)
>>> - Erase any eraseblock
>>> - Write all-zeroes to page 0x18 of that eraseblock; read it back -> ok
>>> - Write all-zeroes to page 0x12 of that eraseblock; read it back ->
>>> FAIL, all 0xff instead
>>> - Read page 0x18 -> completely random data (about 12% of bits are flipped)
>>
>> For me you're violating one key MLC assumption: the pages within a block
>> must be written in a strictly increasing order. It should be written
>> somewhere in the component's datasheet.
>
> Hmm.  I haven't heard of this constraint, but it certainly seems to be
> happening in this case (although in fact random-access writes *mostly*
> work other than this pairing effect, so it seems like they intended it
> to work properly).

Just because they place the constraint on the user that the pages must be 
written in order doesn't mean that the device necessarily will malfunction 
if the user violates this. It just means that the designers have the 
freedom to introduce dependencies between the page writes if it makes the 
design easier/better/possible/whatever. It could very well be that for a 
given flash it is possible to do some writes out of order, but to avoid a) 
tying down the actual possibilities for a given flash and b) complicating 
the facts for the user they just specify that 'page writes must be 
executed in order'.

I must admit I wasn't aware of this fact either, but I have no hands-on 
experience with MLC flashes on the other hand.

> This makes /dev/mtdblock completely unusable as it reorders writes.
> Is /dev/mtdblock known to not work with MLC chips?

I don't think /dev/mtdblock reorders writes; isn't it just exposing the 
underlying /dev/mtd device as a block device essentially in order to make 
the mount command happy?

I would think the two most common uses of flash are either using a flash 
file system such as jffs2 or ubifs, and since each data node has its own 
header and identifier, there is no reason to do anything else but write 
the nodes in order within blocks, and the other use would be to store 
binary blobs, in which again the data would just be stored sequentially 
from start to end.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
