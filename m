Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbeLY-00037j-MD
	for linux-mtd@lists.infradead.org; Fri, 27 May 2005 08:53:53 -0400
From: Ian Campbell <icampbell@arcom.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1117197443.12591.216.camel@hades.cambridge.redhat.com>
References: <20050526152256.GS6681@pengutronix.de>
	<4295ED9E.6000508@arcom.com> <4295EE70.8000608@imc-berlin.de>
	<4295F3A4.70303@arcom.com>  <20050526164635.GT6681@pengutronix.de>
	<1117197443.12591.216.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Fri, 27 May 2005 13:53:00 +0100
Message-Id: <1117198382.384.10.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-05-27 at 13:37 +0100, David Woodhouse wrote:
> On Thu, 2005-05-26 at 18:46 +0200, Robert Schwebel wrote:
> > Hmm, sounds good, but that probably means that the jffs2 images have to
> > be the full flash size (which is 32 MB in my case) compared to about 8
> > MB at the moment? 
> 
> You don't have to pad the image. If you use the '-j' argument to
> RedBoot's 'fis create' command, it'll erase the extra space and write
> cleanmarkers for you.

That doesn't seem to be in upstream CVS, is it very new or unmerged?

Ian.
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
