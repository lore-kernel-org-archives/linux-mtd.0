Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Asjfy-0002At-05
	for linux-mtd@lists.infradead.org; Mon, 16 Feb 2004 14:24:46 +0000
Message-ID: <4030D2AB.7010002@arcom.com>
Date: Mon, 16 Feb 2004 14:24:43 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: CFI command set 0002 (AMD/Fujitsu) work.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently working on cfi_cmdset_0002.c to get erase-suspend-program 
working.  So far I've taken all the chip status checking code and 
refactored it into a single function -- it was all a bit of a mess.

A couple of questions:

1. There's a fair amount of crap related to very broken SST chips (all 
the stuff for retrying commands).  a) This is mess and appears only 
applicable to a very few number of chips; b) I'm not sure it would even 
work if talking to the chip is broken then retrying a few times won't 
guarantee it will work.  I'd suggest removing this stuff from 
cfi_cmdset_0002.c.  Clearly the SST chips aren't compliant even though 
they claim to be.  Thoughts?

2. The "fast programming" feature (unlock bypass) which is currently 
always disabled (due to "code brokeness"). I don't believe this will 
ever work with erase-suspends.  Should the "fast programming" stuff be 
removed?

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
