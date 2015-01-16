Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCFAk-0005fR-TY
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 22:15:19 +0000
Received: by mail-ig0-f169.google.com with SMTP id z20so5882622igj.0
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 14:14:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1501161938150.16829@lnxricardw1.se.axis.com>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
 <20150114191907.GX9759@ld-irv-0074>
 <CAAK6Zt3suTh9=GpYP8CYooqOsq6xFnLOUAPk=o4N2dnL7P-sgg@mail.gmail.com>
 <alpine.DEB.2.02.1501160954560.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt3mWvNwDnVU0oORTDC1Es_0jyvNqNyQPxqEjsgJJETiFw@mail.gmail.com>
 <alpine.DEB.2.02.1501161938150.16829@lnxricardw1.se.axis.com>
Date: Fri, 16 Jan 2015 14:14:55 -0800
Message-ID: <CAAK6Zt1a1qAtv1z6gZ663=PaARDD9T-m54eqJc2n_omVmGCbhw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 10:53 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Fri, 16 Jan 2015, Daniel Ehrenberg wrote:
>
> Are you and Erik Ekman on this list working on the same thing, he is also
> using an out-of-tree NAND driver?

No, I'm not working with him.

> The conclusion as far as I'm concerned is to use a BBT in a production
> code so that the flash is only ever read in its entirety (i.e. with
> badblocks) once, in order to generate the BBT. In our R&D department,
> especially in departments where they just want a unit to work and aren't
> testing or developing flash code, we can be more leniant and have even
> erased factory-marked bad blocks in some cases (when possible). In the
> unlikely event that a memory chip starts behaving erratically (which
> hasn't happened yet) we'd just replace it. In the field such a situation
> would be harder to diagnose so we want to avoid that as far as possible.

Thanks for this explanation. I'll work on adding a bad block table to
how I'm using NAND. I don't know what got into my head to think that
UBI was going to do all this for me. I guess the original patch at the
head of this thread isn't so useful for that use case.

Dan
