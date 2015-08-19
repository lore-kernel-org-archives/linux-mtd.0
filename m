Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrWn-0006hl-C8
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:46:54 +0000
Received: by pacgr6 with SMTP id gr6so143950187pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:46:32 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:46:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
Message-ID: <20150819004629.GS60523@google.com>
References: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
 <20150816152924.GA799@laptop.cereza>
 <87si7iandq.fsf@belgarion.home>
 <CAAEAJfAmD5VzA4J4+jwmCirmqfAJcvY8Ac45nupZwGVVb38Vhg@mail.gmail.com>
 <87d1ylafq3.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d1ylafq3.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

On Mon, Aug 17, 2015 at 09:15:48PM +0200, Robert Jarzmik wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
> > So unless I'm completely off, the current patch is right, and a comment
> > would be helpful.
> Ok Ezequiel, I'll wait for your Tested-by, and respin with something like :
> 
> 	/* Clear all status bit before issuing the next command, which can and
>          * will alter the status bits and will deserve a new interrupt on its
>          * own.
>          */

To be clear: I should hold off on this patch?

I'm going to try to clear my queue of things that are simple/obvious
and/or fix bugs (I think you spoke up about a different pxa3xx_nand
bugfix which I will try to find). There's too big a backlog for me to
get through everything for the merge window...

Thanks,
Brian
