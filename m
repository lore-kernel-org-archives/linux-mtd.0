Received: from mailc.telia.com ([194.22.190.4])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Axqr-0007dS-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 19:34:33 +0000
Message-ID: <006901c288f4$79e2ce20$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Marc Singer" <elf@buici.com>, "Wolfgang Denk" <wd@denx.de>
Cc: <linux-mtd@lists.infradead.org>
References: <20021110192544.0A34D10162@denx.denx.de>
Subject: Re: crc32() optimization 
Date: Sun, 10 Nov 2002 21:05:11 +0100
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

Hi Wolfgang 

What's "Duff's Device"?

        Jocke
> 
> Seems broken to me, since you "len >>= 3" twice.
> 
> Also, Duff's Device comes to mind.
> 
> Best regards,
> 
> Wolfgang Denk
> 
> -- 
> Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
> Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
> See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325
