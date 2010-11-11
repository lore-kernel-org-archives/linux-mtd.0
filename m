Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGbkw-0002yl-UR
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2010 18:20:19 +0000
Received: by ewy19 with SMTP id 19so1269246ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Nov 2010 10:20:17 -0800 (PST)
Message-ID: <4CDC338F.30600@mvista.com>
Date: Thu, 11 Nov 2010 21:18:55 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
References: <1289462153-4350-1-git-send-email-savinay.dharmappa@ti.com>
In-Reply-To: <1289462153-4350-1-git-send-email-savinay.dharmappa@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: sshtylyov@ru.mvista.com, amakarov@ru.mvista.com,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, David Griego <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Savinay Dharmappa wrote:

> From: David Griego <dgriego@mvista.com>

> OMAP-L137/AM17x has limited number of dedicated EMIFA
> address pins, enough to interface directly to an SDRAM.
> If a device such as an asynchronous flash needs to be
> attached to the EMIFA, then either GPIO pins or a chip
> select may be used to control the flash device's upper
> address lines.
> 
> This patch adds support for the NOR flash on the OMAP-L137/
> AM17x user interface daughter board using the latch-addr-flash
> MTD mapping driver which allows flashes to be partially
> physically addressed. The upper address lines are set by
> a board specific code which is a separate patch.

> Signed-off-by: David Griego <dgriego@mvista.com>

    It's again not clear why you've dropped my and Alexei's signoff. Did we 
request you to do so?

> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>

WBR, Sergei
