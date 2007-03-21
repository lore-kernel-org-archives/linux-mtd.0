Received: from 81-174-11-161.f5.ngi.it ([81.174.11.161] helo=mail.enneenne.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU2QS-0004H7-UU
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 11:08:38 -0400
Date: Wed, 21 Mar 2007 16:09:00 +0100
From: Rodolfo Giometti <giometti@enneenne.com>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Message-ID: <20070321150900.GB4783@enneenne.com>
References: <20070319084410.GA3802@enneenne.com>
	<1174483538.3416.38.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1174483538.3416.38.camel@zod.rchland.ibm.com>
Subject: Re: supporting flash that powers up locked
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 21, 2007 at 08:25:38AM -0500, Josh Boyer wrote:

> You'd need to add a fixup to cfi_cmdset_0001.c for P30 to set that flag.
> See the fixup_use_amtel_lock function in cfi_cmdset_0002.c for an
> example.

Ok, that could resolve problem during boot but not during
suspend/resume cycle.

However I'm working on it and I'll propose a patch.

Thanks,

Rodolfo

-- 

GNU/Linux Solutions                  e-mail:    giometti@enneenne.com
Linux Device Driver                             giometti@gnudd.com
Embedded Systems                     		giometti@linux.it
UNIX programming                     phone:     +39 349 2432127
