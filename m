Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Td7xE-00086h-ML
 for linux-mtd@lists.infradead.org; Mon, 26 Nov 2012 23:19:09 +0000
Date: Mon, 26 Nov 2012 17:18:48 -0600
From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] mtd: nand: Kconfig: drop utf8 characters
To: Wolfram Sang <wolfram@the-dreams.de>
References: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
In-Reply-To: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de> (from
 wolfram@the-dreams.de on Mon Nov 26 17:07:25 2012)
Message-ID: <1353971928.2383.18@tyr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: Wolfram Sang <wolfram@the-dreams.de>, Martin Walch <walch.martin@web.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/26/2012 05:07:25 PM, Wolfram Sang wrote:
> The Linux Kernel Configuration system (lkc) expects 8 bit characters
> only (declared in scripts/kconfig/zconf.l: %option 8bit).

That option contrasts with being limited to 7-bit characters, not with =20
accepting UTF-8.  It may be that kconfig has problems with UTF-8, but I =20
don't think this is why.

-Scott=
