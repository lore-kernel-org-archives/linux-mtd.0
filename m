Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OBl4X-0003Sl-0k
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 08:44:13 +0000
Subject: Re: [PATCHv4] mtd-utils: use new 64-bit ioctls + sysfs to support
	>4GiB devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: saeed bishara <saeed.bishara@gmail.com>
In-Reply-To: <AANLkTinZtqLjdmVyvo9F9uEnLb3YL0V2-n0Gt7vObpj5@mail.gmail.com>
References: <a95a62fe0904031318q21bb727ft297aaa5edc18e2a@mail.gmail.com>
	<AANLkTinZtqLjdmVyvo9F9uEnLb3YL0V2-n0Gt7vObpj5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 May 2010 11:43:09 +0300
Message-ID: <1273567389.2209.173.camel@localhost>
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

On Tue, 2010-05-11 at 11:28 +0300, saeed bishara wrote:
> hi,
>    This patch is needed when using >4GiB nand partitions, any idea why
> it has not been merged yet?
> 
> saeed
> 
> On Fri, Apr 3, 2009 at 11:18 PM, Kevin Cernekee <kpc.mtd@gmail.com> wrote:
> > Use the new kernel ioctls to erase/lock/unlock/readoob/writeoob >4GiB
> > flash devices.
> >
> > Use the new sysfs interface to query device info.
> >
> > Dependencies:
> >
> > "4GiB" extended ioctls:
> > http://lists.infradead.org/pipermail/linux-mtd/2009-April/025122.html
> >
> > Driver model updates 1/2: http://lkml.org/lkml/2009/4/3/477
> >
> > Optional: Driver model updates 2/2:
> > http://lists.infradead.org/pipermail/linux-mtd/2009-March/025011.html
> >

Dunno, I did not follow these. Kevin, would you re-send your patches
please?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
