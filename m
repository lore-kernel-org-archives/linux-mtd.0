Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14umuq-0006IU-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 04:03:01 +0100
Received: from 209-184-180-125.faxtell.net ([209.184.180.125] helo=eventlog.faxtell.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14umvF-0008CQ-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 04:03:25 +0100
Message-ID: <002f01c0d2b4$bb6e7b20$6401a8c0@faxtell.net>
Reply-To: "schang" <schang@3inet.com>
From: schang@3inet.com (Shuh C Chang)
To: "Ollie Lho" <ollie@sis.com.tw>
Cc: <linux-mtd@lists.infradead.org>
References: <21813.988381415@redhat.com> <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII> <3AEF5AC6.47ABF513@sis.com.tw>
Subject: Re: Is DOC Address 0xC8000 Something Special?
Date: Tue, 1 May 2001 22:05:22 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hey, Ollie:

I knew that there got to be some genius out there who can give this 0xC8000
address some special meaning.  Now you mention it, it just brings back the
good old memory when the first CGA color monitor came out in the early 80s.
That's where the video RAM starts for the color video adaptor.  No wonder it
looks so awefully familiar to me, but I just never bother to look back.
Just like the old Chinese saying, "You can no longer smell the fragrance
once you are in a room full of orchid long enough."

Nonetheless, I thought this was an ancient problem of a dinosaur in the old
DOS dynasty.  Is this still a problem as real as in the old days?

So far, I have tried with Griffith/Woodhouse's suggestions such as:
    - cycles*4 in doc2001.c & doc2000.c
    - fixed probe & auto probe
    - Commenting out DOC_SINGLE_DRIVER in docprobe.c
    - Changing MTD_READECC to MTD_READ in nftlmount.c
    - etc.

but to no avail.

So far I have *yet* to find the answer/solution.  Like I mentioned in my
original posting, addresses at 0xD0000 and 0xD8000 work well.  I am still
trying different options.  I would welcome any suggestions from the pundits
out there.

On a related note, I would suggest adding some notes to the MTD HOWTO
document about the DOC itself.  The DOC chip must be in a *good format*
(don't know what it means yet) before you can even nftl_format or fdisk
through /dev/mtd0 and /dev/nftla, etc.  One example that I have is that
during the experiment of installing the mtd/nftl drivers, one DOC
(Millennium) was zapped.  The DOC chip could not be recognized until it is
"reburned" with a good "image file" using M-System's own docpmap DOS
utility.  The "good image file" was a bootable kernel in ext2 fs.  We used
it for the original M-System's binary driver.  As I mention above, I don't
know what constitutes a "good format," but the one I had worked.

The DOC chip was so corrupted that even the dformat wouldn't work and dinfo
wouldn't recognized the DOC.  Only forcing a "reburning" of an image with
docpmap would restore the DOC to its working condition.

It's a pity.  I would love to use the dd command in the Linux world for
"burning" the image.  However, before you *fix* the format on DOC, you
cannot access to it from Linux, let along using the dd command.  Having to
use the DOS docpmap utility for a rescue makes me feel a little bit uneasy
and nauseous...

I guess once I sorted out all the problems that I have at hand, maybe I can
prepare that part of the document if anyone is interested.

Shuh

----- Original Message -----
From: "Ollie Lho" <ollie@sis.com.tw>
To: "Shuh C. Chang" <schang@3inet.com>
Cc: <mtd@infradead.org>
Sent: Tuesday, May 01, 2001 7:54 PM
Subject: Re: Is DOC Address 0xC8000 Something Special?


> Shuh C Chang wrote:
> >
> > Dear MTD fans:
> >
> > I would like to ask the developers in this list if any of you have ever
> > experienced a DiskOnChip (DOC) problem not being recognized at address
> > 0xC8000 ONLY by docprobe.
> >
>
> The C segment is usually used by VGA BIOS and is mapped (shadow) to your
> DRAM, not on any ISA device.
>
> Ollie
>
