Received: from saturn.open-widgets.com ([209.251.101.200]
	helo=saturn.billgatliff.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj7E1-00005g-W8
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2004 01:32:10 +0000
Message-ID: <400DD613.80601@billgatliff.com>
Date: Tue, 20 Jan 2004 19:29:55 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: Dan Post <djp.mtd@onemyth.net>
References: <20040120215050.M62159@onemyth.net>
In-Reply-To: <20040120215050.M62159@onemyth.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Intel flash and cfi_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan:


I've seen similar behavior with the J flashes, see my posts from a 
couple of days ago.  My temporary workaround was to issue my own 0xff in 
my map driver functions.  :^(

I noticed the F0's, but didn't wade into the datasheet enough to spot 
that as an issue...


b.g.


Dan Post wrote:

>Hi,
>
>I was looking at the cfi_probe.c file, and noticed that there are numerous
>'0xF0' commands to flash (theoretically to put the flash back into read array
>mode).  This is incorrect in terms of Intel flash; according to the datasheets
>for L18/30 and K3/18, the "read array" command is 0xFF.
>
>Normally, it would work fine (by virtue of accident, the state machine is
>coherent enough not to break after the probe), except in cases of XIP (based
>on dwmw2's code, which I have been working on and will send out probably this
>week).  It breaks the system then because 0xF0 doesn't really put an Intel
>chip into read array, so when you enable intterupts, you schedule to a
>function running out of flash, which happens to be in status mode.... == big
>bad no-run, i.e. you freeze.
>
>(Specifically, it blows up on L*...  though it seemed to "work" on K*, that
>may just be an accident or compatibility mode that wasn't put into L*.  Or
>maybe I munged my code somehow and something magically changed.  It's not in
>the datasheets, so the behavior could change at any time.  When I changed the
>0xF0's to 0xFF's, it worked on L*.)
>
>I assume that the 0xF0 is for AMD flash (a datasheet I checked out confirms
>this).  For the cfi_probe.c file to be "proper", it needs to issue 0xFF to
>Intel flash, and 0xF0 for AMD.  (Any other chips using different commands??)
>
>What would happen if we issued an 0xF0;0xFF to an AMD chip?  Or 0xFF;0xF0? 
>Any AMD chip-heads care to answer?  It looks like it will "work" on Intel chips...
>
>At any rate, either there needs to be a clever hack like that, or the
>cfi_probe.c facilities need to be refactored so they know which command to
>issue to flash.
>
>Dan
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>  
>

-- 
Bill Gatliff
So what part of make clean all install do you not understand?
bgat@billgatliff.com
