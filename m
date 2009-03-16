Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LjAO3-00057k-RC
	for linux-mtd@lists.infradead.org; Mon, 16 Mar 2009 10:49:47 +0000
Subject: Re: old and new ubi utilities
From: Artem Bityutskiy <dedekind@infradead.org>
To: Andreas Arnez <arnez@vnet.ibm.com>
In-Reply-To: <m3myblizht.fsf@vnet.ibm.com>
References: <1236959822.24755.14.camel@localhost.localdomain>
	<m3myblizht.fsf@vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Mar 2009 12:49:20 +0200
Message-Id: <1237200560.3622.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, haver@vnet.ibm.com,
	Sidney Amani <seed95@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-03-16 at 10:33 +0100, Andreas Arnez wrote:
> Artem Bityutskiy <dedekind@infradead.org> writes:
> 
> > It seems that nowadays the old ubi utilities are unused and
> > unmaintained. And I've got a question from Sidney if it would be
> > possible to change the MTD repository layout and move the new utilities
> > to
> > 	mtd-utils/ubi-utils
> > and old utilities to
> > 	mtd-utils/ubi-utils/old-utils
> > just like I have originally done.
> >
> > So, will you mind if I do this, taking into account that the old
> > utilities are not widely used and not maintained?
> 
> We can adjust to such restructuring.  We may still stick to the old
> utilities for now, because the last time I looked, the new utilities
> were lacking some functionality we relied upon.

Thanks. Sure, I'm not talking about removing the older stuff, just
moving it one directory level deeper :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
