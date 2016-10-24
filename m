Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bygPw-0003tT-B9
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 14:40:03 +0000
Subject: Re: [PATCH] MAINTAINERS: add more people to the MTD maintainer team
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <b4ddcef0-d8c2-e1b4-6c46-e8f0d96d9cdd@nod.at>
Date: Mon, 24 Oct 2016 16:39:28 +0200
MIME-Version: 1.0
In-Reply-To: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 24.10.2016 14:35, Boris Brezillon wrote:
> Brian has been maintaining the MTD subsystem alone for several years
> now, and maintaining such a subsystem can really be time consuming.
> 
> Create a maintainer team formed of the most active MTD contributors
> to help Brian with this task, which will hopefully improve the
> subsystem reactivity.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Hi all,
> 
> I'm just trying to summarize what I understood the process would be,
> don't hesitate to correct me if I'm wrong.
> 
> For each release we will assign a specific MTD maintainer which will be
> responsible for taking MTD core patches and pulling spi-nor and nand PRs
> into the MTD tree and eventually send one or several PRs to Linus.
> 
> For fixes that are submitted after -rc1, I usually ask Brian to apply
> them directly into the MTD tree (I don't think there's a real need to
> prepare spi-nor and nand PRs for fixes), so we can proceed the same
> way: ask the maintainer assigned to this release to also take care of
> applying fixes and sending PRs to Linus before each -rc.
> 
> If you have other ideas, or would like to proceed differently, don't
> hesitate propose them.

Sounds good to me.
Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
