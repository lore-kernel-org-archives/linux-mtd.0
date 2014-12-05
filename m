Received: from mail-la0-f49.google.com ([209.85.215.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwvHj-0005cD-GW
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 15:59:12 +0000
Received: by mail-la0-f49.google.com with SMTP id hs14so895687lab.36
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 07:58:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BY1PR0301MB122159D7A03464B52CF350C882790@BY1PR0301MB1221.namprd03.prod.outlook.com>
References: <1417731498-13962-1-git-send-email-festevam@gmail.com>
 <BY1PR0301MB122159D7A03464B52CF350C882790@BY1PR0301MB1221.namprd03.prod.outlook.com>
Date: Fri, 5 Dec 2014 13:58:46 -0200
Message-ID: <CAOMZO5Dtu5zqkO425N0KmPNv7wiGUChFkaTyo1oYFdjsbQZt6w@mail.gmail.com>
Subject: Re: [RFC] mtd: fsl-quadspi: Allow driver to probe
From: Fabio Estevam <festevam@gmail.com>
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Fabio.Estevam@freescale.com" <Fabio.Estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 5, 2014 at 1:40 PM, Frank.Li@freescale.com
<Frank.Li@freescale.com> wrote:

>> Calling clk_rate causes the kernel to oops:
>
> It should fix clock part.

Exactly, Frank. I have already sent a clk-im6sx patch to fix this
problem. Thanks
