Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNxTo-0007hD-CE
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2017 07:56:28 +0000
Received: by mail-pg0-x241.google.com with SMTP id i5so29804559pgh.2
 for <linux-mtd@lists.infradead.org>; Sun, 01 Jan 2017 23:56:07 -0800 (PST)
Subject: Re: [PATCH V1] mtd : nand : denali :- No need of devm functions
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1481123711-7205-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20161229182443.2bdb37a7@bbrezillon>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <4bf4a97b-c2c3-51db-9bb1-61e6d433c7ca@gmail.com>
Date: Mon, 2 Jan 2017 13:26:01 +0530
MIME-Version: 1.0
In-Reply-To: <20161229182443.2bdb37a7@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

yes, if Memory is live out side function. Then devm_kzalloc()
approach has the benefit of simplifying the different error paths.

Here, Memory is alive with in function. we are going to free allocate memory
then why we need devm api. In this case Devm will first add this entry to
list and immediately it will remove from list. In this case, It's just a 
overhead
for devm api.

-Arvind


On Thursday 29 December 2016 10:54 PM, Boris Brezillon wrote:
> The
> devm_kzalloc() approach has the benefit of simplifying the different
> error paths.
