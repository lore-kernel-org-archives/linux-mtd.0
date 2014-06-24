Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzKbS-0007oh-Es
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 06:53:15 +0000
Message-ID: <53A92040.7020101@nod.at>
Date: Tue, 24 Jun 2014 08:52:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com, hs@denx.de
Subject: Re: UBI: fix rb_tree node comparison in add_map commit buggy?
References: <53A7EF04.7040805@denx.de> <53A809A3.30703@denx.de>	
 <53A82077.6090109@nod.at> <53A82609.9090408@denx.de>	
 <53A87AD5.8050305@nod.at> <1403585976.7903.70.camel@sauron.fi.intel.com>	
 <53A90BEE.5020209@denx.de> <1403587860.7903.82.camel@sauron.fi.intel.com>
In-Reply-To: <1403587860.7903.82.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.06.2014 07:31, schrieb Artem Bityutskiy:
> On Tue, 2014-06-24 at 07:26 +0200, Heiko Schocher wrote:
>> Hello Artem,
>>
>> Am 24.06.2014 06:59, schrieb Artem Bityutskiy:
>>> On Mon, 2014-06-23 at 21:07 +0200, Richard Weinberger wrote:
>>>> I think it would be better to "fix" the whole logic such that low volume ids go into
>>>> the left rb node instead of the right.
>>>> Just to avoid further confusion.
>>>> Artem, do you know why UBI does it the other way around for volume ids?
>>>
>>> I do not remember. Probably no particular reason.
>>>
>>> I'd suggest to do a quick fix first and submit to Linus for 3.16, and
>>> then people can do whatever logic streamlining for 3.17, makes sense?
>>
>> I posted such a patch, but for some reason, I could not find it in
>> http://lists.infradead.org/pipermail/linux-mtd/2014-June/date.html
>>
>> Here an extract from the header I got, as I was on Cc ...
>>
>> From: Heiko Schocher <hs@denx.de>
>> To: linux-mtd@lists.infradead.org
>> Cc: Heiko Schocher <hs@denx.de>,
>> 	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
>> 	Richard Weinberger <richard@nod.at>,
>> 	David Woodhouse <dwmw2@infradead.org>,
>> 	Brian Norris <computersforpeace@gmail.com>,
>> 	Mike Snitzer <snitzer@redhat.com>,
>> 	Wolfgang Denk <wd@denx.de>,
>> 	linux-kernel@vger.kernel.org
>> Subject: [PATCH] ubi: fix correct rb_tree node comparison in add_vol
>> Date: Mon, 23 Jun 2014 15:27:09 +0200
>> Message-Id: <1403530029-12151-1-git-send-email-hs@denx.de>
>> X-Mailer: git-send-email 1.8.3.1
> 
> I do not see it in my @linux.intel.com mailbox either, probably
> something went wrong on your side?

Same here.

Thanks,
//richard
