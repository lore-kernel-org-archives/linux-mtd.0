Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B0Ip-0007sg-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 22:11:35 +0000
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: "Marc Singer" <elf@buici.com>, linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: crc32() optimization 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sun, 10 Nov 2002 23:35:21 +0100."
             <001301c28909$743f1f40$0200a8c0@telia.com>
Date: Sun, 10 Nov 2002 23:41:37 +0100
Message-Id: <20021110224142.2F39310162@denx.denx.de>
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

In message <001301c28909$743f1f40$0200a8c0@telia.com> you wrote:
> I could not wait until tomorrow, so I did it now instead.
> The result was worse. The best I got was 7% improvement.
> I tried 16, 8, 6 and 4 as unrolling steps.

Makes no sense to me.  Should  be  at  least  as  efficient  as  your
original code (marginally better).

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325 
