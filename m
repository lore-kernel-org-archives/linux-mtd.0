Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIubo-0003v5-Hj
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 10:24:10 +0000
Subject: Re: [PATCH 3/7] mtd: use class_groups instead of class_attrs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20170608081242.27061-1-gregkh@linuxfoundation.org>
 <20170608081242.27061-4-gregkh@linuxfoundation.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <2b95e9ab-da47-9c46-7ec7-e28796098662@nod.at>
Date: Thu, 8 Jun 2017 12:23:42 +0200
MIME-Version: 1.0
In-Reply-To: <20170608081242.27061-4-gregkh@linuxfoundation.org>
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

Am 08.06.2017 um 10:12 schrieb Greg Kroah-Hartman:
> The class_attrs pointer is long depreciated, and is about to be finally
> removed, so move to use the class_groups pointer instead.
> 
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: <linux-mtd@lists.infradead.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
