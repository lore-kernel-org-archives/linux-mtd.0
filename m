Received: from web43134.mail.sp1.yahoo.com ([216.252.121.64])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Irgkx-0001fY-H7
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 16:23:50 -0500
Date: Mon, 12 Nov 2007 13:23:38 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.0.9999.0711091515040.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> What about a new partition flag then?  When set the unlock method would 
> be called on the corresponding partition if the partition is not already 
> marked read-only.
> 

I think that a partition flag is a good idea, but the mtd partition should be
unlocked by defualt if it is not read only and adding the flag will keep it locked.

How do you think it could be done that others would be accepting of it?  I do not
think everyone would like to see another flag that is so close to a read only flag.

Justin


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
