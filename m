Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g7MR-0007rE-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 17:59:56 +0000
To: Phil Thompson <phil@river-bank.demon.co.uk>
Cc: joakim.tjernlund@lumentis.se,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
In-reply-to: Your message of "Tue, 04 Feb 2003 17:34:24 GMT."
             <200302041734.24986.phil@river-bank.demon.co.uk>
Date: Tue, 04 Feb 2003 18:59:30 +0100
Message-Id: <20030204175935.62BBFC608E@atlas.denx.de>
Subject: Re: Different zlib CRC Algorithms 
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
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

In message <200302041734.24986.phil@river-bank.demon.co.uk> you wrote:
>
> So that would confirm my original observation that the kernel does use a 
> slightly different CRC algorithm than userspace zlib.

The algorithm itself is identical.  It's  just  that  the  result  is
complemented.


Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
2000 pounds of chinese soup                               = 1 Won Ton
