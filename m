Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18CdL5-0000yX-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2002 10:04:39 +0000
Date: Fri, 15 Nov 2002 11:34:38 +0100
From: Frank Neuber <neuber@convergence.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: cmdline.c file name collision
Message-ID: <20021115103438.GA17779@jupiter>
References: <D99C1FB421989A40818B6370E3187094040A3ABD@tayexc19.americas.cpqcorp.net> <200211150849.gAF8nVs02462@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200211150849.gAF8nVs02462@dagobert.svc.sysgo.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, Nov 15, 2002 at 10:56:44AM +0100, Robert Kaiser wrote:
> Am Donnerstag, 14. November 2002 23:39 schrieb Hicks, Jamey:
> > I've renamed my copy to
> > cmdlinepart.c in the handhelds.org CVS repository, but I have not done so
> > on the MTD repository.  If no one objects, I will add cmdlinepart.c and
> > remove cmdline.c in the infradead cvs.
> 
> Why not mtdcmdline.c ? I think it is more important to have the name indicate 
> the subsystem this file belongs to. The fact that it deals with partitions is 
> IMHO of minor importance (and might even change in the future).
Yes I agree with you. I use the mtdcmdline.c also to pass the physical map_info.

 Frank
-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
