Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdGhc-0006RY-7J
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 05:58:16 +0000
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTikddtAwHnOs8weap9+eaxXkZY01DLHCST0VK+vd@mail.gmail.com>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279386513.7515.33.camel@localhost.localdomain>
	<1279427219.16247.5.camel@localhost.localdomain>
	<AANLkTikddtAwHnOs8weap9+eaxXkZY01DLHCST0VK+vd@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 08:57:25 +0300
Message-ID: <1280123845.14917.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-07-23 at 18:07 -0700, Kevin Cernekee wrote:
> On Sat, Jul 17, 2010 at 9:26 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > +int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
> > +             uint64_t start, uint64_t length, void *data, int cmd64, int cmd)
> 
> cmd64 should be an unsigned int.  When it gets compared to
> MEMREADOOB64 (0xc0184d16), gcc says "comparison is always false due to
> limited range of data type."
> 
> > +       if (cmd64 ==  MEMREADOOB64) {
> 
> Extra space after ==
> 
> > +               /*
> > +                * MEMREADOOB64/MEMWRITEOOB64 support was added in kernel
> > +                * version 2.6.30, so probably we are working with older kernel
> > +                * and these ioctls are not supported.
> > +                */
> 
> The new sysfs attributes were in 2.6.30, but the new ioctls did not
> make it in until 2.6.31 (commit 0dc54e).

Amended and pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
