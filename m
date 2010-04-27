Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6fag-0007lb-An
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 07:52:22 +0000
Subject: Re: suspend to disk hangs when running from ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: saeed bishara <saeed.bishara@gmail.com>
In-Reply-To: <r2ic70ff3ad1004120131h2127ece2o2fbb8256093c3b0b@mail.gmail.com>
References: <c70ff3ad1002230217x1393c41che316e24a47f577ff@mail.gmail.com>
	<1270042736.15073.28.camel@localhost>
	<1270043508.15073.31.camel@localhost>
	<r2ic70ff3ad1004120131h2127ece2o2fbb8256093c3b0b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 10:47:53 +0300
Message-ID: <1272354473.26036.6.camel@localhost>
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

Thanks for testing. Kevin also sent a patch which removes the reboot
notifiers and fix your issue. I'll merge the patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
