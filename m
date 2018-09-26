Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5HDm-0002To-Lf
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2018 21:19:48 +0000
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
From: Daniel Mack <daniel@zonque.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
Message-ID: <75388de4-5892-042d-6174-d18cc1b14465@zonque.org>
Date: Wed, 26 Sep 2018 23:19:09 +0200
MIME-Version: 1.0
In-Reply-To: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
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

On 24/9/2018 8:45 AM, Daniel Mack wrote:
> I'm having issues using the new marvell_nand driver on a PXA3xx based
> platform. My test does a ubiformat on the chip, then creates a volume,
> mounts it and runs bonnie++ on the file system. After some time (usually
> less than half a minute), the driver spits out a warning like the one
> below, and eventually the UBI layer bails out, which leads to a r/o
> remount and (possibly) file system corruptions.

Okay, I think I figured it out. What happens is that after the 
controller has been sent a command to process it, it sets the RDY bits 
before the driver ends up in that marvell_nfc_wait_op(). Enabling the 
interrupt for RDY does not latch it if the RDY bit already set, so the 
condition wait times out. IOW, it's a race - the controller is faster 
than than the driver expects it to be.

I'll send a patch to fix that. With this applied, I wasn't able to 
reproduce the issue anymore. It could possibly be fixed by other means 
too, so I'm open for discussions and I can also test other approaches 
easily. Let me know what you think.


Thanks,
Daniel
