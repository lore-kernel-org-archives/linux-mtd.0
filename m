Received: from mail018.syd.optusnet.com.au ([203.2.75.177])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l3OJ-0008M4-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 07:41:44 +0000
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail018.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g2D7r7A18737
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 18:53:07 +1100
Received: from justin.ctam.local ([192.168.0.38] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 16l3ZK-0007uv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 18:53:06 +1100
Message-ID: <3C8F04B4.D745D633@ctam.com.au>
Date: Wed, 13 Mar 2002 18:50:12 +1100
From: Justin Ipsen <justin.ipsen@ctam.com.au>
Reply-To: justin.ipsen@ctam.com.au
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ECC Reset problems
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,

I'm running linux 2.4.1-pre11 on a powerPC platform.
I have been using a 32M doc2000 with no problems.
I've just started to use a 48M doc2000 but the On-Chip
ECC engine seems to work just once after reset and
not again.   It looks like the "ECC Config" Resets function
has stopped working?

Any ideas?

Thanks.
