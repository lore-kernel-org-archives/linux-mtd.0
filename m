Received: from mail-yh0-x22a.google.com ([2607:f8b0:4002:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb3Zv-0000XT-N1
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 08:55:52 +0000
Received: by yhch68 with SMTP id h68so23230347yhc.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Mar 2015 01:55:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1422789058-4595-1-git-send-email-david.oberhollenzer@sigma-star.at>
References: <CAFLxGvy6bnPnzZyGXiAN8Jq54E7CDpF5CmvLzkAuuMn8jdUbmQ@mail.gmail.com>
 <1422789058-4595-1-git-send-email-david.oberhollenzer@sigma-star.at>
Date: Thu, 26 Mar 2015 09:55:29 +0100
Message-ID: <CAFLxGvyG38+dQZXyFeGF3nru71bPR0VU_0ZTKJmmdVh96txqGA@mail.gmail.com>
Subject: Re: [PATCH] UBI: power cut emulation for testing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 1, 2015 at 12:10 PM,  <david.oberhollenzer@sigma-star.at> wrote:
> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>
> Emulate random power cuts by switching device to ro after a number of
> writes to allow simple power cut testing with nand-sim.
>
> Maximum and minimum number of successful writes before power cut and
> what kind of writes (EC header, VID header or none) to interrupt
> configurable via debugfs.
>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Applied, thanks David!

-- 
Thanks,
//richard
