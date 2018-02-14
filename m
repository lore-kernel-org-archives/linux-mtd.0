Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elsJc-0003sp-2e
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 08:21:22 +0000
Date: Wed, 14 Feb 2018 09:20:47 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Steve deRosier <derosier@gmail.com>
Cc: Ran Shalit <ranshalit@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: Writing log in flash
Message-ID: <20180214092047.3d738c23@bbrezillon>
In-Reply-To: <CALLGbRLui7iAmntkTDaptEUJ685LRfbaznq2a0ioPDSz5+B8-w@mail.gmail.com>
References: <CAJ2oMhK_oH9RfekXiuTw25rghdXWjH4Ju_WCiC6ey5hccvHx1g@mail.gmail.com>
 <CALLGbRLui7iAmntkTDaptEUJ685LRfbaznq2a0ioPDSz5+B8-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steve,

On Tue, 13 Feb 2018 23:53:44 -0800
Steve deRosier <derosier@gmail.com> wrote:

> On Tue, Feb 13, 2018 at 11:06 PM, Ran Shalit <ranshalit@gmail.com> wrote:
> > Hello,
> >
> > I have a general question about NAND technology:
> >
> > Is it possible to write in nand continuously ?
> >
> > I understand that NAND technology requires block erase, and then the
> > writing is done per page.
> > Yet, jffs for example achieve doing fwrite() which can get any size,
> > so how does jffs achieve that ?
> > Is it that it write pages continously ? We actually use on-die ecc, so
> > I am not sure if that is possible. I mean, if we write first 10 words
> > in page, so on writing the rest of the pagem, the ecc will need to be
> > re-written, so that's probably a problem.
> >
> > Does it mean we have to wait for a complete page bytes, before writing
> > into flash ?
> >
> > Thank you,
> > Ran
> >  
> 
> Hi Ran,
> 
> The short version is: you usually must write in pages.  Or if your
> chip supports it, sub-pages.
> 
> And, you need to consult the datasheet of the NAND you are using.
> 
> I can only give you the experience of the devices I'm familiar with.
> Mostly older Micron SLC NANDs, with no sub-page write support.
> 
> * Erase is done per block. Keep in mind that blocks can be fairly
> large, like 128 kbytes (+oob area space).
> * Writing must be done in pages. In my devices, a page is 2 kbytes
> (+oob area space, usually 64 bytes).
> * Because writing is done in pages, the driver or filesystem is going
> to be buffering data to at least that page worth.  It will flush a
> partial page when appropriate, but that's the end of the use of that
> page.
> * While it _might_ be possible to write multiple times to a page,
> doing so tends to disrupt other data on the page, so the datasheet
> usually says not to do that.  And if you're running with ECC, that can
> create a problem.
> * On-chip ECC vs not doesn't matter for your application.  All that
> changes is where the ECC data is calculated. It's still calculated on
> a per-page (or sub-page) basis.
> * This is my understanding of sub-page writes, never having used a
> NAND with that, I'm making educated guesses. Even with a sub-page
> write, the driver must write in sub-page units. On my devices that
> would be 512 bytes of data. Reason being is the ECC is calculated over
> that chunk as a whole. So, sub-page writes might help you, but not
> with your example of only writing 10 words at a time.
> * And finally - you're right, if you were to write only a few bytes
> and then wrote a few more, ECC would need to be rewritten, which can't
> successfully be done without first erasing the entire block.
> 
> Hopefully I'm right in the above and I can save Richard or Boris a few
> moments of time; otherwise I'm sure someone will chime in and correct
> me. Again, I'll be clear: the above is based on the devices I use and
> might not apply to all. And if you haven't already, read the datasheet
> of the NAND you are using.
> 
> I can't speak to jffs with regard to what you bring up. I generally
> use UBIFS on UBI.
> 
> I think you should look at your application and what you're trying to
> do. I assume by log, you're talking about logging either external data
> or system operation and what you're concerned about are power-cuts,
> because who cares if you buffer up 2k if it never looses the buffer in
> RAM. Without knowing your application, this is my suggestion, assuming
> being forced to run a NAND flash. I'd place the log in UBIFS. If
> you're logging data, and it's slow data, you're reading it and the
> driver will be buffering and writing it out as necessary. UBI will
> take care of wear-leveling and making sure it flushes buffers either
> on a timer or as it gets full pages.  UBI/UBIFS is power-cut resistant
> and while if you get a power cut you might loose some data, at least
> the rest is safe and sound on your NAND.  If you get a power cut,
> you're going to lose data while the device is offline anyway, so I
> don't really see a difference.  As for logging system operation, like
> saving syslog or kernel messages to the log, well, it should be OK in
> most cases. And in the few it wouldn't be, I'd expect the data you
> wanted to write to be corrupt anyway, so little loss is really there.
> 
> And if you truly must have a "data must be written at all costs"
> you're going to want to investigate other or additional hardware. For
> example, have a brown-out detect with a backup battery or super-cap
> and detect the problem and be sure to flush RAM and shutdown cleanly
> before you lose power.  In any case, this and the previous paragraph
> are just my opinions.

Nothing to add. You explained it better than I would have.

Thanks a lot for taking the time to write such a detailed answer,
that's really appreciated.

Boris
-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
