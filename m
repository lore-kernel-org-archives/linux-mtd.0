Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDnPY-0000KM-5h
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 07:10:04 +0000
Message-ID: <1480921774.2583.351.camel@gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Joe Perches <joe@perches.com>,
 Marek Vasut <marek.vasut@gmail.com>, Pan Bian <bianpan201604@163.com>,
 David Woodhouse <dwmw2@infradead.org>,  Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>,  Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Pan Bian <bianpan2016@163.com>
Date: Mon, 05 Dec 2016 09:09:34 +0200
In-Reply-To: <0446c91c-ac84-3601-203a-9c2e7057f1f9@nod.at>
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
 <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
 <1480883619.4534.6.camel@perches.com>
 <0446c91c-ac84-3601-203a-9c2e7057f1f9@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2016-12-04 at 21:52 +0100, Richard Weinberger wrote:
> We should better think about how to get ubi_self_check_all_ff()
> fixed.
> When enabled on a modern NAND, vmalloc() is likely to fail now and
> then
> since len is the erase block size and can be up to a few mega bytes.

I did an attempt to switch from virtually continuous buffers to an
array of page pointers, but never finished.
