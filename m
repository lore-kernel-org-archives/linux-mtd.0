Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRdBB-0006R8-KH
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 10:32:10 +0000
Subject: Re: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
To: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5795EA8B.2040209@nod.at>
Date: Mon, 25 Jul 2016 12:31:39 +0200
MIME-Version: 1.0
In-Reply-To: <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rajeev,

Am 25.07.2016 um 11:46 schrieb Rajeev Kumar:
> If the master mtd does not have any slave mtd partitions,
> and its numeraseregions is one(only has one erease block), and
> we attach the master mtd with : ubiattach -m 0 -d 0
> 
> We will meet the error:
> -------------------------------------------------------
> root ~$ ubiattach /dev/ubi_ctrl -m 0 -d 0
> UBI: attaching mtd0 to ubi0
> UBI error: io_init: multiple regions, not implemented
> ubiattach: error!: cannot attach mtd0
>            error 22 (Invalid argument)
> -------------------------------------------------------
> 
> In fact, if there is only one "erase block", we should not
> prevent the attach.
> 
> This patch is tested against 3.14 kernel and only build test is
> performed against current upstream master branch.

The more interesting question is, why is ->numeraseregions not 0?

The comment in the header says:
        /* Data for variable erase regions. If numeraseregions is zero,
         * it means that the whole device has erasesize as given above.
         */

So, if your MTD erase regions with the same size, it should be 0.

IIRC we had such a discussion already on linux-mtd and it was not clear
whether numeraseregions of 0 and 1 are equal or not.

Thanks,
//richard
