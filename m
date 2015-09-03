Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXYCY-00054o-A2
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 17:21:30 +0000
Date: Thu, 3 Sep 2015 19:19:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Andrea Scian
 <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [RESEND PATCH v3 4/5] mtd: nand: make 'erased check' optional
Message-ID: <20150903191952.72b556cd@bbrezillon>
In-Reply-To: <1441296222-14989-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-5-git-send-email-boris.brezillon@free-electrons.com>
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

On Thu,  3 Sep 2015 18:03:41 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Some ECC controllers do not need the extra 'erased check' done by the core.
> Make it optional by creating a new NAND_ECC_DISABLE_ERASED_CHECK flag.
> 
> Reed-Solomon ECC engines are guaranteed to generate ff ECC bytes when the
> page in empty and are thus able to fix bitflips in erased pages.

s/Reed-Solomon/Hamming/


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
