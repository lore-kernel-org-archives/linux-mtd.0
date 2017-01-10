Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cR1p5-00069T-Kl
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 19:11:09 +0000
Received: by mail-wm0-x244.google.com with SMTP id l2so32050482wml.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 11:10:46 -0800 (PST)
Subject: Re: [PATCH v3 4/7] mtd: nand: raw: prefix conflicting names with
 nandc instead of nand
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Peter Pan <peterpansjtu@gmail.com>
References: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
 <1479732328-18363-5-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Kelvin Cheung <keguang.zhang@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8fb86bb7-425a-3897-2d1d-7277e94918ec@gmail.com>
Date: Tue, 10 Jan 2017 20:08:23 +0100
MIME-Version: 1.0
In-Reply-To: <1479732328-18363-5-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/2016 01:45 PM, Boris Brezillon wrote:
> Some raw NAND function names conflict with names defined in nand.h.
> Prefix all those functions with nandc (for nand chip) instead of nand so
> we can include nand.h from rawnand.h
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Nit, nand and nandc is quite confusing, why not call it nand_chip in full?

-- 
Best regards,
Marek Vasut
