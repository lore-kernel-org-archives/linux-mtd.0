Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T1nV-0007V5-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 14:21:13 +0000
Received: from aminocom.com (eclarke.aminocom.com [10.171.23.32])
	by aminocom.com (8.11.6/8.11.6) with ESMTP id g0MEWG810711
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 14:32:16 GMT
Message-ID: <3C4D779C.B3894752@aminocom.com>
Date: Tue, 22 Jan 2002 14:30:52 +0000
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Self Answer & NAND driver wait queue init problem
References: <20010912155503.A26299@hartford.siteprotect.co.kr> <20010913145341.A21279@hartford.siteprotect.co.kr>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Kim Jong-chan wrote back in september last year!:
> Finally, I've solved the problem.
> The answer is that wq of struct nand_chip is not initialized.
> So I suggest... nand_scan() in nand.c
> 
>     /* Initialize state and spinlock */
>     this->state = FL_READY;
>     spin_lock_init(&this->chip_lock);
> 
>     /* Initialize wait queue : fixed by Adelinux */
> >   init_waitqueue_head(&this->wq);
> 
>     /* De-select the device */
>     nand_deselect ();
> 
> I've looked up MTD drivers code of other chips. And I think wq must be
> initialized. Otherwise, wake_up will kill the system.

I've just been caught by this too, so the/a fix didn't get into CVS...
Is Kim's fix a good one, if so can someone check it in please? If it
isn't what is the Right Thing to do?....


Beth

-- 
Chief Engineer - Software
Amino Communications Ltd
01954 784523 (Direct Line)
