Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKdQC-0006WT-7Y
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 22:00:04 +0000
Received: from [192.168.12.102] (72.sub-166-250-2.myvzw.com [166.250.2.72])
	by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id p9UM01HM089902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 15:00:02 -0700 (PDT)
	(envelope-from mikedunn@newsguy.com)
Message-ID: <4EADC8AF.8040309@newsguy.com>
Date: Sun, 30 Oct 2011 14:59:11 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/13]  DocG3 fixes and write support
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/2011 10:51 AM, Robert Jarzmik wrote:
> The ECC part should especially be reviewed by Ivan and Mike,
> as this is their work (patch "add ECC correction code"). 

Will do. 

I asked this in another post, but I'll pose it here as well... Should the
diskonchip drivers use the nand interface?  They are MLC nand under the hood
(albeit wrapped inside a non-standard controiller), and some time ago the legacy
diskonchip2000 driver was updated to use the nand interface from its earlier
stand-alone incarnation.

This question is of great interest to me because the diskonchip G4 driver I've
been working on uses the nand interface.  The end result is a fairly clean
interface, with just a couple minor hacks to get around the fact that it does
not have a "standard" nand controller.  At this point I'm not knowledgeable
enough to argue for the nand interface; it just seemed to be the correct approach. 

The G3 and G4 devices are similiar enough that, even if they are not combined
into a single driver, they should certainly interface with the mtd
infrastructure code in the same manner.  Hopefully someone can shed some light.

Thanks,
Mike

> Happy review.
>
> --
> Robert
>
> Robert Jarzmik (13):
>   mtd/docg3: fix debug log verbosity
>   mtd/docg3: fix tracing of IO in writeb
>   mtd/docg3: fix protection areas reading
>   mtd/docg3: fix BCH registers
>   mtd/docg3: add multiple floor support
>   mtd/docg3: add OOB layout to mtdinfo
>   mtd/docg3: add registers for erasing and writing
>   mtd/docg3: add OOB buffer to device structure
>   mtd/docg3: add write functions
>   mtd/docg3: add erase functions
>   mtd/docg3: map erase and write functions
>   mtd/docg3: add ECC correction code
>   mtd/docg3: add suspend and resume
>
>  drivers/mtd/devices/Kconfig |    1 +
>  drivers/mtd/devices/docg3.c |  933 +++++++++++++++++++++++++++++++++++++------
>  drivers/mtd/devices/docg3.h |   42 ++-
>  3 files changed, 860 insertions(+), 116 deletions(-)
>
