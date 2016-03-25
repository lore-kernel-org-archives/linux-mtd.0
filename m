Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajYgn-00062f-0o
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 20:50:37 +0000
Received: by mail-qk0-x22c.google.com with SMTP id i4so950000qkc.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2016 13:50:16 -0700 (PDT)
Date: Fri, 25 Mar 2016 17:50:11 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Benson Young <benson6877@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>, Willy Tarreau <w@1wt.eu>
Subject: Re: ubiblock RW
Message-ID: <20160325205011.GA1106@laptop.cereza>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
 <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
 <1458906697.615.20.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458906697.615.20.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 Mar 01:51 PM, Artem Bityutskiy wrote:
> On Thu, 2016-03-24 at 18:26 -0300, Ezequiel Garcia wrote:
> > > > Richard, what do you think?
> > > I'm definitely not fond of adding write support to ubiblock without
> > > turning it into a proper FTL.
> > > Otherwise it will be abused and will cause serious damage.
> > > 
> > I'm not sure this statement makes much sense without actual numbers.
> 
> Ezequel,
> 
> could you re-summarize how the write support would be implemented? Read
> entire LEB, modify data block (512 bytes), atomically write the LEB?
> This would not perform well, but would probably work.
> 

Yes, I was thinking in using atomic LEB change. The old write-support
was implemented with a 1-LEB cache vmalloced at open, and freed at release.

The flash device is written when the write cache is flushed on:
  * block device release (detach)
  * a different than cached leb is accessed (either through read or write)
  * io-barrier is received through a REQ_FLUSH request

It was expected that the block I/O scheduler would help mitigate
the effects of a regular block oriented filesystem on flash sector
erasecount.

However, most likely UBIFS will do a far better job at preserving
flash wear than any block oriented filesystem.

> Or you want to avoid atomic LEB change and just erase the LEB and write
> the entire LEB with the updated contents? This would probably be a bit
> faster, but not power-cut safe.
> 

Not sure dropping power-cut safeness a realistic option. I'd say
most -if not all- users will want to be power-cut safe at all costs.

Let me quote a mail here from Willy [1]:

""
[..] I've been using ext2 on x86-based hardware and compact flash for
something like 10 years with a great success (easy to mount, easy to
fix, easy to save, easy to occasionally add a backup copy or an extra
data file, etc).

I contemplated ubifs on NAND devices as an alternative
when starting to play with ARM-based devices, and lost the reliability
and ability to fix. Switching back to the proven ext2 completely solved
the issues in the end.

Ubifs is nice when you need a real read/write FS,
but most small devices do not need wear leveling or any of such nice
features. When you just write 1-10 times a year, other solutions are
fine enough. Using mtdblock directly is not reliable because of bad
blocks which come from time to time. If your FS happens to be located
on one of them, you're screwed. UBI solves such issues and ubiblock
provides a nice interface for this.
""

I guess we could have some UBI parameter to enable this support,
and print a very noisy message to warn users about potential
device wear out -- naively assuming users read messages...
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
