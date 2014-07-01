Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1zmB-0002ca-SO
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 15:15:20 +0000
Message-ID: <1404227693.6841.129.camel@sauron.fi.intel.com>
Subject: Re: Does UBI still place a just-tortured block first in the free
 block list?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Tue, 01 Jul 2014 18:14:53 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A2F0B@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A2F0A@dekaexchange07.deka.local>
 <1404226404.6841.120.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A2F0B@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 Cale Surgen <csurgen@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-01 at 11:02 -0400, Atlant Schmidt wrote:
>   I guess I'll go find that tree and see how we might
>   change things so that a different block would win
>   the next election. Any suggestions?

What you say sounds like the problem is not in the PEB selection
algorithm. The problem is in the "bad/good" criteria that we use.

What you say is that currently UBI is unable to reliably tell whether a
PEB is good or bad. And instead of just marking a PEB as bad, we keep
try to re-use it.

If I got it right, then I'd suggest 2 solutions.

1. Improve the 'torture' function and make it work for your case. It
would not solve the problem in general, but would solve your problem.

2. Try to detect situations when a PEB is tortured "too often". I am not
sure how to do this reliably, though, but may be you can invent
something. I guess the right way is to introduce a counter and store it
in the EC header. We have plenty of unused space there.

-- 
Best Regards,
Artem Bityutskiy
