Received: from mail14.messagelabs.com ([212.125.75.19])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AVv8K-0007X0-UA
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2003 15:59:45 +0000
Message-ID: <3FDDD939.8030302@arcom.com>
Date: Mon, 15 Dec 2003 15:54:33 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Linux MTD List <linux-mtd@lists.infradead.org>
References: <3FD998F6.9000303@arcom.com>
In-Reply-To: <3FD998F6.9000303@arcom.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: cfi_cmdset_0002 -- erase suspends broken.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +			if (((oldstatus ^ status) & dq6) != dq6)

This should be
     if (((oldstatus ^ status) & dq6) == 0)
to account for interleaved chips (not that mine are). (Thanks Steve Wohl).

The problem with the occasional bit errors appears to only occur when 
the erase is suspended for a write so I've temporarily disabled that.

It also appears to not be toggle/status bits as the flash reads the same 
after a hard reset.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs Email
Security System. For more information on a proactive email security
service working around the clock, around the globe, visit
http://www.messagelabs.com
________________________________________________________________________
