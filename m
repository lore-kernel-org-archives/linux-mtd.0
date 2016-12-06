Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEKkm-0004UQ-9K
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 18:46:13 +0000
Subject: Re: [PATCH 0/2] mtd-utils: Fix almost all compiler warnings
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <68692f37-0728-342e-2034-3e6866253784@sigma-star.at>
Date: Tue, 6 Dec 2016 19:44:38 +0100
MIME-Version: 1.0
In-Reply-To: <1480095041-25627-1-git-send-email-boris.brezillon@free-electrons.com>
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

On 11/25/2016 06:30 PM, Boris Brezillon wrote:
> Hello,
> 
> These 2 patches fix all the warnings except the #warning in 
> misc-utils/flashcp.c.
> 
> The first patch make sure the PRIoff formats are correct on all
> 64 bits platforms, and the second one fixes all 'unchecked return
> val' warnings.
> 
> This series is based on mtd-utils' master branch.
Applied to mtd-utils.git.


Thanks,

David
