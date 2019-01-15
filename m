Received: from gateway30.websitewelcome.com ([192.185.168.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjT5A-0006zR-Dy
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 18:05:02 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 199737026
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2019 12:04:47 -0600 (CST)
Subject: Re: [PATCH] mtd: rawnand: marvell: use struct_size() in devm_kzalloc()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20190104182051.GA3603@embeddedor> <20190115185804.75e482c3@xps13>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <fade8039-cfd8-18f2-8f1e-8e84661beb4e@embeddedor.com>
Date: Tue, 15 Jan 2019 12:04:40 -0600
MIME-Version: 1.0
In-Reply-To: <20190115185804.75e482c3@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 1/15/19 11:58 AM, Miquel Raynal wrote:

>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
> 
> Applied to nand/next.
> 

Thanks, Miquèl.

--
Gustavo
