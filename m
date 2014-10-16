Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeiuM-0006qf-VC
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 11:07:51 +0000
Message-ID: <543FA6EB.1000602@nod.at>
Date: Thu, 16 Oct 2014 13:07:23 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>					
 <1412029248-22454-4-git-send-email-richard@nod.at>				
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>			
 <1413206263.7906.18.camel@sauron.fi.intel.com> <543BE21F.5020504@nod.at>		
 <1413213803.7906.45.camel@sauron.fi.intel.com> <543C3E60.4080507@nod.at>	
 <1413282203.7906.72.camel@sauron.fi.intel.com> <543F9895.7010502@nod.at>
 <1413454534.7906.156.camel@sauron.fi.intel.com>
In-Reply-To: <1413454534.7906.156.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.10.2014 um 12:15 schrieb Artem Bityutskiy:
> On Thu, 2014-10-16 at 12:06 +0200, Richard Weinberger wrote:
>> What I'm trying to say is, state tracking would solve the "internal state accessing" problem in a clean and
>> sane way.
> 
> Can you squeeze the stat to the lookup talbe? It contains pointers, so
> the last 2 bits could be used for the state.

IMHO this is beyond horrible. :)
The goal is the make things clean in terms of not accessing internal state
from fastmap.c. If the price for that is abusing pointers in magic ways
I'd say no.

Rather consider the fastmap-wl.c idea...

Thanks,
//richard
