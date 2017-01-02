Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNyLu-0002Cn-3Z
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2017 08:52:25 +0000
Date: Mon, 2 Jan 2017 09:51:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] mtd : nand : denali :- No need of devm functions
Message-ID: <20170102095158.2394cf93@bbrezillon>
In-Reply-To: <4bf4a97b-c2c3-51db-9bb1-61e6d433c7ca@gmail.com>
References: <1481123711-7205-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20161229182443.2bdb37a7@bbrezillon>
 <4bf4a97b-c2c3-51db-9bb1-61e6d433c7ca@gmail.com>
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

On Mon, 2 Jan 2017 13:26:01 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> yes, if Memory is live out side function. Then devm_kzalloc()
> approach has the benefit of simplifying the different error paths.
> 
> Here, Memory is alive with in function. we are going to free allocate memory
> then why we need devm api. In this case Devm will first add this entry to
> list and immediately it will remove from list. In this case, It's just a 
> overhead
> for devm api.

Yes, it adds a small overhead, but ITOH, it simplifies the code (see
the kfree() calls you added in different error paths with your
approach). Sometime a small runtime overhead (especially when the code
is executed once at probe time) is acceptable if it improves
readability.
