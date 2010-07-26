Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdGNO-0001DW-Qg
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 05:37:23 +0000
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTinJ5u2BPk5e-46cL10=c5cG_3sFEQixZymwqU-w@mail.gmail.com>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279386513.7515.33.camel@localhost.localdomain>
	<AANLkTinJ5u2BPk5e-46cL10=c5cG_3sFEQixZymwqU-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 08:36:38 +0300
Message-ID: <1280122598.14917.42.camel@localhost>
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

On Fri, 2010-07-23 at 19:43 -0700, Kevin Cernekee wrote:
> On Sat, Jul 17, 2010 at 10:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > +               /*
> > +                * MEMERASE64 support was added in kernel version 2.6.30, so
> > +                * probably we are working with older kernel and this ioctl is
> > +                * not supported.
> > +                */
> 
> s/2.6.30/2.6.31/
> 
> I applied both of your patches, applied my flash_eraseall v3 patch,
> then tested erase only (no OOB) on 2.6.18 and 2.6.31.  Works fine.  I
> verified with strace that the proper ioctl was being called in each
> instance.

Amended and pushed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
