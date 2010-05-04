Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9OOL-0002fE-CG
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 20:06:54 +0000
Received: by gwaa12 with SMTP id a12so1813719gwa.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 May 2010 13:06:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1272978272.3702.5.camel@localhost>
References: <1270891582.4704.102.camel@macbook.infradead.org>
	<e970485f0e9f4c9e1cb6e594a45dd11308683197@localhost.localdomain>
	<1272354388.26036.4.camel@localhost>
	<1272978272.3702.5.camel@localhost>
Date: Tue, 4 May 2010 13:06:51 -0700
Message-ID: <i2w347733d51005041306q4b1d9f0bzd2206805c96cbad2@mail.gmail.com>
Subject: Re: [PATCHv2] MTD: Suppress warnings in inline_map_read()
From: Kevin Cernekee <cernekee@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 4, 2010 at 6:04 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> /home/dedekind/git/l2-mtd-2.6/include/linux/mtd/map.h: In function 'inline_map_read':
> /home/dedekind/git/l2-mtd-2.6/include/linux/mtd/map.h:390: error: implicit declaration of function 'BUG'

I did test my patch, but it didn't generate any warnings or errors on MIPS...

Could you please apply this patch and retry:

http://lists.infradead.org/pipermail/linux-mtd/2010-May/029904.html

<linux/bug.h> should probably be added anyway since there are two
other BUG statements in that file.

Thanks.
