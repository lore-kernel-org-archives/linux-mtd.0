Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyw4x-0002k9-PT
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 08:27:57 +0000
Message-ID: <1506932833.14367.529.camel@gmail.com>
Subject: Re: Shrink UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard.weinberger@gmail.com>, Ryan Meulenkamp
 <Ryan.Meulenkamp@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 02 Oct 2017 11:27:13 +0300
In-Reply-To: <CAFLxGvwoUoH6WDQsexM+H_gdfy3Wd75Oy2BdL8xbdC9TViPazA@mail.gmail.com>
References: <1506598982834.31024@nedap.com>
 <CAFLxGvwoUoH6WDQsexM+H_gdfy3Wd75Oy2BdL8xbdC9TViPazA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2017-09-30 at 20:09 +0200, Richard Weinberger wrote:
> Ryan,
> 
> On Thu, Sep 28, 2017 at 1:43 PM, Ryan Meulenkamp
> <Ryan.Meulenkamp@nedap.com> wrote:
> > Hi,
> > 
> > 
> > I'm planning to write an ioctl for shrinking a UBIFS to be able to
> > resize the volume its on and create another
> > 
> > volume because it is essential for our upgrade/migration flow. Do
> > you guys have any advice for me? The
> > 
> > hard part is that LEB's that would fall outside the new size should
> > be moved inside the new size. From what
> > 
> > I read, the garbage collection code could be used to  accomplish
> > this, but it is not really possible to define
> > 
> > which LEB's to put where.
> > 
> > 
> > Thanks in advance!
> 
> So, you want to implement _online_ shrinking?
> This is a way more complicated, think of power-cuts.
> I strongly suggest thinking about offline shrinking first.
> 
> You are right, the garbage collector might be useful, you could
> modify
> it in a way
> to move blocks away from to-be-removed LEBs.
> But again, do you *really* need online shrinking?

Yeah, offline would be way easier


But still just thinking aloud about online shrinking...

Suppose we have UBIFS which looks like this.

FDDDEFDFDFFFFFDDDFDFFEEEDFDDDFDFDFDFDFDDDDDDFFFFFFDDDDDDDDDDDFFDFF

F - full eraseblock
D - eraseblock with dirty space.
E - empty eraseblock.

To shrink, we need to turn it into something like this.

FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDEEEEEEEEEEEEEEEEEEEE

Currently GC selects the dirtiest eraseblock as the victim for
cleaning, because this is the most efficient strategy. But you could
introduce a special 'shrinking  mode', where you'd tell GC to try hard
picking the victims from the end, Probably also try hard not to re-use
the empty eraseblocks at the end.

Then while being in this mode, GC is used from a background thread to
make enough empty eraseblocks at the end. Well, it is possible that GC
will stop making progress before enough eraseblocks at the end are made
empty, which would mean that further shrinking is impossible.

Just thoughts.
