Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AxF9-0007YQ-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 18:55:35 +0000
To: Marc Singer <elf@buici.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
	linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: crc32() optimization 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sun, 10 Nov 2002 10:43:21 PST."
             <20021110184321.GB16087@buici.com>
Date: Sun, 10 Nov 2002 20:25:38 +0100
Message-Id: <20021110192544.0A34D10162@denx.denx.de>
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

In message <20021110184321.GB16087@buici.com> you wrote:
> As it should.  I wonder if you'd do better changing the loop slightly.
> 
> Check for len == 0 and do a short-circuit return.  Then do this
> 
>   for (++len; len & 0x7; len >>= 3) {
>      ONCE(); // repeat eight times
>      ...
>      len >>= 3;
>   }
>   while (--len > 0)
>      ONCE();
> 
> This is the implementation I've written for another project which

Seems broken to me, since you "len >>= 3" twice.

Also, Duff's Device comes to mind.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325 
