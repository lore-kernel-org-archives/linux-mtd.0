Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5vLM-0000ez-AX
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 08:06:16 +0000
Received: by wwp14 with SMTP id 14so239476wwp.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 01:06:14 -0700 (PDT)
Subject: Re: mtd-util, flash_erase: MEMGETOOBSEL on davinci based board fail
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hs@denx.de
Date: Tue, 20 Sep 2011 11:08:55 +0300
In-Reply-To: <4E784790.4010601@denx.de>
References: <4E784790.4010601@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316506142.4849.48.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-20 at 09:58 +0200, Heiko Schocher wrote:
> Hello,
> 
> I tried to use mtd-util:flash_erase on a davinci am1808 based board,
> and get the following error:
> 
> flash_erase -j /dev/mtd5 0 0
> flash_erase: error!: /dev/mtd5: unable to get NAND oobinfo
>               error 22 (Invalid argument)

What is your kernel version?

-- 
Best Regards,
Artem Bityutskiy
