Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSY5o-0007lJ-Mb
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:51:13 +0000
Received: by bwz14 with SMTP id 14so1008488bwz.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 08:51:11 -0800 (PST)
Subject: Re: About MTD Testing suite included in the Linux kernel.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: os user <gnusercn@gmail.com>
In-Reply-To: <AANLkTi=-L0DuQziSkzzock8LOJEDY2z37t2bLWQQ_YXG@mail.gmail.com>
References: <AANLkTi=-L0DuQziSkzzock8LOJEDY2z37t2bLWQQ_YXG@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:50:40 +0200
Message-ID: <1292345440.2538.100.camel@localhost>
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

On Sat, 2010-12-11 at 21:22 +0800, os user wrote:
> Hi,
> 
> When I work on MTD testing tool (drivers/mtd/tests) included in the
> Linux kernel, I found a problem.
> For mtd_oobtest, I failed at the testing '4 of 5'. This testing case
> will test 'reading past the device'.

We are discussing the same here:

http://lists.infradead.org/pipermail/linux-mtd/2010-December/033407.html

Please, take a look there.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
