Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vzxu-00049u-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 12:11:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AF3414F.967F95DF@mvista.com> 
References: <3AF3414F.967F95DF@mvista.com>  <617933180D08D311AB500090273F1F96016767DE@storm.corp.directvbroadband.net> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: "Fry, Dan" <dfry@bb.directv.com>, linux-mtd@lists.infradead.org
Subject: Re: Improper Command Sequence 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 May 2001 12:11:27 +0100
Message-ID: <2053.989061087@redhat.com>
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

ahennessy@mvista.com said:
> > Chip reports improper command sequence: status 0xa800a8

> a800a8 looks like the error status for low programming voltage detected -
> you need to add some code to handle set_vpp (and unset_vpp) for your board.

Bah. And I need to fix the blinkin' error reporting so it prints the 
correct message.

-		if (chipstatus & 0x30) {
+		if ((chipstatus & 0x30) == 0x30) {
 			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%x\n", status);



--
dwmw2
