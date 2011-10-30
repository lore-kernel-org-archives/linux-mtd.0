Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKJT4-0000eG-UE
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 00:41:43 +0000
Received: by faaf16 with SMTP id f16so6261895faa.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 17:41:41 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 00/13]  DocG3 fixes and write support
Date: Sun, 30 Oct 2011 02:41:39 +0200
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201110300241.39534.marek.vasut@gmail.com>
Cc: dwmw2@infradead.org, mikedunn@newsguy.com,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> This patchset is aimed at :
>  - fixing 4 glitches in the driver
>  - add several new functions
> 
> The added functions are :
>  - add block erase capability
>  - add write page capability
>  - add powerdown and powerup
>  - add multiple floor support
>  - add ECC support
> 
> The ECC part should especially be reviewed by Ivan and Mike,
> as this is their work (patch "add ECC correction code").
> 
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
>  drivers/mtd/devices/docg3.c |  933
> +++++++++++++++++++++++++++++++++++++------ drivers/mtd/devices/docg3.h | 
>  42 ++-
>  3 files changed, 860 insertions(+), 116 deletions(-)

Hi,

can you sum up the situation about the another (docg4) driver for us not 
watching this too tightly? Was there any improvement/progress/... ?

Cheers
