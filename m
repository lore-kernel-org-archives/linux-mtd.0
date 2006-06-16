Received: from host2.innominate.fta-berlin.de ([141.16.82.35]
	helo=home.innominate.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FrCBA-0006Ft-1k
	for linux-mtd@lists.infradead.org; Fri, 16 Jun 2006 07:08:11 -0400
Date: Fri, 16 Jun 2006 12:58:29 +0200
From: Christian Hohnstaedt <chohnstaedt@innominate.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Use physmap if possible
Message-ID: <20060616105829.GA23673@tweety>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 14, 2006 at 09:12:27PM +0100, David Woodhouse wrote:
> 
> I want to stop adding map drivers -- any reason you can't use physmap?

What about making physmap more versatile and extend it by
COMPLEX_MAPPINGS and MTD_CONCAT support ?
Then it would be usable for me and maybe others, too.

I can do it, if desired.

regards
Christian

-- 
Christian Hohnstaedt
Software Engineer

Innominate Security Technologies AG  /device attached security/
tel: +49.30.6392-3285
fax: +49.30.6392-3307
Albert-Einstein-Str. 14
D-12489 Berlin, Germany
http://www.innominate.com
