Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1ZL7cK-0003kt-2r
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 10:32:44 +0000
Date: Fri, 31 Jul 2015 12:32:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Scian <rnd4@dave-tech.it>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Han Xu <b45815@freescale.com>
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
Message-ID: <20150731123221.34cf601e@bbrezillon>
In-Reply-To: <55BB48D9.6050508@dave-tech.it>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
 <55BB48D9.6050508@dave-tech.it>
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

Hi Andrea,

Adding Han in Cc.

On Fri, 31 Jul 2015 12:07:21 +0200
Andrea Scian <rnd4@dave-tech.it> wrote:

> 
> Dear Boris,
> 
> 
> Il 30/07/2015 19:34, Boris Brezillon ha scritto:
> > The default NAND read functions are relying on an underlying controller
> > to correct bitflips, but some of those controller cannot properly fix
> > bitflips in erased pages.
> > In case of ECC failures, check if the page of subpage is empty before
> > reporting an ECC failure.
> 
> I'm still wondering if chip->ecc.strength is the right threshold.
> 
> Did you see my comments here [1]? WDYT?

Yes I've read it, and decided to go for ecc->strength as a first
step (I'm more interested in discussing the approach than the threshold
value right now ;-)).

Anyway, as you pointed out in the thread, writing data on an erased
page already containing some bitflips might generate even more
bitflips, so using a different threshold for the erased page check
makes sense. This threshold should definitely be correlated to the ECC
strength, but how, that's the question.

How about taking a rather conservative value like 10% of the specified
ECC strength, and see how it goes.

> 
> Maybe we can have this discussion in a separate thread, if you want ;-)

No, I think we should keep discussing it in this thread.

Thanks,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
