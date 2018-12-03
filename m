Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTpPz-0007N3-NO
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 14:41:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f81so3521844wmd.4
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2018 06:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20181129121458.GK19305@dastard> <20181129124756.GA25945@kroah.com>
 <20181129224019.GM19305@dastard> <20181130082203.GA26830@kroah.com>
 <20181130101441.GA213156@sasha-vm> <20181130215005.GP19305@dastard>
 <20181201074909.GC213156@sasha-vm>
 <CAOQ4uxhCH3oxVWDMVRcXMZO3JSTCA1Pp5AYnHP5pDxyNktqONw@mail.gmail.com>
 <20181202152547.GI221015@sasha-vm> <20181202161016.GA27696@infradead.org>
 <20181202200819.GA3932@kroah.com>
In-Reply-To: <20181202200819.GA3932@kroah.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 3 Dec 2018 15:41:27 +0100
Message-ID: <CAFLxGvyx-n4fUbsv+PrAebAPRe=yGV1zLRA44XnOwtMaubS8cg@mail.gmail.com>
Subject: Re: XFS patches for stable
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, sashal@kernel.org,
 amir73il@gmail.com,
 Dave Chinner <david@fromorbit.com>, stable <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dchinner@redhat.com,
 darrick.wong@oracle.com,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 mcgrof@kernel.org, linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 2, 2018 at 9:09 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Dec 02, 2018 at 08:10:16AM -0800, Christoph Hellwig wrote:
> > As someone who has done xfs stable backports for a while I really don't
> > think the autoselection is helpful at all.
>
> autoselection for xfs patches has been turned off for a while, what
> triggered this email thread was a core vfs patch that was backported
> that was not obvious it was created by the xfs developers due to a
> problem they had found.

Sorry for hijacking this thread.
Can you please also disable autoselection for MTD, UBI and UBIFS?

fs/ubifs/
drivers/mtd/
include/linux/mtd/
include/uapi/mtd/

-- 
Thanks,
//richard
