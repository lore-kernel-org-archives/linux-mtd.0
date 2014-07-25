Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAVGr-0006WI-An
 for linux-mtd@lists.infradead.org; Fri, 25 Jul 2014 02:30:09 +0000
From: bpqw <bpqw@micron.com>
To: Brian Norris <computersforpeace@gmail.com>, "Gupta, Pekon" <pekon@ti.com>
Subject: RE: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Date: Fri, 25 Jul 2014 02:29:18 +0000
Message-ID: <CB9F11E856CFD04BB18EC1C68F2598931B11F2@NTXXIAMBX01.xacn.micron.com>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
 <20140724012730.GA3711@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EB068AB@DBDE04.ent.ti.com>
 <20140724165633.GF3711@ld-irv-0074>
In-Reply-To: <20140724165633.GF3711@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: bpqw <bpqw@micron.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ron@debian.org" <ron@debian.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>OK, I won't drop them yet.

>As you note, there's no user-space support. There's actually no one using =
them even in the kernel, which is why I considered dropping them.
>If you want to use them, find a proper way to use them then! (I'm not
>sure: do they match with mtd_lock() / ioctl(MEMLOCK) interface?)

How about my patch, Do you think there is any other need to change?

White
