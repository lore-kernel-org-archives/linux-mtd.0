Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQyPM-00062I-T1
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 15:32:22 +0000
Subject: Re: [PATCH v2 2/2] UBI: Make mtd parameter readable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
 <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
 <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
 <1484056111.2133.16.camel@linux.intel.com>
 <71c71f00-dcb1-081b-ec55-bc7c39ad32d5@nod.at>
 <1484057496.2133.18.camel@linux.intel.com>
 <adfd384d-edb7-1255-f614-174a6793a2a8@nod.at>
 <1484058912.2133.22.camel@linux.intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <da5b6bae-8416-45ac-5153-d1a479715793@nod.at>
Date: Tue, 10 Jan 2017 16:31:56 +0100
MIME-Version: 1.0
In-Reply-To: <1484058912.2133.22.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy,

Am 10.01.2017 um 15:35 schrieb Andy Shevchenko:
>> Did you check? Do other drivers in the kernel that have a parser
>> behind a non-trivial
>> module parameter also expose it to user space?
> 
> Just checked. The only one which is not, this one.
> 

That's an excellent reason. :-)
But I see also:
mtd/devices/phram.c:module_param_call(phram, phram_param_call, NULL, NULL, 000);

If these two are the only users of 000, let's rip them out to be consistent
with the rest of the kernel.

Thanks,
//richard
