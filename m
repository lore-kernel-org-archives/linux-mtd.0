Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3NjB-0006P4-5E
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2018 15:20:25 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 05/15] mtd: nand: pxa3xx: remove the dmaengine compat need
References: <20180402142656.26815-1-robert.jarzmik@free.fr>
 <20180402142656.26815-6-robert.jarzmik@free.fr>
 <20180403093336.6748bd3a@xps13>
Date: Tue, 03 Apr 2018 17:19:51 +0200
In-Reply-To: <20180403093336.6748bd3a@xps13> (Miquel Raynal's message of "Tue,
 3 Apr 2018 09:33:36 +0200")
Message-ID: <87po3g48rs.fsf@belgarion.home>
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

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> Hi Robert,
>
> On Mon,  2 Apr 2018 16:26:46 +0200, Robert Jarzmik
> <robert.jarzmik@free.fr> wrote:
>
>> From: Robert Jarzmik <robert.jarzmik@renault.com>
>> 
>> As the pxa architecture switched towards the dmaengine slave map, the
>> old compatibility mechanism to acquire the dma requestor line number and
>> priority are not needed anymore.
>> 
>> This patch simplifies the dma resource acquisition, using the more
>> generic function dma_request_slave_channel().
>> 
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> ---
>>  drivers/mtd/nand/pxa3xx_nand.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> This file has been "replaced" by marvell_nand.c in mtd/next. Once -rc1
> will be out, could you do the same change in that file?
Of course, that serie is 6 months old now ... I'll amend it accordingly :)

Cheers.

-- 
Robert
