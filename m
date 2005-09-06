Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECa8t-00033S-FO
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 05:53:29 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: dedekind@infradead.org
In-Reply-To: <1125997245.8135.16.camel@sauron.oktetlabs.ru>
References: <1124840186.7086.19.camel@localhost.localdomain>
	<430F09E5.10607@inf.u-szeged.hu>
	<1125550939.7076.14.camel@localhost.localdomain>
	<1125997245.8135.16.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Tue, 06 Sep 2005 03:52:56 -0600
Message-Id: <1126000376.7119.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Latest jffs2 broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-06 at 13:00 +0400, Artem B. Bityuckiy wrote:
> I have had my vacation, I will glance what is going on.

Actually, I have just found that an error in the nand driver I am using
is the cause of this problem. The problem only happens with the latest
jffs2 code, but I now know it is not the jffs2 code. In fact, I am now
seeing the performance benefits of the new frag tree stuff and I am
really impressed. Good job!

Pete
