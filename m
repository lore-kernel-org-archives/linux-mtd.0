Subject: Re: [PATCH 2/4] [MTD] Add MEMERASE64 ioctl for >4GiB devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0904180921w3ac0128et7a543742f5734d64@mail.gmail.com>
References: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
	<1239953416.3390.243.camel@localhost.localdomain>
	<a95a62fe0904180921w3ac0128et7a543742f5734d64@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Apr 2009 09:47:11 +0300
Message-Id: <1240210031.14298.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-04-18 at 09:21 -0700, Kevin Cernekee wrote:
> On Fri, Apr 17, 2009 at 12:30 AM, Artem Bityutskiy
> <dedekind@infradead.org> wrote:
> > Kevin, are you going to re-send patches 2-4, taking into account
> > Arnd's and Andrew's suggestions?
> 
> For Arnd's suggestion, I posted a followup patch here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025269.html
> 
> Andrew brought up two issues: [MTD] in the subject line, and
> linewrapping.  I am assuming that he fixed these himself since he
> pulled all five patches (originals + followup) into the -mm tree.
> 
> Should I fix and repost the set anyway?

No, I just missed that patch. Pushed your patches to l2-mtd-2.6.git.
Will ping dwmw2 about this. I also checked that your patches at
least do not break MTD for UBI/UBIFS. Thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
