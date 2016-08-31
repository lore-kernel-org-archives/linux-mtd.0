Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf8rR-0007DE-Qm
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 16:59:38 +0000
Date: Wed, 31 Aug 2016 18:59:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Sebastian Frias <sf84@laposte.net>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
Subject: Re: [RFC preliminary v0.1] nfc driver for tango platform
Message-ID: <20160831185916.199c5433@bbrezillon>
In-Reply-To: <57C707F3.5080301@free.fr>
References: <57C58252.50902@free.fr>
	<57C707F3.5080301@free.fr>
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

On Wed, 31 Aug 2016 18:38:11 +0200
Mason <slash.tmp@free.fr> wrote:

> On 30/08/2016 14:55, Mason wrote:
> > Hello linux-mtd,
> > 
> > I've been writing a driver for the custom NAND Flash controller embedded
> > in tango chips, such as smp8758.
> > 
> > I'd like to hear every and all feedback on what I did wrong so that I can
> > eventually submit the work upstream. Please bear in mind that this is a
> > preliminary version, so there are still a few rough edges.  
> 
> I didn't have time to finish, and make a proper patch, as Boris requested.
> But I did fix all the hard-coded values, and I wanted to post the result,
> as a reference.

I already told you on IRC that I would not review your code if it's
not submitted in the correct format. So, why do you even try to send a
new version?

On a more general note, I'm tired trying to convince you that the way
you do things is inappropriate (it usually happens on minor things, and
you keep arguing endlessly). So please try to listen to
other devs/maintainers comments instead constantly defying them.

> 
> I will try to fix the two hard-coded timings. (Since these are chip-dependent
> parameters, I thought they should be passed via the device tree, but Boris
> thinks it might be possible to deduce at run-time?)
> 
> I'm hoping to post a proper patch (with Kconfig and Makefile updated) some
> time tomorrow.

Why did you send this email then???
