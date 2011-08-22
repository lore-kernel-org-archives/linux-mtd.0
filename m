Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qve8C-0007JZ-IG
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 23:42:13 +0000
Received: by wyh11 with SMTP id 11so4728212wyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 16:42:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314007366.2644.101.camel@sauron>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron>
Date: Mon, 22 Aug 2011 16:42:10 -0700
Message-ID: <CAN8TOE8c7ZoaHs+q76TWALNFZgtrjvNYAsqXphwd7HFUjY5KBw@mail.gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 3:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>> Does MTD_MODE_RAW imply MTD_OOB_RAW when OOB operations are involved?
>
> I would make sure these 2 set of macros have different prefixes.
> Probably re-naming the internal ones is easier, but I'd anyway re-named
> the external ones - indeed they are about access mode for a specific
> file descriptor, so I'd use the "MTD_FILE_MODE_" prefix.

To be sure, are you categorizing the internal/external modes as follows?

External = MTD_MODE_NORMAL, MTD_MODE_RAW, etc.
Internal = MTD_OOB_PLACE, MTD_OOB_AUTO, MTD_OOB_RAW

Because my proposal here is to move those Internal ones to becoming a
new set of External modes for the purpose of the new MEMWRITEDATAOOB.
Finding good names for them makes more sense now than after they
become External. But as you say, renaming the *current* External modes
could help clarify things as well.

>> Does MTD_MODE_RAW imply that no ECC is applied to data?
>
> Not sure, but judging from how it is used - no.

I see at least one instance of code that seems to assume the answer is
"yes"; see the "noecc" code in nandwrite.c. Where do you find evidence
that says "no"?

>> Is the MTD file mode persistent?
>
> It is stored in the file descriptor (file->private_data), so the
> life-time of the mode is equivalent to the life-time for the file
> descriptor, AFAICS.

OK.

> I think MEMWRITEDATAOOB should ignore the mode.

Sure. May be easier said than done though. It looks like there are too
many entry points into the MTD layer, with different ioctls plus the
standard read/write controls. I'll see what I can do about keeping
this under control.

> My quick look at the code suggests me that the RAW/NORMAL file modes is
> about read/write operations - in normal mode we read/write from/to only
> the main area, in raw mode we consider the main area and OOB as one
> continuous region and read/write from/to this region.

I'm not sure I understand where the part about continuous region comes
from, but I think I understand some more here... MTDFILEMODE only
affects calls to mtd_write and mtd_read. It does not currently do
anything for the MEM{READ,WRITE}OOB[64] ioctls. This has been a point
of confusion for me and for others, I think.

It looks like going forward, we should agree on something like the
following, although the names still may change:

1) the generic term "raw" mode means that we are writing or reading
data exactly as-is to/from the flash, without error correction applied
to it.
2) MTD_OOB_RAW means means that we read or write in raw mode. This can
be directly user-controlled from the new MEMWRITEDATAOOB ioctl.
3) MTD_MODE_RAW is used only with the MTDFILEMODE ioctl, and it *only*
affects error correction for read() and write() calls to the
corresponding file descriptor. Its sole purpose is to enable
MTD_OOB_RAW during standard read/write operations (no OOB
interaction).

Unfortunately, item 3 showcases our naming inconsistency, since
MTD_OOB_RAW is actually utilized for a non-OOB operation. Perhaps this
should be considered for renaming?

[Regarding MTD_MODE_RAW:]
>> Maybe the "something" to be done would just be some better
>> documentation. Or something more drastic if there's an actual conflict.
>
> To me it looks like (a) re-naming and (be) some more comments in the
> header files is enough.

OK, I may rename, and I'll try to add more comments when we've got the code set.

Speaking of renaming, I'm not so sure about the name I gave this
ioctl; which of the following makes the most sense for naming the new
ioctl? Speak soon or forever hold your peace.
1) MEMWRITEDATAOOB
2) MEMWRITE
3) MEMWRITEOPS
4) ...something else?

Brian
