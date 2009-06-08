Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDiD7-0003Wm-Fp
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 17:00:48 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDiD5-00085m-NL
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 17:00:35 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 17:00:35 +0000
Received: from nahor.j+gmane by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 17:00:35 +0000
To: linux-mtd@lists.infradead.org
From: Nahor <nahor.j+gmane@gmail.com>
Subject: Re: Nandwrite's behavior in case of write failure
Date: Mon, 08 Jun 2009 10:00:19 -0700
Message-ID: <4A2D43A3.7070105@gmail.com>
References: <h09s2s$ar6$1@ger.gmane.org>	<1244205087.5847.66.camel@localhost.localdomain>	<4A29D723.1010109@gmail.com>
	<1244365076.5847.317.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244365076.5847.317.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> I wonder, it it would make sense
> to use libmtd.c from UBI utils and re-write nandwrite? Of course
> libmtd.c would need to be improved as well. But the benefit would be
> shared code between ubiformat and nandwrite.

I've been thinking that too. Unfortunately, I've too much work on my
hands already and I don't have the time for things that are not strictly
necessary. :(
