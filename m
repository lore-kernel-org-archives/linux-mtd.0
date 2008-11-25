Received: from rv-out-0708.google.com ([209.85.198.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L4trV-0000TK-Bl
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 09:05:38 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2586699rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Nov 2008 01:05:35 -0800 (PST)
Message-ID: <f17812d70811250105n27e0e60cq16678c8efcd03de2@mail.gmail.com>
Date: Tue, 25 Nov 2008 17:05:35 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [GIT PULL] sharpsl-nand driver model hookup
In-Reply-To: <20081016231127.GA17131@doriath.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dmitry,

Sorry for late reply, I had nearly ignored this patch set. All 6 patches look
good to me (I was long hoping someone can get this cleaned up). With
the remaining board patches in your branch, poodle/corgi/spitz all boot
up without problems. So all

Acked-by: Eric Miao <eric.miao@marvell.com>

David,

Could you help to merge this patch series into the mtd tree?

Thanks very much!

On Fri, Oct 17, 2008 at 7:11 AM, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> Hi,
>
> Please have a look at the patches making sharpsl-nand more clean driver,
> correctly hooked in the driver model.
>
> The following changes since commit 6bb7a935489dab20802dde6c2cb7d8582f4849bf:
>  Linus Torvalds (1):
>        Merge branch 'for-linus' of git://git.kernel.org/.../tiwai/sound-2.6
>
> are available in the git repository at:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/lumag/tosa-2.6.git misc/mtd/sharpsl-nand
>
> Dmitry Baryshkov (6):
>      [MTD] sharpsl_nand: switch to driver model usage.
>      [MTD] sharpsl_nand: make drvdata non-static
>      [MTD] sharpsl_nand: move io addr to struct sharpsl_nand
>      [MTD] sharpsl-nand: cleanup partitions support
>      [MTD] sharpsl-nand: use platform_data for model-specific values
>      [MTD] sharpsl-nand: move registration to board code
>
>  arch/arm/mach-pxa/corgi.c   |   54 ++++++++++
>  arch/arm/mach-pxa/poodle.c  |   51 +++++++++
>  arch/arm/mach-pxa/spitz.c   |   76 +++++++++++++
>  drivers/mtd/nand/sharpsl.c  |  248 +++++++++++++++++++++----------------------
>  include/linux/mtd/sharpsl.h |   20 ++++
>  5 files changed, 324 insertions(+), 125 deletions(-)
>  create mode 100644 include/linux/mtd/sharpsl.h
>
> --
> With best wishes
> Dmitry
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Cheers
- eric
