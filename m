Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIhfI-0006hr-8r
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 16:49:00 +0000
Received: by mail-ob0-f181.google.com with SMTP id wo20so1046682obc.12
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 08:48:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1393422939-25360-1-git-send-email-zajec5@gmail.com>
References: <1393422939-25360-1-git-send-email-zajec5@gmail.com>
Date: Wed, 26 Feb 2014 17:48:38 +0100
Message-ID: <CACna6ry9mtujhnnTS5hChKHMx5yD3Aj0F2-69UV1fkRtX8o=xw@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-02-26 14:55 GMT+01:00 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> Home routers based on SoCs like BCM53010 (AKA BCM4708) use flashes
> which can be nicely partitioned with bcm47xxpart.

This one is wrong (I forgot I have more local changes), drop it please.
