Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7NyH-0003vk-Mb
	for linux-mtd@lists.infradead.org; Sun, 17 Oct 2010 07:47:58 +0000
Received: by bwz7 with SMTP id 7so2801505bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Oct 2010 00:47:54 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] mtd: m25p80: add support to parse the
	partitions by OF node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>
In-Reply-To: <AANLkTimr03KAKnz5sfwm19=KzB-ik95WM_qQO0YP9qVs@mail.gmail.com>
References: <1286878714-13090-1-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-2-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-3-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-4-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-5-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
	<1287256647.1781.34.camel@brekeke>
	<AANLkTimr03KAKnz5sfwm19=KzB-ik95WM_qQO0YP9qVs@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Oct 2010 10:44:50 +0300
Message-ID: <1287301490.1951.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kumar.gala@freescale.com, david-b@pacbell.net, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
	Mingkai Hu <Mingkai.hu@freescale.com>, tie-fei.zang@freescale.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-16 at 19:05 -0600, Grant Likely wrote:
> On Sat, Oct 16, 2010 at 1:17 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2010-10-12 at 18:18 +0800, Mingkai Hu wrote:
> >> Signed-off-by: Mingkai Hu <Mingkai.hu@freescale.com>
> >> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> >> ---
> >> v4:
> >>  - Updated to latest kernel base(Linux 2.6.36-rc7).
> >>  - Made changes according to Grant's comments.
> >
> > Looks good to me, pushed to l2-mtd-2.6.git, thanks.
> 
> Wait!  It will break whenever CONFIG_OF is not set.  I broke
> linux-next with this patch.  It can be solved by wrapping the block
> with #ifdef CONFIG_OF, but I'd like to find a better solution.

OK, removed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
