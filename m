Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H3Rj-0000SZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 14:08:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E15H3C2-0005qS-00@the-village.bc.nu> 
References: <E15H3C2-0005qS-00@the-village.bc.nu> 
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: sjhill@cotw.com, adam@yggdrasil.com (Adam J. Richter),
    linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: linux-2.4.6-pre8/drivers/mtd/nand/spia.c: undefined symbols 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Jul 2001 14:14:23 +0100
Message-ID: <28944.994079663@redhat.com>
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

alan@lxorguk.ukuu.org.uk said:
>  So the Config.in is wrong since I can select spia on x86 

Yep. I've added a few more dependencies like that to the map drivers too. I
heard rumours that someone else had done similar changes, but nobody sent me
a patch so those rumours can't be true.

I'll wait for Steven to fix this up and then send all those changes to
Linus.

Assuming, that is, that nobody else takes it upon themselves to keep
resending small bits of the pending changes, gratuitously making it harder
to me to keep in sync.

--
dwmw2
