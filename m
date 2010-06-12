Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONP31-0005UN-S6
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 11:38:48 +0000
Subject: Re: [PATCH v5 2/3] mtd-utils: support >4GiB devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <1273745471.22706.163.camel@localhost>
References: <cd4bcbb843643dc463d2a2853766bcf57c23f546@localhost.localdomain>
	<5e05b5a05a30b2dc2035b87a60bb82f3137174cb@localhost.localdomain>
	<1273745471.22706.163.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 12 Jun 2010 14:36:19 +0300
Message-ID: <1276342579.19028.116.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: saeed.bishara@gmail.com, jwboyer@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-13 at 13:11 +0300, Artem Bityutskiy wrote:
> >  nandwrite.c           |   60 +++++-----
> >  13 files changed, 570 insertions(+), 171 deletions(-)
> >  create mode 100644 mtd_ioctl.c
> >  create mode 100644 mtd_ioctl.h
> 
> Any chance to extend and use mtd-utils/ubi-utils/src/libmtd.c instead of
> mtd_ioctl.c?

Does silence mean that that answer is "no"? :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
