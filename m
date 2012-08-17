Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Mga-00051c-AE
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 13:34:01 +0000
Date: Fri, 17 Aug 2012 15:33:48 +0200
From: Richard Weinberger <richard@nod.at>
To: artem.bityutskiy@linux.intel.com, nyoushchenko@mvista.com
Subject: Re: UBI fastmap updates
Message-ID: <20120817153348.7a0a50a0@spider.haslach.nod.at>
In-Reply-To: <1345209115.27859.84.camel@sauron.fi.intel.com>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1345209115.27859.84.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Fri, 17 Aug 2012 16:11:55 +0300
schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
> We do not do anything like this in UBI because UBI does not need this,
> it does not have any complex data structures on the media.
> 
> With fastmap - I am unsure. I think it is not a problem, because
> probably you never append more data, you just re-write everything,
> right?

Yep, the on-flash fastmap is immutable.

Thanks,
//richard
