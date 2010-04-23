Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5JPG-0000GU-JE
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 13:58:59 +0000
Received: by ey-out-1920.google.com with SMTP id 4so678530eyg.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Apr 2010 06:58:56 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <4BD12FCC.2070307@free.fr>
References: <20100422083545.17166.17822.stgit@shiryu.yomgui.biz>
	<20100422083606.17166.52192.stgit@shiryu.yomgui.biz>
	<4BD12FCC.2070307@free.fr>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 23 Apr 2010 15:58:36 +0200
Message-ID: <l2nb8e9195f1004230658kb3ec4b95v60f59b4258e02612@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] mtd: cfi_cmdset_0002: do not fail on no extended
	query table as they are both optional
To: Chris Moore <moore@free.fr>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

2010/4/23 Chris Moore <moore@free.fr>:
> It is not your fault, Guillaume, but this whole "Assuming top" stuff is
> completely bogus :(
> (The most obvious, but not the only, bug is that it actually sets bootloc to
> 2 which is bottom :( )
>
> Uwe Kleine-Koenig submitted a patch for this ages ago which I tried to ping.
> See these threads :
> http://thread.gmane.org/gmane.linux.drivers.mtd/22176
> http://thread.gmane.org/gmane.linux.drivers.mtd/22266
>
> *Please*, David, could we get this cleaned up?

I've resent Uwe's patch, and re-based mine as v4.

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
