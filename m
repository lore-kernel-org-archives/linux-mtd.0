Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16H0mM-00073B-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2001 10:50:22 +0000
Date: Thu, 20 Dec 2001 12:01:06 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Steve_Chen@kingston.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Porting JFFS II to 2.4.6
Message-ID: <20011220120106.A5941@wohnheim.fh-wedel.de>
References: <OF26C7A171.C0609C8C-ON88256B26.007D0F13@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF26C7A171.C0609C8C-ON88256B26.007D0F13@LocalDomain>; from Steve_Chen@kingston.com on Wed, Dec 19, 2001 at 01:12:00PM -0800
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

Hi!

> I like to get some expert advice.  We have frozen our development platform
> at kernel version 2.4.6 for months now.   And we like to port the latest
> JFFS II source code from 2.4.16 to 2.4.6.
> 
> I noticed that there are some structure changes in fs directory from 2.4.6
> to 2.4.16.  What is the most effective way to do the porting ?
> 
> 1) Do we just port the JFFS II code from 2.4.16 to 2.4.6 ??

Yup, do that and see, what all breaks. Then fix those parts and you
did it.
The best way would be to create a patch from 2.4.6 to 2.4.16 for the
jffs2 stuff exclusively, read it and see, what might/will break. You
might want to upgrade the mtd code as well, for obvious reasons.

Jörn

-- 
The next best thing to having good ideas is recognizing 
good ideas from your users. Sometimes the latter is better.
