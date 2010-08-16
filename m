Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Okz3A-0000pS-TC
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 12:44:25 +0000
Received: by wwi14 with SMTP id 14so5453541wwi.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 05:44:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53612FE6B944314AAADB181E45A45B64133DDFC156@sc-vexch3.marvell.com>
References: <AANLkTi=YSS0-Nf4MWOw30YDrCdrkmtzLhv7DXfsoJTjX@mail.gmail.com>
	<53612FE6B944314AAADB181E45A45B64133DDFC156@sc-vexch3.marvell.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 Aug 2010 20:44:03 +0800
Message-ID: <AANLkTimh=dbUV75ZVXuhknt4FiMtximXLY8xoADfbe=q@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for
	samsung2GbX8
To: Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=UTF-8
Cc: Haojian Zhuang <hzhuang1@marvell.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Axel Lin <axel.lin@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 16, 2010 at 8:34 PM, Lei Wen <leiwen@marvell.com> wrote:
> Hi Axel,
>
> I suggest not merge your patch into mainline code. Since I have a large series of patch which reconstruct the nand flash definition, this fix would no longer be needed.
>

Lei, would you please point the URL of the patch series (possibly by
searching linux-mtd archive or some other mailing list archive) so that
Axel can have a reference and be involved?

- eric
