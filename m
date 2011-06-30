Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcG1z-0000yL-Pm
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 12:07:42 +0000
Received: by iyn15 with SMTP id 15so2279597iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 05:07:37 -0700 (PDT)
Subject: Re: [PATCH] mtd: tmio_nand: fix build error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 30 Jun 2011 15:08:29 +0300
In-Reply-To: <BANLkTikonD2fcbkBU2ESYm_XncBXNZc_hw@mail.gmail.com>
References: <1309408494.10500.1.camel@phoenix>
	<BANLkTikonD2fcbkBU2ESYm_XncBXNZc_hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309435714.23597.181.camel@sauron>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Axel Lin <axel.lin@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-30 at 12:23 +0400, Dmitry Eremin-Solenikov wrote:
> On 6/30/11, Axel Lin <axel.lin@gmail.com> wrote:
> > Fix a mistake introduced by commit 33f4a3b
> > "mtd: tmio_nand.c: use mtd_device_parse_register"
> 
> Already sumbited 27 June 2011. Strangely Artem remains silent.

I handle my mailbox in FIFO order (with exceptions) so I have not
reached your patch yet. Now I've merged it with one of your previous
patches to keep the kernel bisectable.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
