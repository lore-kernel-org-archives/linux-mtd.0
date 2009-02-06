Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVLnf-0006NK-JG
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 08:10:59 +0000
Subject: Re: [PATCH 1/2] MTD: add fsync capability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00902060006q963be2cw9541907145b74b90@mail.gmail.com>
References: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
	<8bd0f97a0902051400t6c9e7525h28597ae442501751@mail.gmail.com>
	<1233905683.17790.14.camel@localhost.localdomain>
	<71cd59b00902060006q963be2cw9541907145b74b90@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Feb 2009 10:10:54 +0200
Message-Id: <1233907854.17790.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-02-06 at 09:06 +0100, Corentin Chary wrote:
> I just copied the mtd_close()/mtd_open() function thinking that is was
> mtd's codestyle.
> So, maybe it's time to clean the while file. I can try to do that next
> week if I find the time.
> 
> Have the receveid "fsync() for UBI" patch ? it's seems the mail is
> waiting for approval on the mailing list.

I've pushed the UBI patch. The MTD part is David's, I do not maintain
the mtd-2.6.git tree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
