Received: from mail-yw0-f177.google.com ([209.85.211.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mwe5c-0007rW-3b
	for linux-mtd@lists.infradead.org; Sat, 10 Oct 2009 15:42:40 +0000
Received: by ywh7 with SMTP id 7so6308510ywh.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Oct 2009 08:42:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5d587fb0910100756i1ed21291u2aea66ba06247844@mail.gmail.com>
References: <a5d587fb0910100756i1ed21291u2aea66ba06247844@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 10 Oct 2009 11:42:14 -0400
Message-ID: <8bd0f97a0910100842o43956200w6bc644346d7c3eb9@mail.gmail.com>
Subject: Re: broken dependency of drivers/mtd/maps/gpio-addr-flash.o
To: Michal Suchanek <hramrach@centrum.cz>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 10, 2009 at 10:56, Michal Suchanek wrote:
> It tried building the 2.6.32-rc3 kernel for i386.
>
> This file fails to compile if gpiolib is not configured but it is
> possible to select compilation of that file without selecting gpiolib.
>
> I guess I do not need this file because I do not have gpio and it
> really depends on it but drivers in the MTD section seemed to be
> mostly enabled in distribution config and this was a new driver since
> 2.6.30.

patches have already been posted for the issue
-mike
