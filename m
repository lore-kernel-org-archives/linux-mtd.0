Received: from smtprelay0157.hostedemail.com ([216.40.44.157]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViB5x-000725-Bt
 for linux-mtd@lists.infradead.org; Sun, 17 Nov 2013 22:45:33 +0000
Message-ID: <1384728305.14335.4.camel@joe-AO722>
Subject: Re: [PATCH] jffs2: fix sparse errors: directive in argument list
From: Joe Perches <joe@perches.com>
To: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 17 Nov 2013 14:45:05 -0800
In-Reply-To: <CAK4VdL2nKEE+xb=HtMGNsMGNR_ivUn_WnLi7X-rrXT0fpGbSTw@mail.gmail.com>
References: <1384719513-27386-1-git-send-email-nunes.erico@gmail.com>
 <1384724403.2727.22.camel@joe-AO722>
 <CAK4VdL2nKEE+xb=HtMGNsMGNR_ivUn_WnLi7X-rrXT0fpGbSTw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-sparse@vger.kernel.org,
 dwmw2 <dwmw2@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-11-17 at 20:34 -0200, Erico Nunes wrote:
> Do you mean it as an error in the sparse tool?

Yes.  I think it's a defect in how sparse
treats string concatenation.

That style:

	printk("%s\n",
#ifdef FOO
	"foo"
#endif
#ifdef BAR
	"bar"
#endif
	"string");

is pretty common in the kernel sources.

The patch itself is otherwise fine, but
perhaps unnecessary.
