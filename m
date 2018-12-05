Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUaRa-0006ja-9d
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 16:54:39 +0000
Date: Wed, 5 Dec 2018 17:54:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <alexandre.belloni@bootlin.com>, <richard@nod.at>,
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>,
 <alexander.sverdlin@nokia.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: Add the SNOR_F_4B_OPCODES flag
Message-ID: <20181205175426.5e0216c0@bbrezillon>
In-Reply-To: <20181205173254.15135002@bbrezillon>
References: <20181129144143.26079-1-boris.brezillon@bootlin.com>
 <20181129144143.26079-2-boris.brezillon@bootlin.com>
 <b6f66057-7b7c-8e9c-1a05-71bf6611ffaa@microchip.com>
 <20181205161902.0744f562@bbrezillon>
 <1f244544-7f85-fa28-afcd-d6b7fae192fe@microchip.com>
 <20181205170025.0ccb8837@bbrezillon>
 <7d581ee6-df1c-da98-5eba-0337ff51c101@microchip.com>
 <20181205173254.15135002@bbrezillon>
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

On Wed, 5 Dec 2018 17:32:54 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> > >>> smaller than 16MB, doesn't mean it does not support 4B opcodes. We
> > >>> probably won't use the 4B opcodes in that case, but still.
> > >>>       
> > >>
> > >> I agree that manufacturers have a sense of humor and this might be possible. But
> > >> there's no need to use 4B opcodes in this case, so a post_sfdp fixup will help
> > >> here too.    
> > > 
> > > Except there's nothing to fix in this case, we just won't use 4B
> > > opcodes if we don't need to, that's all.    
> > 
> > you'll have an extra byte of address that has a tiny impact on performance on
> > small requests. I see it as a fix, we should do what's best to do. anyway ...  
> 
> No, see the checks that are done in this patch: to use 4B_CODES the
> flag should be set and the NOR should be larger than 16MB. The flag
> does not mean "use 4B opcodes", it meas "4B opMcodes are supported".

Maybe I should rename the flag SNOR_F_SUPPORTS_4B_OPCODES to make it
clear.
