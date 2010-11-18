Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIzlJ-0004hL-K1
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 08:22:34 +0000
Received: by bwz5 with SMTP id 5so2572366bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2010 00:22:31 -0800 (PST)
Subject: Re: Are there UBI layout changes between 2.6.35 and 2.6.36?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <201011181244.04745.manningc2@actrix.gen.nz>
References: <201011181244.04745.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Nov 2010 10:22:09 +0200
Message-ID: <1290068529.2270.5.camel@localhost>
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

On Thu, 2010-11-18 at 12:44 +1300, Charles Manning wrote:
> Folk
> 
> I have been helping some people get an omap3 overo-based system going. 
> Everything is working fine using 2.6.35 and software ECC, but when I changed 
> I change to 2.6.36 and hwecc things stop working. I get the following 
> problem, and obviously no boot :-(.

Hmm, should not be, at least not intentional. Could you please try to
bisect - there are not so many UBI changes so you can probably find the
offending one.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
