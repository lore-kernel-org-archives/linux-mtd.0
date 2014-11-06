Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmIFP-0006NA-5G
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 08:16:51 +0000
Message-ID: <545B2E5C.7030809@nod.at>
Date: Thu, 06 Nov 2014 09:16:28 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: The future of ubi_assert()
References: <545A9E6E.3000208@nod.at>	
 <1415258504.958.151.camel@sauron.fi.intel.com> <545B2C30.2010206@nod.at>
 <1415261634.958.175.camel@sauron.fi.intel.com>
In-Reply-To: <1415261634.958.175.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.11.2014 um 09:13 schrieb Artem Bityutskiy:
> On Thu, 2014-11-06 at 09:07 +0100, Richard Weinberger wrote:
>> I think we can do better.
>> Think of wl.c, if an ubi_assert() in wl.c does not hold, we can put the UBI device
>> into read-only mode and continue execution.
>> BUG_ON() would be too much and WARN_ON() would lead to data corruption as the execution
>> would go on...
>> Something like ext4's errors=remount-ro. :)
> 
> If you are willing to do the work, and if it is needed, and actually
> tested, sure.

Of course I will.
During fastmap development I ran into basically every ubi_assert() and
had to find out whether it is useful or not.^^

Thanks,
//richard
