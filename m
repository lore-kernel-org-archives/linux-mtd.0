Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZhZY-00057Q-90
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 13:37:04 +0000
Received: by mail-pd0-f176.google.com with SMTP id g10so3923535pdj.7
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2013 06:36:42 -0700 (PDT)
Date: Fri, 25 Oct 2013 21:41:17 -0400
From: Huang Shijie <shijie8@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH V2] mtd: gpmi: fix the ecc regression
Message-ID: <20131026014115.GB3195@gmail.com>
References: <1382602484-12023-1-git-send-email-b32955@freescale.com>
 <1382702607.8522.110.camel@shinybook.infradead.org>
 <1382703654.8522.114.camel@shinybook.infradead.org>
 <20131026013258.GA3195@gmail.com>
 <1382707782.8522.140.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382707782.8522.140.camel@shinybook.infradead.org>
Cc: Marek Vasut <marex@denx.de>, dedekind1@gmail.com, tharvey@gateworks.com,
 stable@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 02:29:42PM +0100, David Woodhouse wrote:
> On Fri, 2013-10-25 at 21:33 -0400, Huang Shijie wrote:
> > 
> >   I am ok with your patch. but we will meet a compiler warning, since
> >   the set_geometry_by_ecc_info() is not referenced.
> 
> Yeah, I predicted that but at this stage with *hours* to catch Linux and
> get it into 3.12, I think that's the better option. I'll note it in the
> commit comment.

ok. Please add my ack for your formal patch:
Acked-by: Huang Shijie <shijie8@gmail.com>
