Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1On5hf-00020L-EC
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 08:14:56 +0000
Received: by fxm12 with SMTP id 12so2988349fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Aug 2010 01:14:54 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C520E99.3050006@broadcom.com>
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
	<4C4FEC02.9050300@parrot.com>  <4C520E99.3050006@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Aug 2010 11:14:50 +0300
Message-ID: <1282464890.16502.43.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-29 at 16:28 -0700, Brian Norris wrote:
> On 07/28/2010 01:36 AM, Matthieu CASTET wrote:
> > Hi,
> > 
> > Brian Norris a écrit :
> >> I found some newer Micron parts that introduce an 8K page size, and so
> >> need a modification on the algorithm. Here's the updated list and a
> >> revision to my patch.
> >>
> > Doesn't these micron nands support onfi ?
> > The micron nands we have support it.
> 
> Yes, they do support ONFI...but you missed my statements in the previous
> e-mail :)

But your v2 should be independent patch and contain all the explanations
from the previous version too. It basically should be ready to be
git-am'ed as is... If you see what I mean.

Artem.
