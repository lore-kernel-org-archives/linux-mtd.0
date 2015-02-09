Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKjDr-0002Rr-3R
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 07:57:35 +0000
Message-ID: <54D86858.2070705@nod.at>
Date: Mon, 09 Feb 2015 08:57:12 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com, hujianyang <hujianyang@huawei.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>	
 <1423242166.8637.566.camel@sauron.fi.intel.com>	
 <54D81C9B.8070500@huawei.com> <1423468308.2573.4.camel@sauron.fi.intel.com>
In-Reply-To: <1423468308.2573.4.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.02.2015 um 08:51 schrieb Artem Bityutskiy:
> On Mon, 2015-02-09 at 10:34 +0800, hujianyang wrote:
>> Good suggestions. I will try to realize periodically commit first. But I
>> don't know if this feature is really needed. Switch to R/O and revert to
>> last comitted state? But we just consider about log before, never think
>> about index.
> 
> I think the right way to approach this problem is to come up with a high
> level summary of the problems we are trying to solve, and the solutions,
> along with some analysis of the solutions. This does not have to be very
> detailed, but it should put everyone involved into the same page.

Agreed. I fear we're talking about different things. :)

Thanks,
//richard
