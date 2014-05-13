Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkMH5-00032d-5j
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 23:38:19 +0000
Received: by mail-ie0-f178.google.com with SMTP id rd18so1109896iec.37
 for <linux-mtd@lists.infradead.org>; Tue, 13 May 2014 16:37:56 -0700 (PDT)
Date: Tue, 13 May 2014 16:37:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: pxa3xx: Use ECC strength and step size
 devicetree binding
Message-ID: <20140513233752.GE28907@ld-irv-0074>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395401690-25221-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140512180104.GJ28907@ld-irv-0074>
 <20140512191841.GA3064@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140512191841.GA3064@arch.cereza>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 12, 2014 at 04:18:41PM -0300, Ezequiel Garcia wrote:
> On 12 May 11:01 AM, Brian Norris wrote:
> > On Fri, Mar 21, 2014 at 08:34:49AM -0300, Ezequiel Garcia wrote:
> > > Also, if there is an ONFI-specified minimum ECC strength requirement,
> > > and the DT-specified ECC strength is weaker, print a warning and try to
> > > select a strength compatible with the ONFI requirement.
> > 
> > Are you sure you want to override? That seems contrary to the idea of a
> > DT property for specifying ECC. But maybe you have a good reason?
> > 
> 
> Actually, on IRC discussions you enforced the idea that the kernel shouldn't
> allow a weaker ECC strength than the datasheet (ONFI or ID table) specified.
> Hence, following your request, the implementation considers such devicetree
> setting as illegal and tries to find another one.

Hmm, I don't recall saying that exactly, although I might have said
something similar that could have been misconstrued as such.

I mostly recall discussing setting the ECC strength *without* device
tree (as pxa3xx_nand currently does), which is a different case, since
we don't have any outside input.

But anyway...

> > If you'd rather just warn the user, it's possible we could move that to
> > common code in nand_base.c.
> > 
> 
> Now that you mention this, I think you're right: it's very stupid to try to
> match an ECC scheme, different from the requested.
> 
> So, we either just warn the user (nosily) or we fail to probe the driver.
> If you ask me, I'd say let's just WARN() and let the user take the blame.

...yes, I (regardless of what "IRC Brian" said!) think that is the
correct approach when given an ECC scheme via device-tree. We should
honor it, and blame the user loudly.

Brian
