Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AodVT-0001i1-Jk
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2004 07:01:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: leoli@motorola.com
In-Reply-To: <1075950453.12044.7.camel@Gundam>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
	 <1074503876.14499.40.camel@imladris.demon.co.uk>
	 <1074509881.14564.3.camel@Gundam>
	 <1074510244.14499.49.camel@imladris.demon.co.uk>
	 <1074572447.14559.23.camel@Gundam>
	 <1074583969.14499.100.camel@imladris.demon.co.uk>
	 <1075950453.12044.7.camel@Gundam>
Content-Type: text/plain
Message-Id: <1075964435.12587.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 05 Feb 2004 07:00:35 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2+mtd+big endian problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-05 at 11:07 +0800, Li Yang wrote:
> Thank you.  I got it.
> 
> In drivers/mtd/chips/sharp.c line 362
> There is a hard coded cpu_to_le32 swap, which caused the swap issue.

Aha :)

> I have tried to use Jedec_probe instead of sharp driver, but it always
> recognizes my sharp flash as Intel flash, they have the same vendor id
> and product id. Ugly.  And then something goes wrong.  So I have to
> stick to the obsoleted sharp driver.  Thank you for the continued help.

Hmmm. I'd feel happier if you were to identify the 'something' which
goes wrong. I was just about to remove the sharp driver from the tree on
the basis that it's obsolete.

Could it be as simple as disabling the erase suspend?

-- 
dwmw2
