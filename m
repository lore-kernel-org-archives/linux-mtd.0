Received: from [2001:a60:0:488::2] (helo=mail-out.m-online.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjGNo-0003Gp-Ak
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 07:51:09 -0400
To: Brad Campbell <brad@wasp.net.au>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sat, 10 Jul 2004 13:38:14 +0400."
	<40EFB906.7060701@wasp.net.au>
Date: Sat, 10 Jul 2004 13:50:55 +0200
Sender: wd@denx.de
Message-Id: <20040710115100.4C384C109F@atlas.denx.de>
Cc: Patrick Hilt <philt@pioneer-pdt.com>, linux-mtd@lists.infradead.org
Subject: Re: JFFS 2 Question 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <40EFB906.7060701@wasp.net.au> you wrote:
> 
> I believe that jffs2 is a synchronous filesystem in any case. By the time your application has 
> returned from the write() call, the data is on flash.

At least on NAND flash it might just be in the write buffer, though.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
COBOL is for morons.                                 -- E.W. Dijkstra
