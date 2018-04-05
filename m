Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f43Zn-0007M3-2Y
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 12:01:12 +0000
Subject: Re: [PATCH 1/1] mtd:nand:fix memory leak
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Xidong Wang <wangxidong_97@163.com>, Mans Rullgard <mans@mansr.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
 <20180404082807.0f211578@xps13> <20180404090710.4f74b5b4@bbrezillon>
 <20180404090831.37e85d59@bbrezillon>
 <6ae95633-d82f-1294-c7c7-db59c00d1d4d@free.fr>
 <20180405115448.36d2372f@bbrezillon>
 <d7a24775-1d4f-afd4-bec0-1850eb337183@free.fr>
 <20180405134759.2cc29d42@bbrezillon>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <1cafa2b3-3f0b-eae5-338d-d6119aac55f0@free.fr>
Date: Thu, 5 Apr 2018 14:00:39 +0200
MIME-Version: 1.0
In-Reply-To: <20180405134759.2cc29d42@bbrezillon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/04/2018 13:47, Boris Brezillon wrote:

> On Thu, 5 Apr 2018 13:26:31 +0200, Marc Gonzalez wrote:
> 
>> IIUC, you're saying:
>> 1) use devm_clk_get() instead of clk_get() to solve the memory leak
>> 2) call clk_prepare_enable() before clk_get_rate() even if the former is a no-op today
> 
> + a disable_unprepare() in the remove path and a another one in the
> error path (in case something fails after prepare_enable() has been
> called).

I hate C error-handling with all my heart...

Why is it taking so long for Linux APIs to be turned into devm
managed functions? It makes life so much easier...
