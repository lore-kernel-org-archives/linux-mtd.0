Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzPId-00075e-6e
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:08:15 +0000
Received: by eyh6 with SMTP id 6so85658eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Mar 2011 01:08:13 -0700 (PDT)
Subject: Re: gcc 4.5 and copy_flag in libubigen.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andre Naujoks <nautsch2@googlemail.com>
In-Reply-To: <4D7F1B8C.2080303@googlemail.com>
References: <4D7E4437.70300@googlemail.com> <4D7E5601.6090905@parrot.com>
	<4D7F1B8C.2080303@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Mar 2011 10:06:40 +0200
Message-ID: <1300176400.2740.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-15 at 08:55 +0100, Andre Naujoks wrote:
> Am 14.03.2011 18:53, schrieb Matthieu CASTET:
> > Andre Naujoks a écrit :
> >> Hi all.
> >>
> >> I am compiling a board support package with mtd-utils-1.3.1.
> >>
> > Why don't you update your mtd-utils version ?
> 
> Because it would be more of a hassle and a risk to do that. There are
> patches applied that were build from the suppliers of the BSP, which I
> would have to possibly reproduce for a newer version. As far as I can
> see, they are all patches to the build system, but nevertheless.

Well, you can use 1.3.1, but do not use old UBI utils, use the new ones,
i.e., use ubi-utils/src/libubigen.c, not
ubi-utils/old-utils/src/libubigen.c

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
