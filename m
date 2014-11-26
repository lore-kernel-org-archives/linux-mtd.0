Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtXvH-0005is-7D
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 08:26:03 +0000
Received: by mail-pa0-f43.google.com with SMTP id kx10so2431764pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2014 00:25:42 -0800 (PST)
Date: Wed, 26 Nov 2014 00:17:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Branden <sbranden@broadcom.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
Message-ID: <20141126081732.GQ3212@norris-Latitude-E6410>
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
 <545C8697.3080403@nod.at> <545D01F4.9050005@broadcom.com>
 <545F3FD8.6010001@nod.at> <546048AB.6040602@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <546048AB.6040602@broadcom.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 09, 2014 at 09:10:03PM -0800, Scott Branden wrote:
> On 14-11-09 02:20 AM, Richard Weinberger wrote:
> >Well, I agree with David that anything we do in software will only hide the real problem
> >or trim down the window.
> Hi Richard,
> 
> Currently the NAND does not shut down in a clean manner for a reboot
> operation.  This is due to the asynchronous ubi_thread make flash
> erase calls.  unmount is done properly in ubi already and cleanly
> shuts down.  reboot is not done in a clean manner as there is no
> reboot_notifier to handle the situation.
> 
> This is not hiding a real problem.  It is just shutting down ubi
> properly rather than pulling the power from it in the middle of
> operations.
> 
> In addition to this - a reboot_notifier needs to be added at the mtd
> level to shut it down properly as well.
> 
> This is not trimming down a window.  It is having the drivers shut
> down properly so they do not look like a power failure to the NAND
> device.
> 
> There is no solution to the power failure - it will corrupt pages in
> the middle of erasure.  And you do handle this in UBI/UBIFS.  But
> why corrupt other erase pages unnecessarily when all that needs to
> be done is shut down the drivers properly.  I don't know what you
> are agreeing with David with?  It is not making a window smaller.
> It is changing the functionality so that the UBI and MTD drivers are
> shut down cleanly in reboot situations.  Right now, they are not
> shut down at all in these situations.

I agree with Scott's statements. While it's fine to talk about how all
layers (from bootloader to UBIFS) should be able to handle a power cut
in the midst of an erase, that does *not* mean that we should
intentionally deny the chance to shut down cleanly.

AFAICT, Scott's not trying to work around any unsound reset behaviors
(in UBIFS or in his bootloader); he's just trying to shut things down
gracefully, just as we would try to terminate processes, sync file
systems, etc., rather than just cutting power on reboot.

Brian
