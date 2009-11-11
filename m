Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N885B-0005rW-8B
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 07:57:41 +0000
Subject: Re: [PATCH v2] mtd: add lock fixup for AT49BV640D and AT49BV640DT
	chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
In-Reply-To: <1257432817-20786-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1257432817-20786-1-git-send-email-hans-christian.egtvedt@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Nov 2009 09:57:16 +0200
Message-Id: <1257926236.21596.873.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, nico@fluxnic.net
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-11-05 at 15:53 +0100, Hans-Christian Egtvedt wrote:
> This patch sets the MTD_POWERUP_LOCK flag for AT49BV640D and AT49BV640DT
> devices, since the devices are locked when powered up and needs to be unlocked
> before interfaced.
> 
> Quote datasheet; "At power-up and reset, all sectors have their Softlock
> protection mode enabled.".
> 
> Tested on AVR32 hardware platform with an AT49BV640D flash device.
> 
> Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

Applied to my l2-mtd-2.6 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
