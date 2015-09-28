Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgTFQ-0003hX-0G
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 07:53:20 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: switch to dmaengine
References: <1441545167-23383-1-git-send-email-robert.jarzmik@free.fr>
 <20150928001856.GB34421@google.com>
 <20150928004922.GA75400@google.com>
Date: Mon, 28 Sep 2015 09:47:48 +0200
In-Reply-To: <20150928004922.GA75400@google.com> (Brian Norris's message of
 "Sun, 27 Sep 2015 17:49:22 -0700")
Message-ID: <87y4frdly3.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> On Sun, Sep 27, 2015 at 05:18:56PM -0700, Brian Norris wrote:
>> Sparse has one complaint, but I have no others:
>> 
>> On Sun, Sep 06, 2015 at 03:12:47PM +0200, Robert Jarzmik wrote:
>> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> > index 2f39bfe34584..1e9d462065e8 100644
>> > --- a/drivers/mtd/nand/pxa3xx_nand.c
>> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> > @@ -15,7 +15,9 @@
>> ...
>> > @@ -564,57 +567,61 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
>> [...]
>> > +static void start_data_dma(struct pxa3xx_nand_info *info)
>> > +{
>> > +	enum dma_data_direction direction;
>> 
>> I think this should be dma_transfer_direction. See warning below.
>
> I just fixed this up and pushed to l2-mtd.git. I can revert and apply
> something different if you'd like.
Thanks, your fix is perfectly correct.

Cheers.

-- 
Robert
