Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2h4s-0004mR-FO
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 10:15:55 +0000
Received: by pzk4 with SMTP id 4so6443167pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 03:15:48 -0700 (PDT)
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Sun, 11 Sep 2011 13:18:12 +0300
In-Reply-To: <4E6A25B1.8070400@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1315280704.19067.14.camel@sauron> <1315282208.19067.24.camel@sauron>
	<201109081726.00769.arnd@arndb.de> <1315569206.7905.41.camel@sauron>
	<4E6A25B1.8070400@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315736297.18731.1.camel@sauron>
Mime-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-embedded <linux-embedded@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-09 at 16:41 +0200, David Wagner wrote:
> > 1. Stick with the own cdev approach - the driver becomes very simple
> >    in this case - we review it.
> 
> This is the way it's implemented in v4, right ? 

Yes, but I though I sent you some feed back with minor things as well as
with major issue related to race condigions: you should keep the UBI
volume open as long as your block device is referenced, to prevent the
UBI volume from being removed.

-- 
Best Regards,
Artem Bityutskiy
