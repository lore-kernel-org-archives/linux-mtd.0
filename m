Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atVUL-0008L9-RQ
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 07:26:54 +0000
Date: Fri, 22 Apr 2016 09:26:27 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jespern@axis.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "open list:CRIS PORT" <linux-cris-kernel@axis.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 04/11] CRIS v32: nand: set ECC algorithm explicitly
Message-ID: <20160422072627.GT2555@axis.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-5-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1460926387-9563-5-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 17, 2016 at 10:53:00PM +0200, Rafał Miłecki wrote:
> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>


/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
