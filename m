Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WirIl-0003qM-9T
 for linux-mtd@lists.infradead.org; Fri, 09 May 2014 20:21:51 +0000
Received: by mail-qg0-f46.google.com with SMTP id q108so5076760qgd.33
 for <linux-mtd@lists.infradead.org>; Fri, 09 May 2014 13:21:28 -0700 (PDT)
Date: Fri, 9 May 2014 13:21:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mtd: nand: refactor erase_cmd() to return chip status
Message-ID: <20140509202122.GG28907@ld-irv-0074>
References: <1399417870-14436-1-git-send-email-computersforpeace@gmail.com>
 <CAF2Aj3hB-6=yfCOhqXrWGcPey1DEGqkUfkEsRdrQbXz80s_sug@mail.gmail.com>
 <20140507171229.GD28907@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140507171229.GD28907@ld-irv-0074>
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2014 at 10:12:29AM -0700, Brian Norris wrote:
> On Wed, May 07, 2014 at 11:59:56AM +0100, Lee Jones wrote:
> > On 7 May 2014 00:12, &quot;Brian Norris&quot; <computersforpeace@gmail.com>
> > wrote:
> > >
> > > The nand_chip::erase_cmd callback previously served a dual purpose; for
> > > one, it allowed a per-flash-chip override, so that AG-AND devices could
> > > use a different erase command than other NAND. These AND devices were
> > > dropped in commit xxxxx. On the other hand, some drivers (denali and
> > I think you still need to fill this in.
> 
> Yes... I should re-read my commit messages before sending! This should
> be:
> 
> commit 14c6578683367b1e7af0c3c09e872b45a45183a7
> (mtd: nand: remove AG-AND support)
> 
...
> > Tested-by: Lee Jones <lee.jones@linaro.org>
> 
> I've updated my commit message locally. I'll give this a few days, then
> push the patch.

Pushed to l2-mtd.git.

Brian
