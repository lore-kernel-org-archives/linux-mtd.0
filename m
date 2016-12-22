Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJzm8-0006P6-8r
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2016 09:35:01 +0000
Date: Thu, 22 Dec 2016 10:34:38 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, richard@sigma-star.at
Subject: Re: [PATCH] mtd-utils: Add configure switches to disable jffsX or
 ubifs tools
Message-ID: <20161222103438.536cfb7e@free-electrons.com>
In-Reply-To: <73715338-b8d1-9503-6b20-83a55812f906@sigma-star.at>
References: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
 <20161222101909.3a386438@free-electrons.com>
 <73715338-b8d1-9503-6b20-83a55812f906@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, 22 Dec 2016 10:27:36 +0100, David Oberhollenzer wrote:

> That is indeed an interesting consideration. The guides seem to be a bit
> blury on the destinction on enable/disable vs with/without.
> 
> I was under the impression that one should use enable/disable for features
> of a program and with/without for external dependencies or entire programs,
> i.e. "features of a project".

Yes, indeed that the general distinction between enable/disable and
with/without, you're right.

What I found odd in your code is the fact that you're in the end only
accepting yes or no, and the duplication of the AM_CONDITIONAL()
statements.

> > Indeed, using AM_CONDITIONAL() is useful to assign automake variable.
> > Here, BUILD_JFFS and BUILD_UBIFS are apparently only used within the
> > configure.ac, so using AM_CONDITIONAL() is useless.  
> Not quite. They are used in the automake file to skip building mkfs.ubifs
> and the jffsx utils.

Ah, okay. I haven't looked at the code base, just the patch itself, so
I definitely missed that. So an AM_CONDITIONAL() is definitely good.

But regardless of whether you go with AC_ARG_WITH() or AC_ARG_ENABLE(),
I still believe it's a lot more readable to have the AM_CONDITIONAL()
test *after* the AC_ARG_{WITH,ENABLE}.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
