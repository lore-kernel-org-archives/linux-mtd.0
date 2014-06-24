Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzKbp-0007pl-Di
 for linux-mtd@lists.infradead.org; Tue, 24 Jun 2014 06:53:38 +0000
Message-ID: <53A92059.5080406@nod.at>
Date: Tue, 24 Jun 2014 08:53:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: UBI: fix rb_tree node comparison in add_map commit buggy?
References: <53A7EF04.7040805@denx.de> <53A809A3.30703@denx.de>	
 <53A82077.6090109@nod.at> <53A82609.9090408@denx.de>	
 <53A87AD5.8050305@nod.at> <1403585976.7903.70.camel@sauron.fi.intel.com>
In-Reply-To: <1403585976.7903.70.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hs@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.06.2014 06:59, schrieb Artem Bityutskiy:
> On Mon, 2014-06-23 at 21:07 +0200, Richard Weinberger wrote:
>> I think it would be better to "fix" the whole logic such that low volume ids go into
>> the left rb node instead of the right.
>> Just to avoid further confusion.
>> Artem, do you know why UBI does it the other way around for volume ids?
> 
> I do not remember. Probably no particular reason.
> 
> I'd suggest to do a quick fix first and submit to Linus for 3.16, and
> then people can do whatever logic streamlining for 3.17, makes sense?

Agreed!

Thanks,
//richard
