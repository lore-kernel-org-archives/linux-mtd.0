Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTcYe-0001ix-IL
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 03:50:14 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id D434C22967
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2004 11:49:13 +0300 (MSK)
Message-ID: <41986D89.4060308@oktetlabs.ru>
Date: Mon, 15 Nov 2004 11:49:13 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NAND pages cache?
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

It is known that MTD always reads/writes in fractions of the whole NAND 
pages. An this is right I believe.

But while working with JFFS2, I have mentioned that very often it reads 
the same page several times consequently. This happens for example, when 
JFFS2 performs Garbage Collection, and there are several small nodes in 
the NAND page. Thus, when JFFS2 reads these nodes, it re-reads the same 
NAND page several times. This is bad.

So, the obvious idea how to avoid this is to introduce something like 
NAND pages cache. The cache will keep several NAND pages which were last 
accessed.

Obviously, this will require at least one more page buffer copy 
operation and, for example, will only decrease the sequential read speed.

So, It is possible to introduce calls like:

nand_read_buffered
nand_read_unbuffered

I don not know is it good to do this only in JFFS2 or on the MTD NAND layer?

Comments?

Thanks.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
