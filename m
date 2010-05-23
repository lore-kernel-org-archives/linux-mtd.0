Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OG9xJ-0006hk-MU
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 12:06:58 +0000
Subject: Re: suspend to disk hangs when running from ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: saeed bishara <saeed.bishara@gmail.com>
In-Reply-To: <r2ic70ff3ad1004120131h2127ece2o2fbb8256093c3b0b@mail.gmail.com>
References: <c70ff3ad1002230217x1393c41che316e24a47f577ff@mail.gmail.com>
	<1270042736.15073.28.camel@localhost>
	<1270043508.15073.31.camel@localhost>
	<r2ic70ff3ad1004120131h2127ece2o2fbb8256093c3b0b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 23 May 2010 15:04:36 +0300
Message-ID: <1274616276.22999.21.camel@localhost>
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

On Mon, 2010-04-12 at 11:31 +0300, saeed bishara wrote:
> Thanks Artem, your suggestion fixed my issue.
> saeed

FYI, the reboot notifiers were removed, so your issue has to be fixed in
the latest linux kernel trees, or starting from the release version
2.6.35.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
