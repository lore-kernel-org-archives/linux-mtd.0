Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAcZ2-0001Z2-Ka
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2014 09:45:09 +0000
Received: by mail-la0-f45.google.com with SMTP id b8so6373321lan.32
 for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2014 01:44:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5FAE9987B8383445A4ECA479C08AC4816BBBFD85@vie197nt>
References: <5FAE9987B8383445A4ECA479C08AC4816BBBD81A@vie197nt>
 <1391191243.2501.3.camel@mizar.localdomain>
 <5FAE9987B8383445A4ECA479C08AC4816BBBFD85@vie197nt>
Date: Tue, 4 Feb 2014 10:44:45 +0100
Message-ID: <CAAQYJAsK0arbbid7iXwbPruJQ3qX0pSUyd1DOrH3jxPssWqH+w@mail.gmail.com>
Subject: Re: [PROBLEM] buffer write error (status timeout) due to unexpected
 behavior of P30 Micron flashes during state change "erase -> erase suspend"
From: Andrea Adami <andrea.adami@gmail.com>
To: BRUNMAYR Peter <Peter.BRUNMAYR@frequentis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 3, 2014 at 12:27 PM, BRUNMAYR Peter
<Peter.BRUNMAYR@frequentis.com> wrote:
>
> > Hi Peter,
> >
> > I experience similar issues. See actual patches still work in progress
> > [1]
> >
> > you are surely aware of
> > http://www.micron.com/~/media/Documents/Products/Technical%20Note/
> > NOR%
> > 20Flash/tn1206_p30_p33_j3_linux.pdf
> >
> > Check out the specific fixes.
> > I've tested that on my NOR but w/out much luck...
> >
> > One question: do you force CFI detection or does it 'just work'?
>
> Hi Andrea!
>
> Thank you for your reply. Yes, I am aware of the technical note from Micron and unfortunately none of the mentioned patches fixes my problem.

Eh... there are similar fixes in cmdset_0002, using 0xF0 instead of
0xFF before and after suspend/resume.
(TN-13-07: Patching the Linux Kernel and U-Boot for M29 Flash)


I have tried this patch as well:  http://patchwork.ozlabs.org/patch/143476/
and it seems there are less erase-suspend-erase cycles using it.

Still, on  my multi-partition chips, to have a fairly stable setup I
had  to disable both SimultaneousOperations and Suspend EraseOnWrite.


> The CFI detection worked in our system out of the box!
Ok, good to know. On  my device apparently one chip is not really
ready on boot and doesn't respond to cfi QRY.


>
> Best regards,
> Peter
>
Cheers

Andrea
