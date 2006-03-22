Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM6pF-0006a5-7O
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 12:08:54 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 20:08:16 +0300
Message-Id: <1143047296.29683.44.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-03-21 at 15:36 +0300, Belyakov, Alexander wrote:
> Hello,
> 
> attached diff file is a patch to be applied on MTD snapshot 20060315
> introducing striping feature for Linux MTD. Despite striping
> is well known feature is was not implemented in MTD for some reason.
> We did it and ready to share with community. Hope, striping will find
> its
> place in Linux MTD.

$ diffstat stripe.diff
 b/drivers/mtd/Kconfig               |   47
 b/drivers/mtd/Makefile              |    1
 b/drivers/mtd/chips/Kconfig         |    7
 b/drivers/mtd/chips/Makefile        |    2
 b/drivers/mtd/chips/cfi_cpt.c       |  345 +++
 b/drivers/mtd/maps/mphysmap.c       |   20
 b/drivers/mtd/mtdstripe.c           | 3556
+++++++++++++++++++++++++++++++++++
 b/include/linux/mtd/cfi_cpt.h       |   47
 b/include/linux/mtd/stripe.h        |   40
 drivers/mtd/chips/Makefile          |    1
 drivers/mtd/chips/cfi_cmdset_0001.c |  109 -
 drivers/mtd/chips/cfi_cpt.c         |    1
 drivers/mtd/maps/mphysmap.c         |    1
 include/linux/mtd/cfi_cpt.h         |    1
 include/linux/mtd/stripe.h          |    1
 15 files changed, 4144 insertions(+), 33 deletions(-), 2
modifications(!)

You definitely have to split your patch on several parts. Your patch has
to only affect drivers/mtd/mtdstripe.c and include/linux/mtd/stripe.h.
If you have to modify other subsystem, send the modification separately,
motivate them and let the corresponding janitor to review them.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
