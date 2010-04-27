Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6ej4-0002Ri-NE
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 06:56:59 +0000
Received: by fg-out-1718.google.com with SMTP id e21so2680688fga.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Apr 2010 23:56:56 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1272334774-17019-2-git-send-email-w.sang@pengutronix.de>
References: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
	<1272334774-17019-2-git-send-email-w.sang@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 27 Apr 2010 08:56:35 +0200
Message-ID: <v2pb8e9195f1004262356s1cbd644fne77dcdc9cd353d66@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/chips: use common manufacturer codes in
	jedec_probe()
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram,

2010/4/27 Wolfram Sang <w.sang@pengutronix.de>:
> Factor out old manufacturers and use the generic ones from cfi.h
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>

Acked-by: Guillaume LECERF <glecerf@gmail.com>

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
