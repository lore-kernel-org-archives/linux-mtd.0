Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160mNG-0006Qf-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 16:13:23 +0000
Date: Mon, 5 Nov 2001 17:22:38 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: Eric <ebrower@usa.net>
Subject: MTD partitioning rewrite finished
Message-ID: <20011105172238.A10542@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

The code has matured enough on my machine that normal people might try
it, too. You can download a patch against 2.4.13 now, I don't have to
scare away normal users anymore. :)
I also truncated the patch into several smaller ones as the mapping
stuff and the partition parser are optional. 40k is still plenty.

Here are the links for the web page and the direct download:
http://wh.fh-wedel.de/~joern/software/kernel/
http://wh.fh-wedel.de/~joern/software/kernel/mtd_je.patch.2.4.13

Jörn

PS: Eric, I cc'd you as you said you had a non-academic use for this
stuff. It would be nice to get some feedback. "works" is enough,
"breaks at this point" is better, "this code looks odd" would really
help me to improve the code and my style.

-- 
Beware of bugs in the above code; I have only proved it correct,
but not tried it.
  -- Donald Knuth
