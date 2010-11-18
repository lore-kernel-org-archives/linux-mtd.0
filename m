Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIzre-0005BG-3E
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 08:29:06 +0000
Received: by bwz5 with SMTP id 5so2576415bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2010 00:29:04 -0800 (PST)
Subject: Re: Are there UBI layout changes between 2.6.35 and 2.6.36?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <1290068529.2270.5.camel@localhost>
References: <201011181244.04745.manningc2@actrix.gen.nz>
	<1290068529.2270.5.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Nov 2010 10:28:43 +0200
Message-ID: <1290068923.2270.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-11-18 at 10:22 +0200, Artem Bityutskiy wrote:
> On Thu, 2010-11-18 at 12:44 +1300, Charles Manning wrote:
> > Folk
> > 
> > I have been helping some people get an omap3 overo-based system going. 
> > Everything is working fine using 2.6.35 and software ECC, but when I changed 
> > I change to 2.6.36 and hwecc things stop working. I get the following 
> > problem, and obviously no boot :-(.
> 
> Hmm, should not be, at least not intentional. Could you please try to
> bisect - there are not so many UBI changes so you can probably find the
> offending one.

And in fact, you can even revert all UBI changes which happened after
2.6.35 and try it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
