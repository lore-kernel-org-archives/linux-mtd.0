Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1At7Rc-0004z7-AR
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2004 15:47:32 +0000
Message-ID: <40323792.3050209@arcom.com>
Date: Tue, 17 Feb 2004 15:47:30 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <4030D2AB.7010002@arcom.com>
In-Reply-To: <4030D2AB.7010002@arcom.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: CFI command set 0002 (AMD/Fujitsu) work.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:
> 
> I'm currently working on cfi_cmdset_0002.c to get erase-suspend-program 
> working.

Erase-suspend-program is still disabled...

> So far I've taken all the chip status checking code and 
> refactored it into a single function -- it was all a bit of a mess.

This has been done and checked into CVS.  I believe I haven't broken 
anything.  Users of interleaved AMD chips may wish to check I didn't 
miss anything.

> 1. There's a fair amount of crap related to very broken SST chips (all 
> the stuff for retrying commands). I'd suggest removing this stuff from 
> cfi_cmdset_0002.c.

This has now been removed from CVS.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
