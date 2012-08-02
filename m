Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwwkT-0003nb-Ow
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 14:51:38 +0000
Date: Thu, 2 Aug 2012 16:51:32 +0200
From: Richard Weinberger <richard@nod.at>
To: artem.bityutskiy@linux.intel.com
Subject: Re: UBI fastmap updates
Message-ID: <20120802165132.1bf1e5d7@spider.haslach.nod.at>
In-Reply-To: <1343917741.25013.114.camel@sauron.fi.intel.com>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343916747.25013.112.camel@sauron.fi.intel.com>
 <20120802161512.5ac7a303@spider.haslach.nod.at>
 <1343917741.25013.114.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Thu, 02 Aug 2012 17:29:01 +0300
schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:

> On Thu, 2012-08-02 at 16:15 +0200, Richard Weinberger wrote:
> > > If I understand correctly, it can be only because of a bug. If I
> > > am correct, could you please add a 'dump_stack()' to improve the
> > > error report?
> > > 
> > 
> > This can happen if all PEBs are used and fastmap is unable to find
> > (or produce) an empty one.
> 
> In which situations is this possible? Could you please give an
> example?
> 

Every time fastmap writes a new fastmap to the flash it tries to get a
new PEB and returns the old one (used for the old fastmap) back to the
WL sub-system.
If no free PEBs are available (E.g Volume is full or the erase worker
is too slow) ubi_wl_get_fm_peb() returns NULL and fastmap reuses the
currently used PEB.
In this situation ubi_wl_get_fm_peb() may trigger such an error message.
If think we should get rid of the message as this is not an error
condition. It's a well known execution path.
The only bad thing that happens in such a situation is that a PEB gets
reused.

BTW: Which version of fastmap are you testing?

Thanks,
//richard
