Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZhbZ-0005C9-4x
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 13:39:09 +0000
From: Marek <marex@denx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH V2] mtd: gpmi: fix the ecc regression
Date: Fri, 25 Oct 2013 15:38:37 +0200
Message-ID: <1840834.G3nI0UQ6lx@w510>
In-Reply-To: <1382707782.8522.140.camel@shinybook.infradead.org>
References: <1382602484-12023-1-git-send-email-b32955@freescale.com>
 <20131026013258.GA3195@gmail.com>
 <1382707782.8522.140.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: dedekind1@gmail.com, tharvey@gateworks.com, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 25 of October 2013 14:29:42 David Woodhouse wrote:
> On Fri, 2013-10-25 at 21:33 -0400, Huang Shijie wrote:
> >   I am ok with your patch. but we will meet a compiler warning, since
> >   the set_geometry_by_ecc_info() is not referenced.
> 
> Yeah, I predicted that but at this stage with *hours* to catch Linux and
> get it into 3.12, I think that's the better option. I'll note it in the
> commit comment.
> 
> Thanks for the prompt feedback.

Might __maybe_unused help here ?
