Received: from [208.28.249.7] (helo=ktc_internet)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Gnsz-0006IG-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 21:04:21 +0000
Subject: Porting JFFS II to 2.4.6
To: linux-mtd@lists.infradead.org
Message-ID: <OF26C7A171.C0609C8C-ON88256B26.007D0F13@LocalDomain>
From: Steve_Chen@kingston.com
Date: Wed, 19 Dec 2001 13:12:00 -0800
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
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

Hi all,
I like to get some expert advice.  We have frozen our development platform
at kernel version 2.4.6 for months now.   And we like to port the latest
JFFS II source code from 2.4.16 to 2.4.6.

I noticed that there are some structure changes in fs directory from 2.4.6
to 2.4.16.  What is the most effective way to do the porting ?

1) Do we just port the JFFS II code from 2.4.16 to 2.4.6 ??
2) Do we port the whole fs directory source tree from 2.4.16 to 2.4.6 ??
3) Is there a better way to port ??
4) What are the areas we should watch out ??

Thanks.

Steve Chen
Kingston Technology
(714)437-3311
