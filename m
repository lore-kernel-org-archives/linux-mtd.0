Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mimo2-0000Hd-Ta
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 10:11:15 +0000
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karel Zak <kzak@redhat.com>
In-Reply-To: <20090902092402.GI1466@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<20090902092402.GI1466@nb.net.home>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Sep 2009 13:10:24 +0300
Message-Id: <1251886224.3514.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Corentin Chary <corentincj@iksaif.net>, Theodore Ts'o <tytso@mit.edu>,
	util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-09-02 at 11:24 +0200, Karel Zak wrote:
> Hi Corentin,
> 
> On Mon, Aug 24, 2009 at 01:11:54PM +0200, Corentin Chary wrote:
> > Probe UBI volume under /dev (or /devfs, /devices).
> 
>  that's not elegant. Does it mean that UBI volumes are not in
>  /proc/partitions?

Yeah, the thing is that neither UBI volumes nor MTD devices are in
/proc/partitions, just because they are not block devices and they
are not members of the blkock device infrastructure. They form a
completely separate subsystem.

Here are some more data:
http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_what
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_raw_vs_ftl

There are already 3 FSes which work with MTD: JFFS2, UBIFS and
(out-of-tree)YAFFS2.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
