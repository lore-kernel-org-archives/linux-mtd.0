Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEPrf-0006qG-Bw
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2012 19:23:16 +0000
Message-ID: <1348086179.12749.3.camel@dinh-ubuntu>
Subject: Re: nand/denali: Enable DT for Denali NAND controller
From: Dinh Nguyen <dinguyen@altera.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Wed, 19 Sep 2012 14:22:59 -0600
In-Reply-To: <20120919152913.GA19801@page>
References: <1348011095.25236.15.camel@dinh-ubuntu>
 <20120919152913.GA19801@page>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: ZY - pavel <pavel@denx.de>, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jamie,

On Wed, 2012-09-19 at 16:29 +0100, Jamie Iles wrote:
> Hi Dinh,
> 
> On Tue, Sep 18, 2012 at 05:31:35PM -0600, Dinh Nguyen wrote:
> > It appears that the denali NAND driver has not been enabled for DT yet.
> > Do you know if there is still an interest in doing that and if I can
> > help in anyway? I have a strong interest in converting the denali NAND
> > driver to be DT capable.
> 
> I no longer have access to a platform with the Denali controller so it's 
> not something I'd work on personally, but I can imagine that this would 
> still be the correct thing to do.

Ok, I'll take a crack at it since I have to enable it for mach-socfpga.
I guess the correct step is to make the whole driver DT only per David's
comment on the original patch.

Dinh
> 
> Thanks,
> 
> Jamie
> 
