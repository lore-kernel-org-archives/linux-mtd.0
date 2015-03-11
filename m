Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVcSj-0006nE-7j
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 08:57:58 +0000
Message-ID: <5500037A.9010509@nod.at>
Date: Wed, 11 Mar 2015 09:57:30 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: RFC: detect and manage power cut on MLC NAND
References: <54FEDC42.2060407@dave-tech.it>	
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com>
In-Reply-To: <1426058414.1567.2.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 11.03.2015 um 08:20 schrieb Artem Bityutskiy:
> On Tue, 2015-03-10 at 13:51 +0100, Richard Weinberger wrote:
>>> WDYT about this?
>>> If it sounds reasonable is there any suggestion where to place such a code?
>>
>> Customers often use DYI uninterruptible power supplies using capacitors.
>> But managing a power cut is the least problem you have with MLC NAND.
> 
> Why is it the least problem, what is the hardest one? I thought this one
> is the hardest.

IMHO the hardest ones are the problems we don't know yet as NAND vendors
are not really chatty about the MLC constraints.
We don't know much about data retention for example. At least we have not
much hard facts. Most of our knowledge is hearsay.

What I wanted to say is that soldering a big capacitor onto your board
will not make MLC NAND magically work perfectly fine. :-)

Thanks,
//richard
