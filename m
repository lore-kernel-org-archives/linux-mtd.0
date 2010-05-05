Subject: Re: [PATCHv2] MTD: Suppress warnings in inline_map_read()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <i2w347733d51005041306q4b1d9f0bzd2206805c96cbad2@mail.gmail.com>
References: <1270891582.4704.102.camel@macbook.infradead.org>
	<e970485f0e9f4c9e1cb6e594a45dd11308683197@localhost.localdomain>
	<1272354388.26036.4.camel@localhost>
	<1272978272.3702.5.camel@localhost>
	<i2w347733d51005041306q4b1d9f0bzd2206805c96cbad2@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 15:11:39 +0300
Message-ID: <1273061499.3702.178.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-04 at 13:06 -0700, Kevin Cernekee wrote:
> On Tue, May 4, 2010 at 6:04 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > /home/dedekind/git/l2-mtd-2.6/include/linux/mtd/map.h: In function 'inline_map_read':
> > /home/dedekind/git/l2-mtd-2.6/include/linux/mtd/map.h:390: error: implicit declaration of function 'BUG'
> 
> I did test my patch, but it didn't generate any warnings or errors on MIPS...
> 
> Could you please apply this patch and retry:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2010-May/029904.html
> 
> <linux/bug.h> should probably be added anyway since there are two
> other BUG statements in that file.

Pushed this patch and the '[PATCH] mtd: map.h: add missing bug.h
include' one back to l2-mtd-2.6 / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
