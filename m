Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g84Wa-0001eK-PT
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 14:22:50 +0000
Date: Thu, 4 Oct 2018 16:22:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Message-ID: <20181004162232.5ac363be@bbrezillon>
In-Reply-To: <38470936.GRFaOSl3cF@z50>
References: <20180719081508.5dafebde@bbrezillon> <7546835.d2Xs8Qh0bZ@z50>
 <20181004155933.0a32c4ac@bbrezillon> <38470936.GRFaOSl3cF@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 04 Oct 2018 16:11:42 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> 
> Legacy nand_wait_ready() uses a hardcoded timeout value of 400 ms.   Should we 
> follow the same approach in nand_gpio_waitrdy(), or should we rather let 
> drivers pass the timeout value, like in case of nand_soft_waitrdy()?

The latter.
