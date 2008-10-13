Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KpI8J-0005Il-PP
	for linux-mtd@lists.infradead.org; Mon, 13 Oct 2008 07:46:28 +0000
Subject: Re: Understanding UBIFS flash overhead
From: Artem Bityutskiy <dedekind@infradead.org>
To: dsaxena@plexity.net
In-Reply-To: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
References: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
Content-Type: text/plain; charset=utf-8
Date: Mon, 13 Oct 2008 10:45:22 +0300
Message-Id: <1223883922.3395.62.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-10-10 at 14:00 -0700, Deepak Saxena wrote:
> I'm working on getting UBIFS going on the OLPC XO and am trying to
> understand what I am seeing in regards to file system size.=20

BTW, consider to try new "bulk_read" mount option which may improve file
read speed. The "no_chk_data_crc" might be considered as well.

We'd be interested to get some digits from you to see whether
"bulk_read" improves things for you. Please, read here:
http://marc.info/?l=3Dlinux-kernel&m=3D122276053307842&w=3D2

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
