Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aweqn-0007zv-PW
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 10:04:09 +0000
Message-ID: <403F15FF.5010307@arcom.com>
Date: Fri, 27 Feb 2004 10:03:43 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <3236F92B82933347807DFF6A8BA632802133B9@wcosmb04.cos.agilent.com>
In-Reply-To: <3236F92B82933347807DFF6A8BA632802133B9@wcosmb04.cos.agilent.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Why CFI_DEVICETYPE_X8 in cfi_send_gen_cmd()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Could you please explain why the cfi->addr_unlock1 is 0x1555 in the
> case of CFI_DEVICETYPE_X32?

Nope. I can't.  No 32 bit chips here.  It looks wrong to me though.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
