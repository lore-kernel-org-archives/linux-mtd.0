Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOr3j-0001yE-Hd
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 02:23:06 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 Oct 2005 19:28:35 +1300
References: <BAY112-F220F3A8DFFA9ECE3156A5AB3790@phx.gbl>
In-Reply-To: <BAY112-F220F3A8DFFA9ECE3156A5AB3790@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="gb2312"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510101928.35485.manningc2@actrix.gen.nz>
Cc: wen jia <ganganwen@hotmail.com>
Subject: Re: what should i do? using DOM and CF's problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 10 October 2005 16:53, wen jia wrote:
> hi,everyone
>    I want to use DOM or CF in a ATM-like machine. In this machine I have to
> record after each exchange, and there is no UPS, so sudden Power loss must
> be accepted. I don't select DOC for its high price, not using harddisk for
> its high heat and easy damage.
>    There is a article talking about the DOM,CF & DOC. And from this article
> there is no safe way to use a DOM,CF even DOC under such environment. what
> should I do?
>    here is the article:http://www.koansoftware.com/en/art.php?art=40

DOM and DOC or anything else won't help if you're using FAT.

Consider using NAND flash or SmartMedia or XD. These are raw NAND flash parts. 
Then, use them with JFFS2 or YAFFS. That should give you a very reliable 
solution.
