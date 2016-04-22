Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atfh7-0002pA-B4
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 18:20:46 +0000
Subject: Re: Pass -EUCLEN to userspace?
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20160420132516.GC31101@pengutronix.de>
 <20160422172456.7aaf301c@bbrezillon> <20160422172802.4fa830d1@bbrezillon>
 <571A47D3.6040602@nod.at> <20160422181103.3691112a@bbrezillon>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Daniel Walter <dwalter@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <571A6B64.9000600@nod.at>
Date: Fri, 22 Apr 2016 20:20:20 +0200
MIME-Version: 1.0
In-Reply-To: <20160422181103.3691112a@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.04.2016 um 18:11 schrieb Boris Brezillon:
>> Sasha, what exactly is your use case and why is the UBI approach not sufficient for you?
>> On Linux MTD access should only happen through UBI and UBOOT/SPL partitions stay untouched.
> 
> Fair enough. So all we'll need is a way to retrieve the maximum number
> of bitflips for a given block, so that the userspace deamon can
> periodically read the SPL and bootloader blocks and decide to scrub
> those blocks if the number of bitflips exceed the threshold.

How can we scrub non-UBI blocks in a power cut safe way?
Unless we have a backup SPL/booloader.

Thanks,
//richard
