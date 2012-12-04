Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TftnI-0006HC-7M
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 14:48:21 +0000
Date: Tue, 4 Dec 2012 15:48:06 +0100
From: Richard Weinberger <richard@nod.at>
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Subject: Re: UBI Fastmap fixes for 3.7
Message-ID: <20121204154806.140d1005@spider.haslach.nod.at>
In-Reply-To: <50BE0C7E.6000001@itwatchdogs.com>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <50BE0C7E.6000001@itwatchdogs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tue, 4 Dec 2012 08:45:18 -0600
schrieb Zach Sadecki <zsadecki@itwatchdogs.com>:

> On 12/03/2012 01:57 PM, Richard Weinberger wrote:
> > This patch series contains two brown-paper-bag-bugfixes.
> > I'm very sorry for them!
> >
> > [PATCH 1/2] ubi: Remove PEB from free tree in get_peb_for_wl()
> > This one fixes a very odd issue with fastmap disabled.
> > With fastmap disabled get_peb_for_wl() did not remove PEBs from
> > the free list. Therefore the free, used and scrub trees got
> > corrupted.
> >
> > [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in __wl_get_peb()
> > The issue fixed by that patch is also very nasty. I missed that
> > ubi_self_check_all_ff() can sleep. So, we cannot call it from
> > __wl_get_peb().
> >
> > Thanks,
> > //richard
> Thanks, guys.  An overnight test run has shown that these patches
> have fixed the UBI problems on my board.  Something else odd is
> happening, but that's for another thread...

Good to know.
Is the other issue also related to UBI?

Thanks,
//richard
