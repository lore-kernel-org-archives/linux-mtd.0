Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0p9R-0004bs-1Q
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 12:56:07 +0000
Subject: Re: UBIFS doesn't supper NFS
To: Rock Lee <rockdotlee@gmail.com>, linux-mtd@lists.infradead.org
References: <CAL-1w2t6kw0AW5d3LX2QAcXO7ow9zJ9DBPCAYJieByo0Y9yzqw@mail.gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <0334111a-86b8-4a65-adcb-de25b0d9eb68@nod.at>
Date: Wed, 19 Apr 2017 14:55:38 +0200
MIME-Version: 1.0
In-Reply-To: <CAL-1w2t6kw0AW5d3LX2QAcXO7ow9zJ9DBPCAYJieByo0Y9yzqw@mail.gmail.com>
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

Hi!

Am 19.04.2017 um 14:52 schrieb Rock Lee:
> Hi,
> There is no s_export_op in the super block of UBIFS, that means UBIFS
> doesn't support NFS. But I noticed there are some patches try to sovle
> this problem, for example:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-May/047092.html
> 
> But why UBIFS is still not able to support NFS?

I did a series to support NFS:
https://lkml.org/lkml/2016/12/1/711

But hadn't the time so far to clean it up.
Maybe it lands in 4.13.

Thanks,
//richard
