Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMmCI-0006By-Ba
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 00:36:59 +0000
Received: by mail-pa0-x236.google.com with SMTP id yy13so49323262pab.3
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jan 2016 16:36:37 -0800 (PST)
Date: Fri, 22 Jan 2016 16:36:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dwmw2@infradead.org,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: mpc5121: use 'of_machine_is_compatible' to
 simplify code
Message-ID: <20160123003634.GA16842@google.com>
References: <1452408399-5840-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <20160111135558.6ebd1165@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160111135558.6ebd1165@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 11, 2016 at 01:55:58PM +0100, Boris Brezillon wrote:
> On Sun, 10 Jan 2016 07:46:39 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> > The current code is the same as 'of_machine_is_compatible'.
> > So use it in order to remove a few lines of code and to be more
> > consistent with other parts of the kernel.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Your patch looks good from a functional POV, but what is this board
> detection hack doing in the NAND driver code in the first place?
> 
> Let's say I didn't see that :-).

:)

> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied to l2-mtd.git/next
