Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOZQt-00061w-5K
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 16:56:15 +0000
Received: by ywh42 with SMTP id 42so4835037ywh.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jun 2010 09:56:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1276587015-13506-1-git-send-email-agust@denx.de>
References: <1276371338-14253-1-git-send-email-agust@denx.de>
	<1276587015-13506-1-git-send-email-agust@denx.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 15 Jun 2010 12:55:54 -0400
Message-ID: <AANLkTim_deM9PCcoHxnC6g59tKn0eaWeD2q7-uI0cnJG@mail.gmail.com>
Subject: Re: [PATCH v4] mtdchar: fix mmap() for MTD RAM/ROM char devices
To: Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 15, 2010 at 03:30, Anatolij Gustschin wrote:
> For no-mmu systems mmap() on RAM/ROM devices already works
> but for systems with mmu it probably was not tested and
> doesn't work.
>
> This patch allows using mmap() on MTD RAM/ROM devices on systems
> with MMU. It has been tested on mpc5121e based platform with
> MR0A16A MRAM device attached over LocalBus.

i dont really have a way of testing the MMU path, but this looks sane.
Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
