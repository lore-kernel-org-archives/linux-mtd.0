Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5Kvg-0002ZY-Kz
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:54:41 +0000
Received: by mail-oa0-f51.google.com with SMTP id h16so7656075oag.10
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:54:19 -0800 (PST)
Date: Mon, 20 Jan 2014 11:54:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] mtd: davinci_nand: Remove unnecessary labels from error
 path
Message-ID: <20140120195416.GU8919@ld-irv-0074>
References: <1389773306-7055-1-git-send-email-prabhakar.csengg@gmail.com>
 <20140116213206.GG8919@ld-irv-0074>
 <CA+V-a8u42eNcDoSr42Bq-3JJEdFMXjru-PDpmXqjZEzkoQ=efQ@mail.gmail.com>
 <CA+V-a8sNSKX_W43G7A0zFKq1GX7k25XR2ZxVtxiQyAmLD5Rs4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8sNSKX_W43G7A0zFKq1GX7k25XR2ZxVtxiQyAmLD5Rs4w@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 17, 2014 at 01:20:36PM +0530, Prabhakar Lad wrote:
> On Fri, Jan 17, 2014 at 10:46 AM, Prabhakar Lad
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Jan 17, 2014 at 3:02 AM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> >> On Wed, Jan 15, 2014 at 01:38:26PM +0530, Prabhakar Lad wrote:
> >>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> >>>
> >>> This patch removes the unnecessary labels from
> >>> the error path in probe function which did nothing
> >>> than just returning error values, Thus simplifying code
> >>> path and improved readability.
> >>>
> >>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> >>
> >> This does not apply to my branch, since some OOM messages have been
> >> dropped. Can you rebase on l2-mtd.git (or linux-next)?
> >>
> > OK I'll rebase it against linux-next and post a v2.
> >
> My Bad was too late, there is already a patch fixing the above issue
> in linux-next

Ah, and my bad on remembering; I thought this looked familiar! :)

> please ignore this patch.

Sure.

Thanks,
Brian
