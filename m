Received: from web43133.mail.sp1.yahoo.com ([216.252.121.63])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqYH0-0004vl-B8
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 13:08:13 -0500
Date: Fri, 9 Nov 2007 10:08:03 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <20071108193051.5a69cd60@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <132621.26766.qm@web43133.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Adding the ability to unlocking all Intel flash that is locked on power up. 
> > Currently only Intel P30 flash is unlocked.  All Intel flash is locked on power
> up.
> 
> Um, it most certainly is not.
> 

Josh can you clarify this? 

To my understanding Intel W3 and J3 flash will ignore any additional unlock
commands. I will try to look into this further.

Many request have been sent to the mailing list regarding how to unlock a part.  I
have never seen a request asking how to lock a part.  As the patch is written
currently only mtd partitions that are mapped in as r/w rahter than read only will
be unlocked. 

I will write another patch to enable/disable unlocking by default.

Justin 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
