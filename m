Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNh2Q-0006cr-BI
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 11:09:30 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v6 1/4] mtd: devices: elm: check for hardware engine's
 design constrains
Date: Wed, 12 Mar 2014 11:08:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB2B1C@DBDE04.ent.ti.com>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
 <1394197344-9468-2-git-send-email-pekon@ti.com>
 <20140310133550.GA5994@arch.cereza>
In-Reply-To: <20140310133550.GA5994@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Balbi, Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

>From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
 [...]
>Altough it's just a nitpick, I think you can work a bit on your explanatio=
ns.
>For instance, you start with a capital letter after a comma (1K, So it..).
>
>And you have some incomplete sentences (This patch adds *the* following).
>
>I'm not a native english speaker, so I know this can be hard! It's not a h=
ard
>requirement for the patch, but rather just a suggestion to improve your up=
stream
>work.
>
Thanks much for review on this and other patches. I'll try to be more caref=
ul
with my English next time. I'll incorporate your feedbacks in next version,
But before sending next version, I'll wait for:
- if Brian has any other feedbacks on this and previous series.
- And acceptance/conclusion on following discussions..
	"mtd: nand: omap: optimized chip->ecc.correct() for H/W ECC schemes"
	"mtd: nand: add erased-page bitflip correction" from Brain Norris


with regards, pekon
