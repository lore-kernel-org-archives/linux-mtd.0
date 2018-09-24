Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4M0c-0006M2-Ik
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 08:14:24 +0000
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
 <20180924092031.3d4af408@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <24c76ef6-76fe-0737-4063-c9842a4ac010@zonque.org>
Date: Mon, 24 Sep 2018 10:14:09 +0200
MIME-Version: 1.0
In-Reply-To: <20180924092031.3d4af408@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On 24/9/2018 9:20 AM, Miquel Raynal wrote:
> Daniel Mack <daniel@zonque.org> wrote on Mon, 24 Sep 2018 08:45:44 
> +0200:
>> I'm having issues using the new marvell_nand driver on a PXA3xx
>> based platform. My test does a ubiformat on the chip, then creates
>> a volume, mounts it and runs bonnie++ on the file system. After
>> some time (usually less than half a minute), the driver spits out a
>> warning like the one below, and eventually the UBI layer bails out,
>> which leads to a r/o remount and (possibly) file system
>> corruptions.
>> 

[...]

> Interesting, thanks for the feedback.
> 
> Right now I have no idea of what happens, but you might want to add
> a dump_stack() at the "Timeout waiting for RB signal" error to see
> what path in the driver failed.

Sure, will do that tonight.

> You might also try with and without DMA?

I did that, and disabling DMA didn't help.

> I'll try to take the time this week to check if it is pxa-related by 
> testing this on an armada board.

That'd help, yes.


Thanks,
Daniel
