Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZUCA-000360-Mu
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 09:11:40 -0500
Message-ID: <4370B1EC.8000504@yandex.ru>
Date: Tue, 08 Nov 2005 17:10:52 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
References: <200511071915.03263.tglx@linutronix.de>
In-Reply-To: <200511071915.03263.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Subject: Re: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thomas Gleixner wrote:
> - [MTD] NAND: OOB changes
> 	Needs more thoughts. I'm particularly unhappy with the introduction of new 
> functions and the still pending problem of the automatic placement/retrieval 
> of oob data. The change should subsume and/or extend the oob_info 
> functionality rather than introducing a parallel solution.

As for me, the ideal would be to have:
1. a method to fetch the number of OOB bytes available for user;
2. a method of read/write a buffer of that length to/from OOB; that 
space may be non-contiguous, but this should be hidden from the user.

Complications like the need to supply oob_info look unreasonable to me. 
Most (may be all?) people don't care about the OOB layout and just want 
to read/write data from/to it. So, I agree with Charles.

Any example of when users want to know the oob layout? May be nanddump 
utilities? Not sure.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
