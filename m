Received: from 212-186-180-163.dynamic.surfer.at ([212.186.180.163]
 helo=cgate.sperl.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzjgh-0001sJ-3M
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 11:17:08 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <20151120110616.GR31303@sirena.org.uk>
Date: Fri, 20 Nov 2015 12:16:43 +0100
Cc: Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <1F46DA71-805C-4AC0-B230-B1369898C095@sperl.org>
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk> <20151120000746.GQ64635@google.com>
 <20151120110616.GR31303@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 20.11.2015, at 12:06, Mark Brown <broonie@kernel.org> wrote:
> 
> On Thu, Nov 19, 2015 at 04:07:46PM -0800, Brian Norris wrote:
> 
>> So for transfer size limitations, are you speaking of the same thing as
>> Heiner (who began this post mentioning *message* size limitations)? I
>> read a difference between the two, where a transfer size limitation
>> might mean that one could improve the SPI core to just split transfers
>> up into multiple sub-transfers, and still complete the whole
>> spi_message (and therefore the protocol driver has less to worry about).
>> But if we're talking about spi_message limitations, then this would be
>> more exposed to the protocol driver.
> 
> For almost all hardware these should be the same things - most drivers
> shouldn't be working in terms of messages, they should be working in
> terms of transferrs.  Anything that has to work at full message level
> almost certainly has substantial other limitations in place given the
> need to be able to change parameters arbatrarily in the middle of
> messages.

I will try to get a prototype out soon, so that we can talk actual code,
but for now I will leave out the automated core logic for transformations.

Martin
