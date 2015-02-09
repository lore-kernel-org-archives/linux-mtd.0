Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKmpa-0000rR-VB
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 11:48:47 +0000
Message-ID: <54D89E87.2060601@nod.at>
Date: Mon, 09 Feb 2015 12:48:23 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>				
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>			
 <1423243571.8637.579.camel@sauron.fi.intel.com> <54D4FAFD.9000009@nod.at>		
 <1423244437.8637.587.camel@sauron.fi.intel.com> <54D4FD5C.1040909@nod.at>		
 <54D822B0.8020605@huawei.com> <54D86819.90803@nod.at>	
 <1423470384.2573.18.camel@sauron.fi.intel.com> <54D89420.7060109@nod.at>
 <1423481807.2573.56.camel@sauron.fi.intel.com>
In-Reply-To: <1423481807.2573.56.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Steve deRosier <derosier@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.02.2015 um 12:36 schrieb Artem Bityutskiy:
> Richard,
> 
> On Mon, 2015-02-09 at 12:04 +0100, Richard Weinberger wrote:
>> My points are:
>> - If UBIFS can do a better job in dealing with corruptions, fix/improve it.
> 
> Right.
> 
>> - Having a debugfs/fsck would be a good tool for people like me that have to analyze/fix UBI/UBIFS failures.
> 
> Right. I think no one denies this. Correct, and I agree on this.
> 
>> - Having an UBIFS "force" mode *will* be abused in horrid ways.
> 
> I did not see anyone suggesting this. Was this suggested?
> 
> As I read it, Steve just expressed a high-level user standpoint: the
> more you can do without external tools the better. I did not see him
> suggesting "just mount at any price".

It was not directly suggested by Steve, sorry if I was not clear about that!
I get such requests rather often from customers and therefore I'm sick of explaining
why this is a bad idea and quite nervous because most of the time vendors try to hide
issues in their software stack when they ask for such an option.

That said, if we define clearly in which situations UBIFS can safely mount R/O I'm happy.
But please make this new mount option opt-in and disabled by default.

Thanks,
//richard
