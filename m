Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRdb5-0002oj-Tg
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 07:45:20 +0000
Received: by mail-vc0-f169.google.com with SMTP id ib11so811537vcb.0
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2013 00:44:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1310030932150.18310@lnxricardw.se.axis.com>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
 <l2grtn$svg$1@ger.gmane.org>
 <CAHqTa-3HxoQJ=wEZ_w8Vcp9VXS12=xNbiJ2v8fSsJbMb9BT_4w@mail.gmail.com>
 <alpine.DEB.2.00.1310030932150.18310@lnxricardw.se.axis.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Thu, 3 Oct 2013 00:44:37 -0700
Message-ID: <CAHqTa-1NhB4+zNkpSe3Ojw6ZywVBrxuPY1ZcWrN47nXeoBxWBg@mail.gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Thu, Oct 3, 2013 at 12:40 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> Just because they place the constraint on the user that the pages must be
> written in order doesn't mean that the device necessarily will malfunction
> if the user violates this. It just means that the designers have the freedom
> to introduce dependencies between the page writes if it makes the design
> easier/better/possible/whatever. It could very well be that for a given
> flash it is possible to do some writes out of order, but to avoid a) tying
> down the actual possibilities for a given flash and b) complicating the
> facts for the user they just specify that 'page writes must be executed in
> order'.
>
> I must admit I wasn't aware of this fact either, but I have no hands-on
> experience with MLC flashes on the other hand.

It seems rather under-documented to me, and I wouldn't be overly
surprised if it's not so much "standard behaviour" as "behaviour some
chip makers decided they could get away with based on usage patterns."
 But ok.

>> This makes /dev/mtdblock completely unusable as it reorders writes.
>> Is /dev/mtdblock known to not work with MLC chips?
>
> I don't think /dev/mtdblock reorders writes; isn't it just exposing the
> underlying /dev/mtd device as a block device essentially in order to make
> the mount command happy?
>
> I would think the two most common uses of flash are either using a flash
> file system such as jffs2 or ubifs, and since each data node has its own
> header and identifier, there is no reason to do anything else but write the
> nodes in order within blocks, and the other use would be to store binary
> blobs, in which again the data would just be stored sequentially from start
> to end.

/dev/mtdblock seems to do very complicated things.  For example, when
using it, you don't need to use flash_erase before writing to blocks.
Also, my device has 1024k eraseblocks, but if I do:

   dd if=/tmp/whatever of=/dev/mtdblock9 bs=1024k

it ends up *reading* from the flash, not just writing to it.  Given
how many ECC errors it also produces on my setup, I think it's also
reordering writes.  This isn't particularly surprising to me since as
soon as you go through the Linux block layer, you're at the mercy of
the disk I/O schedulers etc.  Perhaps it *mostly* won't reorder writes
in simple cases, but I don't think there's any guarantee of this.
