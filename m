Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNJ9K-00043a-Pp
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 06:25:27 +0000
Received: by ewy3 with SMTP id 3so1291230ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 23:25:24 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: don't fail on -EBADMSG when fixing free space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
References: <1305196419.2713.84.camel@localhost>
	<1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
	<BANLkTi=+V7PR_29pK3ooVggPmeicCG0eWg@mail.gmail.com>
	<BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 09:21:34 +0300
Message-ID: <1305872494.2630.113.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Rmoving Adiran Hunter from CC - he's left Nokia and his e-mail does not
work anyway]

Hi,

On Thu, 2011-05-19 at 09:28 -0400, Ben Gardiner wrote:
> On Mon, Apr 25, 2011 at 2:37 PM, Matthew L. Creech <mlcreech@gmail.com> wrote:
> > We encountered one case in which we were re-flashing a device for
> > testing using U-Boot's "nand erase", and got the "ubi_io_read: error
> > -74" error from the FAQ.  That's no big deal, since we never do this
> > in the field, and clearly "nand erase" isn't something we'd want to do
> > even without this problem since it loses erase-counter info.
> 
> Because the "ubi_io_read: error -74 (ECC error)" is precisely what I
> am encountering on my hardware when I do not flash with a utility that
> drops empty pages at the end of eraseblocks. I imagined that this was
> also the case for you. But I have also read that there are
> peculiarities of the davinci nand driver (both in u-boot and linux).
> 
> So, at least on my hardware, the -74 error is expected when the 0xff
> pages are not dropped and so without the 'err != -EBADMSG' exception
> the free space fixup will cause the volume to fail mount for me:

I am confused. The fix Matthew made is about the following situation:

1. You have completely erased flash (MTD partition) - no one has ever
written there. If you now read the flash, you'll get all 0xFFs with no
errors.

2. You use a "dumb" flasher to program an UBI image. This flasher will
write empty NAND pages "as is". If you now read the flash after the
"dumb" programming, you should have no errors.

3. You mount UBIFS for the very first time. It tries to fix up your
flash. Whatever eraseblock UBIFS reads, it should not encounter any
error.

Isn't it weird that a freshly programmed flash cannot be read without
-EBADMSG (ECC correction failure).

Why Matthew's patches are needed then? They are needed to _prevent_
UBIFS from writing to the NAND pages which have been programmed with all
0xFFs.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
