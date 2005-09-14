Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFWx6-0005dk-8P
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 09:05:34 -0400
Message-ID: <4328200F.7050306@ipi.ac.ru>
Date: Wed, 14 Sep 2005 17:05:19 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: Aras Vaichas <arasv@magellan-technology.com>
References: <43267172.20702@magellan-technology.com>	<432691B7.5040804@magellan-technology.com>
	<4327A4F8.60300@magellan-technology.com>
In-Reply-To: <4327A4F8.60300@magellan-technology.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2+NAND problem in 2.6.13-at91
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

Aras Vaichas wrote:
> I did a diff between the nand_base.c version shipped with 2.6.13 (v1.147) and
> 2.6.12-rc1 (v1.138) and noticed that a delay loop had been moved further down
> the code, I moved this delay back to where it was in v1.138 and it is now
> working again. i assume that there was a probably a good reason to move this
> delay in the first place though and I don't wish to break anything else ...

The delay_loop calibration logic has been changed in 2.6.13.
It might break udelay() on some architectures.

--
Regards.
	Tim.
