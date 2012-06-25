Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjDLc-00038b-FL
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 17:45:12 +0000
Message-ID: <4FE8A39B.6060409@newsguy.com>
Date: Mon, 25 Jun 2012 10:44:59 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
 <1339054570.6875.84.camel@sauron.fi.intel.com> <4FD0E632.2080905@newsguy.com>
 <20120610100839.1f0ff1fe@pixies.home.jungo.com>
 <CAN8TOE90sB0-ZHZPX4+ASUDBCSRHgumVqDu0BOrcphyijm6Xgw@mail.gmail.com>
In-Reply-To: <CAN8TOE90sB0-ZHZPX4+ASUDBCSRHgumVqDu0BOrcphyijm6Xgw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, dwmw2@infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/22/2012 01:39 PM, Brian Norris wrote:
> On Sun, Jun 10, 2012 at 12:08 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
>> To summarize, return value of the 'mtd_read_oob()' API is
>> inconsistent (sometimes max_bitflips, other times EUCLEAN), and does not
>> adhere to return code policy of 'mtd_read()' - return EUCLEAN to the users,
>> they're not interested with internals such as max_bitflips.
>>
>> This might affect users of 'mtd_read_oob()' which might falsely think
>> the OOB read has failed.
>>
>> Mike, care to take a look and amend if necessary?
>> I think this needs to be fixed pre v3.5 as well.
> 
> Mike, are you planning on handling this?
> 
> I think it would be safe to basically C&P the max_bitflips code from
> mtd_read() into mtd_read_oob(). This would simply pass through the
> EUCLEAN that may be returned for OOB-only case (only for my driver?),
> and it would translate the 'ret_code > 0' case properly for data+OOB
> reads. I'll resend officially if this looks OK. Or I'll defer to Mike
> if he's working on this.


I'm sorry Brian, I missed Shmulik's post and thought this issue was put to bed
with the patch that initialized bitflip_threshold before the nand_scan_tail()
call.

I will take a look at your patch set that addresses this.  Sorry for dropping
the ball.

Mike
