Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTtUM-0003n3-1B
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 19:02:39 +0000
From: Richard Weinberger <richard@nod.at>
To: Piotr Wojtaszczyk <wojtaszczykp@cumminsallison.com>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, beanhuo@micron.com
Subject: Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase issue
Date: Mon, 03 Dec 2018 20:02:16 +0100
Message-ID: <1844020.iFgpUNDC3t@blindfold>
In-Reply-To: <2acabca0-cc7a-6655-8bd9-592b516f58a2@cumminsallison.com>
References: <2acabca0-cc7a-6655-8bd9-592b516f58a2@cumminsallison.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 3. Dezember 2018, 19:55:46 CET schrieb Piotr Wojtaszczyk:
> On Thu, 29 Nov 2018 22:12:50 +0100 (CET)
> Thomas Gleixner <tglx at linutronix.de> wrote:
> 
>  > On some Micron NAND chips block erase fails occasionaly despite the chip
>  > claiming that it succeeded. The flash block seems to be not completely
>  > erased and subsequent usage of the block results in hard to decode 
> and very
>  > subtle failures or corruption.
> 
> Doesn't UBI check block after erase in do_sync_erase()? Do the bitflips 
> develop over time?

You mean ubi_self_check_all_ff()? This is a very expensive self-check
which is disabled by default and makes only sense then you test UBI itself.
Also think of power-cuts, what happens if you face power-loss right
after mtd_erase() and before the check?

Finally, I'm not sure if you can detect partial erase right after
mtd_erase(). I fear failure happens after you write to that block.

Thanks,
//richard  
