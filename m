Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177sx3-0001Sw-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 08:11:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000301c1fbdd$053ea3e0$5501a8c0@synso.com.tw> 
References: <000301c1fbdd$053ea3e0$5501a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: yuanfei@eware.com.sg,
    "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: MTD on L7205DB and AM29LV160DT 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 15 May 2002 08:11:08 +0100
Message-ID: <21198.1021446668@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


startec@ms11.hinet.net said:
> MTD distribution does not support AM29LV160DT, so you have to tell mtd
> how to recognize the flash(jedec_probe.c) 

jedec_probe has known about the AM29LV160DT since the first version.

--
dwmw2
