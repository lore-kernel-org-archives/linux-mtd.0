Received: from maild.telia.com ([194.22.190.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B0aQ-0007wf-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 22:29:46 +0000
Message-ID: <002b01c2890c$f2c058e0$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Wolfgang Denk" <wd@denx.de>
Cc: "Marc Singer" <elf@buici.com>, <linux-mtd@lists.infradead.org>
References: <20021110224142.2F39310162@denx.denx.de>
Subject: Re: crc32() optimization 
Date: Mon, 11 Nov 2002 00:00:22 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> In message <001301c28909$743f1f40$0200a8c0@telia.com> you wrote:
> > I could not wait until tomorrow, so I did it now instead.
> > The result was worse. The best I got was 7% improvement.
> > I tried 16, 8, 6 and 4 as unrolling steps.
> 
> Makes no sense to me.  Should  be  at  least  as  efficient  as  your
> original code (marginally better).

I don't understand this either.
Anyone?

         Jocke
