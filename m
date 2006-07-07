Date: Fri, 7 Jul 2006 18:00:28 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
In-Reply-To: <Pine.LNX.4.56.0606281918430.15911@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.56.0607071751290.2326@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
	<1151433983.6394.230.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
	<1151438714.6394.232.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271701120.28771@localhost.localdomain>
	<Pine.LNX.4.56.0606281918430.15911@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas,

What is your opinion regardring the modified patch.
If nobody complains would it be possible to include this patch into repository? 

Thanks,
Alexey
> The code I verified today has some issues:
> 
> 1. The resolution of sleeping procedure on erase operations is still very low. 
> Tests showed erase performance ~278Kb/sec it's better than 246Kb/sec from original code but it's still far from real device speed ~310Kb/sec.
> 
> 2. This code
> >+		if (chip_op_time/2 >= 1000000/HZ) {
> >+			/*
> >+			 * Half of the normal delay still remaining
> >+			 * can be performed with a sleeping delay instead
> >+			 * of busy waiting.
> >+			 */
> >+			msleep(chip_op_time/2000);
> >+			timeo -= chip_op_time/2;
> >+			chip_op_time -= chip_op_time/2;
> >+		} else {
> >+			udelay(1);
> >+			cond_resched();
> >+			timeo--;
> >+		}
> may add additional load of CPU when it is unnecessary (necessety is doubtful here). If we need to wait for a long time (erase) we divide chip_op_time by 2 everytime. When we reach 10ms we go to the udelay(1) and perform ~10000 cycles. IMO there is no necessety to do this. 
> 
> I found a rather good idea in your code with handling of timeo variable. So I slightly modified your code to avoid the issues with erase performance and verified it. It passed the tests.
> (New code showed erase performance ~310Kb/sec)
> 
> What do you think about this patch?
> 
> 
Thanks,
Alexey
