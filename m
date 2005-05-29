Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DcVen-0001Ra-Fj
	for linux-mtd@lists.infradead.org; Sun, 29 May 2005 17:49:18 -0400
To: Steven Scholz <steven.scholz@imc-berlin.de>,
	Robert Schwebel <robert@schwebel.de>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Thu, 26 May 2005 19:26:43 +0200."
	<429606D3.3050704@imc-berlin.de>
Date: Sun, 29 May 2005 23:48:58 +0200
Sender: wd@denx.de
Message-Id: <20050529214903.56F4FC1512@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fast rollout process on jffs2? 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <429606D3.3050704@imc-berlin.de> you wrote:
> 
> >>You could {g,b}zip it. The many 0xFF should compress quite nice... ;-)
> > 
> > Yes, but is there a way to decompress gzip/bzip in u-boot? 
> 
> Sure.
> But maybe not yet as a user command. But the code is there. I use it to 
> unzip boot logos at start up.

Sometimes it helps to read the FAQ:
http://www.denx.de/twiki/bin/view/DULG/HowCanILoadAndUncompressACompressedImage

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The joys of love made her human and the  agonies  of  love  destroyed
her.
	-- Spock, "Requiem for Methuselah", stardate 5842.8
