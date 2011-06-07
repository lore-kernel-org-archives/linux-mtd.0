Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QToeJ-0001tK-Tv
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:16:20 +0000
Received: by eyh6 with SMTP id 6so1941421eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:16:15 -0700 (PDT)
Subject: Re: [PATCH 4/4] flash_info: display MEMGETINFO and MEMISLOCKED
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <BANLkTik0YrwYWFiQMZucSp83zD0cS+emgQ@mail.gmail.com>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307384537-9607-4-git-send-email-vapier@gentoo.org>
	<1307422886.11104.21.camel@localhost>
	<BANLkTik0YrwYWFiQMZucSp83zD0cS+emgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 08:11:59 +0300
Message-ID: <1307423519.11104.25.camel@localhost>
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

On Tue, 2011-06-07 at 01:14 -0400, Mike Frysinger wrote:
...

> i'm adding regioninfo(-r)/sectormap(-s) as options to mtdinfo so users
> get the extended info only when they ask for it

...

> i'll take care of this as i implement regioninfo/islocked in libmtd

Many thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
