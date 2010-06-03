Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKCXv-0005bD-1b
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 15:41:30 +0000
Received: by fxm15 with SMTP id 15so215366fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Jun 2010 08:41:13 -0700 (PDT)
Subject: Re: CRC error when mounting UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
	<1275575118.9729.2.camel@localhost.localdomain>
	<AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 03 Jun 2010 18:41:06 +0300
Message-Id: <1275579666.9729.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-03 at 17:14 +0200, Leo Barnes wrote:
> Hmm, ok. I would have thought the paranoid UBI checks would be able to
> find driver related problems. I have however now tried creating and
> mounting ubi/ubifs through nandsim on the device, so ubifs seems to be
> working well.
> 
> I have tried mtd_readtest on the driver which fails when I allow
> OOB-reads. Since the driver handles ECC in hardware and I dont need to
> read the OOB-data for the sake of UBI/UBIFS, this should be no
> problem. When removing the oob-reads from the test, it works
> perfectly.
> 
> You are probably right that what fails is unaligned/short reads, since
> this is exactly the functionality that I had to add to the driver.
> Does any of the mtd-tests test these kinds of reads? Might be a good
> addition if not.

Note, the ltp reads in UBI may be even from odd addresses - check that
your drive handles this properly.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
