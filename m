Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15do10-0006tZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 08:19:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B932CDF.42F6AA02@dgt-lab.com.pl> 
References: <3B932CDF.42F6AA02@dgt-lab.com.pl> 
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd-snapshot-20010902.tar.bz2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Sep 2001 08:25:10 +0100
Message-ID: <4494.999501910@redhat.com>
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


krom@dgt-lab.com.pl said:
> hey there! where is "mtd_do_chip_probe", and what is it? 

Oops. It was called mtd_do_gen_probe but now it's fixed. cvs update and try 
again. 

Note that I haven't tested any of this new stuff yet. I'm planning to do 
that this morning.

--
dwmw2
