Received: from li271-223.members.linode.com ([178.79.152.223]
 helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhP8a-0007sX-4D
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 21:42:08 +0000
Message-ID: <560C5718.2070603@mleia.com>
Date: Thu, 01 Oct 2015 00:41:44 +0300
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH 1/5] mtd: nand: lpc32xx_slc: fix calculation of timing
 arcs from given values
References: <1443458338-23552-1-git-send-email-vz@mleia.com>
 <20150930211253.GK143959@google.com> <20150930211358.GL143959@google.com>
In-Reply-To: <20150930211358.GL143959@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01.10.2015 00:13, Brian Norris wrote:
> (snip patch)
> 
> Also, why [PATCH 1/5]? I don't see the other 4.
> 

Sorry for confusion, this is a leftover from my local series of various
fixes, only this one patch is addressed to MTD. If you want, I can
resend the change removing 1/5.

--
With best wishes,
Vladimir
