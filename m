Received: from gateway32.websitewelcome.com ([192.185.145.171])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfU7e-0001Zf-B9
 for linux-mtd@lists.infradead.org; Fri, 04 Jan 2019 18:23:07 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 734395E3020
 for <linux-mtd@lists.infradead.org>;
 Fri,  4 Jan 2019 12:23:04 -0600 (CST)
Subject: Re: [PATCH] mtd: rawnand: sunxi: Use struct_size() in devm_kzalloc()
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20190104172637.GA28084@embeddedor>
 <20190104191415.126e4a07@bbrezillon>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <02580805-17f7-1cc1-936c-5c73f00fe819@embeddedor.com>
Date: Fri, 4 Jan 2019 12:22:55 -0600
MIME-Version: 1.0
In-Reply-To: <20190104191415.126e4a07@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Boris,

On 1/4/19 12:14 PM, Boris Brezillon wrote:

> 
> I posted the same patch a few days back [1].
> 
> [1]http://patchwork.ozlabs.org/patch/1013855/
> 

Oh, that's great.

It's good to see people adopting the struct_size helper. :)

Happy new year.

Thanks
--
Gustavo
