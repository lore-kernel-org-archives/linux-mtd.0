Received: from mailg.telia.com ([194.22.194.26])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B0CE-0007ru-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 22:04:46 +0000
Message-ID: <001301c28909$743f1f40$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Wolfgang Denk" <wd@denx.de>
Cc: "Marc Singer" <elf@buici.com>, <linux-mtd@lists.infradead.org>
References: <20021110210008.7CFF210162@denx.denx.de> <007b01c288ff$3fc665c0$0200a8c0@telia.com>
Subject: Re: crc32() optimization 
Date: Sun, 10 Nov 2002 23:35:21 +0100
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

I could not wait until tomorrow, so I did it now instead.
The result was worse. The best I got was 7% improvement.
I tried 16, 8, 6 and 4 as unrolling steps.

           Jocke

> Cool! I will give it a try(tomorrow afternoon) and see what happens.
> 
>          Jocke
> > > 
> > > What's "Duff's Device"?
> > 
> > It's a tricky way to implement general loop unrolling directly in  C.
> > Applied  to your problem, code that looks like this (instead of 8 any
> > other loop count may be used, but  you  need  to  adjust  the  "case"
> > statements then):
> > 
> > register int n = (len + (8-1)) / 8;
> > 
> > switch (len % 8) {
> > case 0: do { val = crc32_table ... ;
> > case 7: val = crc32_table ... ;
> > case 6: val = crc32_table ... ;
> > case 5: val = crc32_table ... ;
> > case 4: val = crc32_table ... ;
> > case 3: val = crc32_table ... ;
> > case 2: val = crc32_table ... ;
> > case 1: val = crc32_table ... ;
> > } while (--n > 0);
> > }
> > 
> > BTW: this is strictly legal ANSI C!
> > 
> > For an explanation see http://www.lysator.liu.se/c/duffs-device.html
> > 
> > Best regards,
> > 
> > Wolfgang Denk
> > 
> > -- 
> > Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
> > Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
> > See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
