Received: from gull.mail.pas.earthlink.net ([207.217.120.84] helo=gull.prod.itd.earthlink.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16aRAW-0000eO-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2002 00:51:36 +0000
Subject: RE: FW: M-SYS Doc Replacements
From: Russ Dill <Russ.Dill@asu.edu>
To: Chris Fowler <cfowler@outpostsentinel.com>
Cc: kira brown <kira@hex.linuxgrrls.org>, linux-mtd@lists.infradead.org
In-Reply-To: <NFBBLCEFBCFEPMJJKOIKMEBECDAA.cfowler@outpostsentinel.com>
References: <NFBBLCEFBCFEPMJJKOIKMEBECDAA.cfowler@outpostsentinel.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Feb 2002 18:13:19 -0700
Message-Id: <1013476401.5131.6.camel@timmy>
Mime-Version: 1.0
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

On Mon, 2002-02-11 at 17:58, Chris Fowler wrote:
> My problem is there is the kernel thread named 'msys/fla'  I can't seem to
> get the
> people at M-SYS to tell me what this thing is doing.  My DOC chip is *not*
> mounted.  In fact, I can rmmod
> the driver.  That shouldt ell you the flash is not in use.  But this thread
> keeps my load averages around 1.
> 
> If I 'rmmod doc' then my load averages drop to 0.06.  WWhat does this thread
> do to a flash
> that is not in use?

then use the MTD doc drivers instead, you can even use grub to boot the
thing
