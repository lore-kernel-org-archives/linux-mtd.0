Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqV0h-0000oz-GV
 for linux-mtd@lists.infradead.org; Sun, 15 Jul 2012 20:01:45 +0000
Message-ID: <50032194.9040703@newsguy.com>
Date: Sun, 15 Jul 2012 13:01:24 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
 <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
In-Reply-To: <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/13/2012 10:39 AM, Brian Norris wrote:
> 
> I have an out-of-tree driver that corrects OOB bitflips. Is there
> really no other HW out there that corrects OOB errors?


The diskonchip g3 and g4 devices use a hw-generated hamming byte to protect the
first eight oob bytes (those not used for page data ecc) with ecc of one bit
strength, but neither driver implements the correcting algorithm yet.


> 
> Anyway, I understand that my driver is an outlier here, but I don't
> see a real disadvantage in these changes. But on the positive side, I
> expect that in the future, more drivers/HW will either want to stop
> using OOB for anything at all or will want ECC protection for OOB.
> 
>> This can also work when nand_do_read_ops is used (ops->datbuf != NULL). But it
>> is hard to see case where it can correct bit flip in bad block marker. Do you
>> have any exemple ?
> 
> First of all, this has no effect if the driver does not protect OOB
> with ECC (i.e., for OOB-only reads, MTD_OPS_PLACE_OOB == MTD_OPS_RAW).
> So the following argument only applies when OOB is ECC-protected.
> 
> Consider a *good* block that is written with filesystem data. On
> bootup, Linux may scan this block's BBM to check if it is bad. If a
> bitflip occurs in the bad block marker, then it may be erroneously
> considered bad.


Yeah, this is a strong argument for ecc on oob-only reads.

Thanks,
Mike
