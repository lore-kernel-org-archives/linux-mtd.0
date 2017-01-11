Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cRDcC-0007zS-9l
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 07:46:38 +0000
Date: Wed, 11 Jan 2017 08:46:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Peter Pan <peterpansjtu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Kelvin Cheung
 <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 4/7] mtd: nand: raw: prefix conflicting names with
 nandc instead of nand
Message-ID: <20170111084613.69e80a40@bbrezillon>
In-Reply-To: <8fb86bb7-425a-3897-2d1d-7277e94918ec@gmail.com>
References: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
 <1479732328-18363-5-git-send-email-boris.brezillon@free-electrons.com>
 <8fb86bb7-425a-3897-2d1d-7277e94918ec@gmail.com>
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

On Tue, 10 Jan 2017 20:08:23 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 11/21/2016 01:45 PM, Boris Brezillon wrote:
> > Some raw NAND function names conflict with names defined in nand.h.
> > Prefix all those functions with nandc (for nand chip) instead of nand so
> > we can include nand.h from rawnand.h
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
> 
> Nit, nand and nandc is quite confusing, why not call it nand_chip in full?
> 

Indeed, the name is confusing as hell, I just tried to keep it
short but that's probably not a good idea.
Maybe I should just prefix/suffix the new functions with nanddev instead
of changing the existing ones. What do you think?
