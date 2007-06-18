Received: from an-out-0708.google.com ([209.85.132.242])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I0DYM-0001me-0r
	for linux-mtd@lists.infradead.org; Mon, 18 Jun 2007 05:29:42 -0400
Received: by an-out-0708.google.com with SMTP id c3so313127ana
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jun 2007 02:29:40 -0700 (PDT)
Message-ID: <fe810cf0706180229x3c9cd065kb22cc9983e2ed2ac@mail.gmail.com>
Date: Mon, 18 Jun 2007 13:29:39 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: PAGE READ CACHE MODE anyone?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

As you may know some NAND chips have PAGE READ CACHE MODE operation
that uses the cache register to read data. The basic idea is as
follows, a page of data is transferred from the Flash array to the
data register, then moved to the cache register when the PAGE READ
CACHE MODE command is issued. After this command is issued, data can
be clocked out of the cache register through the NAND Flash interface,
while the next page of data is simultaneously moved from the Flash
array to the data register.

So _theoretically_ using PAGE READ CACHE MODE could save more than 30%
of time to read each page. Pages must be sequentially read one by one
without interruption. The more pages read sequentially, the more read
performance improvement is (with saturation, of course).

My question is, what is the reason of this feature is still not
supported by Linux MTD? Just no one has sent a patch? Or there are
some special software limitations? Or I'm just missing something?

Thanks,
Alexander
