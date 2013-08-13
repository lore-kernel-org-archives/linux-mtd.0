Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V98DL-00071W-1Y
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 06:36:19 +0000
Date: Tue, 13 Aug 2013 09:35:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [patch] mtd: nand: silence some shift wrap warnings
Message-ID: <20130813063533.GP5502@mwanda>
References: <20130809094904.GC29282@elgon.mountain>
 <5209D0C6.5070307@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5209D0C6.5070307@freescale.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 13, 2013 at 02:23:02PM +0800, Huang Shijie wrote:
> 于 2013年08月09日 17:49, Dan Carpenter 写道:
> >There are static checkers which complain when we declare variables as
> 
> could you tell me which "checker" and how do you test it?
> 
> you'd better post the warning message here.
> 

It's some stuff I'm working on but haven't released yet.  But "len"
and "ofs" are declared as u64 and loff_t.  If they were declared as
unsigned long then maybe the current code would be fine because the
code would be correct-ish on 32 bit arches.

So this is definitely the right thing to do.

regards,
dan carpenter
