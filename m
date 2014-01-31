Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W981T-0007wd-CQ
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 06:56:19 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Date: Fri, 31 Jan 2014 06:55:49 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6C9BF@DBDE04.ent.ti.com>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C83A@DBDE04.ent.ti.com>
 <20140130195107.GB10673@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA6C85E@DBDE04.ent.ti.com>
 <20140130204756.GI8919@ld-irv-0074>
In-Reply-To: <20140130204756.GI8919@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>
>Let's stop the nonsense then :)
>
Ok .. :-)

Though its redundant, as Ezequiel has already tested these
patches on AM335x using both x8 and x16 Micron devices.
But still I re-tested them on different OMAP boards.

Tested-By: Pekon Gupta <pekon@ti.com>

with regards, pekon
