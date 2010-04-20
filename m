Date: Mon, 19 Apr 2010 21:58:37 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [Bug #15729] BUG: physmap modprobe & rmmod
Message-Id: <20100419215837.d4a9b01d.randy.dunlap@oracle.com>
In-Reply-To: <20100420045301.GF19957@pengutronix.de>
References: <deuQKFRcc0B.A.3EG.BRSzLB@tosh> <YeFfFNFyTSF.A.MFH.fRSzLB@tosh>
	<20100420045301.GF19957@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>, hsweeten@visionengravers.com,
	linux-mtd@lists.infradead.org,
	Kernel Testers List <kernel-testers@vger.kernel.org>,
	dwmw2@infradead.org, Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Apr 2010 06:53:01 +0200 Wolfram Sang wrote:

> On Tue, Apr 20, 2010 at 05:19:23AM +0200, Rafael J. Wysocki wrote:
> > This message has been generated automatically as a part of a summary report
> > of recent regressions.
> > 
> > The following bug entry is on the current list of known regressions
> > from 2.6.33.  Please verify if it still should be listed and let the tracking team
> > know (either way).
> > 
> > 
> > Bug-Entry	: http://bugzilla.kernel.org/show_bug.cgi?id=15729
> > Subject		: BUG: physmap modprobe & rmmod
> > Submitter	: Randy Dunlap <randy.dunlap@oracle.com>
> > Date		: 2010-04-02 20:40 (18 days old)
> > Message-ID	: <20100402134058.c4682716.randy.dunlap@oracle.com>
> > References	: http://marc.info/?l=linux-kernel&m=127024096210230&w=2
> 
> Patch is here:
> 
> 	https://patchwork.kernel.org/patch/90497/

Thanks.

> I'd ack it if I still had the original mail :)

I already replied with
Tested-by: Randy Dunlap <randy.dunlap@oracle.com>

> CCing linux-mtd and some more people, so it can get picked up.


---
~Randy
