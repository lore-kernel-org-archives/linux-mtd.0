Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBdh3-0004c5-Ug
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 08:55:31 +0000
Date: Fri, 19 May 2017 05:55:00 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/30] isa.txt: standardize document format
Message-ID: <20170519055500.0334ebdc@vento.lan>
In-Reply-To: <20170519021355.GA24556@sophia>
References: <cover.1495156975.git.mchehab@s-opensource.com>
 <3cfb5ad6db86330e07c6d0f833bbdb2788d99fa7.1495156975.git.mchehab@s-opensource.com>
 <20170519021355.GA24556@sophia>
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

Hi William,

Em Thu, 18 May 2017 22:13:55 -0400
William Breathitt Gray <vilhelm.gray@gmail.com> escreveu:

> On Thu, May 18, 2017 at 10:24:00PM -0300, Mauro Carvalho Chehab wrote:
> >Each text file under Documentation follows a different
> >format. Some doesn't even have titles!
> >
> >Change its representation to follow the adopted standard,
> >using ReST markups for it to be parseable by Sphinx:
> >
> >- Use the main title standard for this document;
> >- replace _foo_ by **foo** for emphasis;
> >- mark literal blocks as such.
> >
> >Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>  
> 
> I'm all right with this patch, but there's just one minor nitpick about
> the title that I've inlined.
> 
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Thanks for review!

> >---
> > Documentation/isa.txt | 53 ++++++++++++++++++++++++++-------------------------
> > 1 file changed, 27 insertions(+), 26 deletions(-)
> >
> >diff --git a/Documentation/isa.txt b/Documentation/isa.txt
> >index f232c26a40be..def4a7b690b5 100644
> >--- a/Documentation/isa.txt
> >+++ b/Documentation/isa.txt
> >@@ -1,5 +1,6 @@
> >+===========
> > ISA Drivers
> >------------  
> 
> There's no need for this single-dashed line now so just remove it.

Actually, the patch is removing the single-dashed line. The first "-"
character on the above line from diff :-)

> 
> >+===========


Thanks,
Mauro
