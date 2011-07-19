Received: from nm1-vm0.bullet.mail.sp2.yahoo.com ([98.139.91.202])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjHCx-0007q6-Qk
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 20:48:00 +0000
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
	<1310988807.20738.44.camel@sauron>
Message-ID: <1311108475.12313.YahooMailRC@web114615.mail.gq1.yahoo.com>
Date: Tue, 19 Jul 2011 13:47:55 -0700 (PDT)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: UBIFS Corruption
To: dedekind1@gmail.com
In-Reply-To: <1310988807.20738.44.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > 
> > However, we just saw  2 corruptions within the past 48h that we can't 
>explain. 
>
> >  We've  been doing the same basic operation (in terms of 
>flashing/reading/writing 
>
> > images) for quite some time, and have reflashed our units many times  (over 
> > thousands of different hardware units).
> 
> OK, did more  happen meanwhile?


No, just these two so far

> 
> > Device #1 failure:
> > * Device was running  out of a partition mounted to /home (a 93MB partition 
>from 
>
> > a 128MB NAND  device)
> > * Our app was running normally and locked up (not sure  why).  Our code may 
>have 
>
> > been updating a sqlite database located  in that partition
> > * When we power cycled, the partition had the  corruption issue noted.
> 
> Do you still have these devices? You need to  enable UBIFS recovery
> debugging messages and send them to me, may be then I  can help.
> 

Excellent ideal.  Let me try enabling that in the kernel and updating just the 
kernel to see what we can find.

FWIW, I have downloaded a complete image of that corrupt partition.  Not sure if 
that helps me yet, but worth mentioning.

RP
