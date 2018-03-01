Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erR8h-0007Wh-8j
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 16:33:04 +0000
From: Richard Weinberger <richard@nod.at>
To: Stefan Agner <stefan@agner.ch>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] UBIFS: remove unnecessary assignment
Date: Thu, 01 Mar 2018 17:34:15 +0100
Message-ID: <2272304.lgjJJ99gjW@blindfold>
In-Reply-To: <20180211221736.25453-1-stefan@agner.ch>
References: <20180211221736.25453-1-stefan@agner.ch>
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

Am Sonntag, 11. Februar 2018, 23:17:36 CET schrieb Stefan Agner:
> Assigning a value of a variable to itself is not useful. This
> fixes a warning shown when using clang:
>   warning: explicitly assigning value of variable of type 'int' to itself
> [-Wself-assign]

Queued for next!

Thanks,
//richard
