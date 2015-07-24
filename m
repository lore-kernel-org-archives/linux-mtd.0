Received: from mail-bn1on0628.outbound.protection.outlook.com
 ([2a01:111:f400:fc10::628] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIfdo-0000v0-TQ
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 16:16:10 +0000
Message-ID: <55B263D1.8080506@opensource.altera.com>
Date: Fri, 24 Jul 2015 11:12:01 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: <linux-mtd@lists.infradead.org>, Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH V4 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1427117782-14764-1-git-send-email-grmoore@opensource.altera.com>
 <201507241445.07988.marex@denx.de>
In-Reply-To: <201507241445.07988.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/24/2015 07:45 AM, Marek Vasut wrote:
> On Monday, March 23, 2015 at 02:36:21 PM, Graham Moore wrote:
>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>> ---
>> V2: Add cdns prefix to driver-specific bindings.
>> V3: Use existing property "is-decoded-cs" instead of creating a duplicate,
>> "ext-decoder".  Timing parameters are in nanoseconds, not master reference
>> clocks.  Remove bus-num completely.
>
> Hi!
>
> do you plan to continue on this driver any soon? If not, I'd like to take
> over the mainlining if you're not opposed. I'd like to see this in mainline
> soon.
>

I don't have a problem with you taking over the mainlining.  I've been 
stalled on the micron quad protocol issue that Cyrille Pitchen has solved.

> btw you'll need some kind of a variation on the attached two patches in
> the next iteration.
>

I have a V5 with fixes for sparse and smatch issues.  Do you want me to 
post it and you add those two patches?  Alternatively I can incorporate 
them into my V5.

Best regards,
Graham

> Best regards,
> Marek Vasut
>
