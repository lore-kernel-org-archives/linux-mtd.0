Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTSjC-0000fW-9p
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 14:28:11 +0000
Date: Sun, 2 Dec 2018 15:27:55 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase
In-Reply-To: <97341e577e734deeb3cdcfd4583c7ffe@Astraea.Cumminslocal.com>
Message-ID: <alpine.DEB.2.21.1812021525250.3969@nanos.tec.linutronix.de>
References: <mailman.5261.1543570682.2376.linux-mtd@lists.infradead.org>
 <97341e577e734deeb3cdcfd4583c7ffe@Astraea.Cumminslocal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Nov 2018, Wojtaszczyk, Piotr wrote:

> On which micron part are you seeing the problem. I'm using MT29F4G16A and
> see similar issue. Data sheet says that erase takes from 0.7ms up to 3ms
> don't know if Micron tunes the delay per part or per block. Maybe on some
> blocks it's not enough.

MT29F8G08. But I doubt, that it's a delay issue. My current findings tell
me it's related to the amount of data (probably 0 bits) in a block. But
that's a pure conclusion from observation and not scientific analysis.

Thanks,

	Thomas
