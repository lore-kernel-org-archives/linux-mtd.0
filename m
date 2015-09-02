Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXEr1-0003zv-6V
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:41:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Sep 2015 13:41:14 -0700
From: Stefan Agner <stefan@agner.ch>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Bhuvanchandra DV
 <bhuvanchandradv@gmail.com>, linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: Re: UBIFS errors when file-system is full
In-Reply-To: <20150902201312.GA21475@google.com>
References: <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
 <55C4A695.7060608@nod.at> <e3d338cfd875b941061d5ac3da9f29c0@agner.ch>
 <55CAF568.5090704@nod.at> <812d355821f585decf92a66628caef7b@agner.ch>
 <20150901014315.GF81844@google.com>
 <f3a5ff1f82ee358541125b920460c17a@agner.ch>
 <20150902201312.GA21475@google.com>
Message-ID: <7e389b47a409181ae554bd300602b553@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-09-02 13:13, Brian Norris wrote:
> On Wed, Sep 02, 2015 at 12:58:08PM -0700, Stefan Agner wrote:
> In case I didn't mention it already, I'm taking a closer look at Boris'
> approach for this series:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-August/061361.html
> 
> but your driver looks like a good candidate for using
> nand_check_erased_ecc_chunk(), once we've agreed. Depenending on the
> order of acceptance, I might like to get your driver converted either
> before or after merging it. Shouldn't be too hard, though, as your
> implementation looks very similar right now.

Sure, can update my driver if the common implementations lands in the
MTD tree before the driver.

Otherwise, I just will send a follow up patch afterwards.

--
Stefan
