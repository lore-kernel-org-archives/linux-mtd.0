Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdgYU-0007wM-JH
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 14:57:15 +0000
Message-ID: <551D58B2.2050302@nod.at>
Date: Thu, 02 Apr 2015 16:56:50 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
References: <1427984026-31100-1-git-send-email-richard@nod.at>	<CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>	<551D5352.8060305@nod.at>
 <CAOMZO5BpX0LHOmkPpsOHn+7x-VBzAnjuG0ed_n4OTe6_g0O2mQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BpX0LHOmkPpsOHn+7x-VBzAnjuG0ed_n4OTe6_g0O2mQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.04.2015 um 16:45 schrieb Fabio Estevam:
> On Thu, Apr 2, 2015 at 11:33 AM, Richard Weinberger <richard@nod.at> wrote:
> 
>> Why? Free()ing a NULL pointer is perfectly fine.
>> What did I miss? :)
> 
> If the first 'iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);' fails then
> you jump to the out label where you call 5 kfree() and then return the
> error.
> 
> It would be much better just to return the error immediately in this
> case and add one label for each allocation error, so that it only
> kfree the previous successful allocations.

It is not *much* better. It is just a matter of taste.

Thanks,
//richard
