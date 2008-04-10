Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jk1x3-0000vz-PA
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 18:56:50 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: "'Jean Pihet'" <jpihet@mvista.com>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
	<018a01c89b39$9a2b4fb0$ce81ef10$@Tjernlund@transmode.se>
	<200804102051.41101.jpihet@mvista.com>
In-Reply-To: <200804102051.41101.jpihet@mvista.com>
Subject: RE: [BUG] JFFS2 usage of write_begin and write_end functions
	causes	kernel panic
Date: Thu, 10 Apr 2008 20:56:45 +0200
Message-ID: <018d01c89b3c$9f914560$deb3d020$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: sv
Cc: nickpiggin@yahoo.com.au, 'Alexey Korolev' <akorolev@infradead.org>,
	joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Jean Pihet [mailto:jpihet@mvista.com]
> Sent: den 10 april 2008 20:52
> To: Joakim Tjernlund
> Cc: linux-mtd@lists.infradead.org; nickpiggin@yahoo.com.au; joern@logfs.org; dwmw2@infradead.org;
> 'Alexey Korolev'; akpm@linux-foundation.org
> Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes kernel panic
> 
> Jocke,
> 
> > Is this in Linus tree too?
> No, it isn't.
> 2.6.24 JFFS2 as such is pretty unstable.

ehh, that's no good. I browsed http://sourceforge.net/projects/mtd-mods and there
seems to be lots of patches there that fix different problems. Are
any of these in the soon to be released 2.6.25? which ones?

    Jocke
