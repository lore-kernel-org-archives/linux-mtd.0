Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG6CH-0006O8-0o
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 12:24:18 +0000
Date: Wed, 19 Feb 2014 19:40:41 +0800
From: Huang Shijie <b32955@freescale.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH resend] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Message-ID: <20140219114039.GA1798@shlinux2.ap.freescale.net>
References: <1392365295-19299-1-git-send-email-b32955@freescale.com>
 <1392369532.12215.61.camel@sauron.fi.intel.com>
 <20140214091148.GA30044@shlinux2.ap.freescale.net>
 <1392376974.12215.78.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1392376974.12215.78.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 01:22:54PM +0200, Artem Bityutskiy wrote:
> On Fri, 2014-02-14 at 17:11 +0800, Huang Shijie wrote:
> > But if we do not have any _slave_ partitions, we will only have one
> > master partition.
> > and the numeraseregions is kept. this is the case i meet.
> 
> Why you prefer to change UBI instead of changing MTD so that master
> partitions with no slave partitions would have numeraseregions=0.

the master partition's numeraseregions is get from the code, such as
cfi_amdstd_setup. In other word, the numeraseregions is get from the
probe.

i do not think change the MTD is a good idea.

> 
> And frankly, I did not clearly understand your answer.
sorry.

> 
> And what erase regions have to do with master/slave?
> 
> Correct me if I am wrong below.
> 
> The erase region concept belongs to the flash chip. Some chips have
> special regions, for some special purposes, and these, typically small,
> regions have a bit different geometry.
agree.

> 
> Master/slave is a purely software concept. I never clearly understood
> the model, but this is something related to partitions. We have a master
> MTD device representing the entire chip, and slave MTD devices
> representing partitions.
The slave is purely software concept.

But the master has some information from the chip, as you said, such as
the numeraseregions, the size of the flash.


thanks
Huang Shijie
