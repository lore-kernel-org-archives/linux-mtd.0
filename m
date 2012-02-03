Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtDwz-0003fG-7q
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 07:52:55 +0000
Received: by wera10 with SMTP id a10so3246663wer.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 23:52:48 -0800 (PST)
Date: Fri, 3 Feb 2012 09:52:31 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [RFC/PATCH] mtd: m25p80: set writebufsize
Message-ID: <20120203095231.44512164@pixies.home.jungo.com>
In-Reply-To: <1328249696.6750.41.camel@sauron.fi.intel.com>
References: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
 <CAGiDA6Jw52CGM6KT5EANaGb8xxQQEH0Lf5ms24NGZLeMtqgjGA@mail.gmail.com>
 <CAN8TOE-Yt445aXE_sA9xo8ycV4EQB=5OtwL6yyfPBGusYd93CA@mail.gmail.com>
 <20120201111153.3c1fe085@pixies.home.jungo.com>
 <1328249696.6750.41.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "Shawn J. Goff" <shawn7400@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 agust@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 03 Feb 2012 08:14:56 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-02-01 at 11:11 +0200, Shmulik Ladkani wrote:
> > According to mtd.h, 'writebufsize' should be set to the "Size of the
> > write buffer used by the MTD".
> > 
> > m25p->page_size should be set to the size of the device's data buffer
> > (used by the Page Program operation).
> > 
> > Hence for m25p80, 'flash->mtd.writebufsize = flash->page_size' seems
> > right.
> > 
> > BTW 'writebufsize' is propagated to UBI's 'max_write_size' which
> > currently affects UBIFS write-buffer size.
> > 
> > It should be set to "the maximum amount of bytes the underlying flash is
> > able to program at a time" (according to ubifs/io.c).
> > 
> > Hence again, for m25p80, 'flash->page_size' seems adequate.
> 
> This parameter was introduced for NOR flashes, and in NAND flashes
> context it looks weird. Probably we could document this better. But
> basically, it describes how much data the driver is able to write at a
> time. All NAND drivers write only one page at a time, so this parameter
> should be set to NAND page size.

Sorry, prev message was vague.

Note m25p is Serial NOR Flash (its 'writesize' is set to 1, as it can be
programmed byte at a time).

m25p->page_size denotes the *maximum* number of bytes which can be
programmed using the "Page Program" instruction of the serial interface.

This number equals the size of the device's internal write buffer.
Which also means "the maximum amount of bytes the underlying flash is
able to program at a time".

(To be honest, this is correct for two m25p devices I've worked with,
according to their data sheets. I beleive it should be correct for other
m25p devices as well)

For these reasons, setting m25p's mtd.writebufsize to m25p->page_size is
adequate.

Regards
Shmulik
