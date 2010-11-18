Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ3KG-00028t-99
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 12:10:53 +0000
Received: by ewy19 with SMTP id 19so1839015ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2010 04:10:51 -0800 (PST)
Message-ID: <4CE5175C.2080505@mvista.com>
Date: Thu, 18 Nov 2010 15:09:00 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
References: <1289548911-21243-1-git-send-email-savinay.dharmappa@ti.com>
	<4CE50C64.60001@mvista.com>
	<003c01cb8716$ce4bb750$6ae325f0$@dharmappa@ti.com>
In-Reply-To: <003c01cb8716$ce4bb750$6ae325f0$@dharmappa@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: amakarov@ru.mvista.com, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, 'David Griego' <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 18-11-2010 14:50, Savinay Dharmappa wrote:

>>> OMAP-L137/AM17x has limited number of dedicated EMIFA
>>> address pins, enough to interface directly to an SDRAM.
>>> If a device such as an asynchronous flash needs to be
>>> attached to the EMIFA, then either GPIO pins or a chip
>>> select may be used to control the flash device's upper
>>> address lines.

>>> This patch adds support for the NOR flash on the OMAP-L137/
>>> AM17x user interface daughter board using the latch-addr-flash
>>> MTD mapping driver which allows flashes to be partially
>>> physically addressed. The upper address lines are set by
>>> a board specific code which is a separate patch.

>>      Please add back my signoff, omitted in this version. Some of the code,
>> including a bug fix, was authored by me.

> I'll surely do this. What about your Sign-off on 2/2 patch?

    Already replied.

> Also shall I add
> Aleksey's Sign-off on this patch

    AFAIR, there was his signoff on it, so yes.

> and David's Sign-off on 2/2 patch?

    David didn't touch patch 2/2.

> Thanks,
> Savinay.

WBR, Sergei
