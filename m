Received: from mail-de.keymile.com ([195.8.104.250])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wg6oI-0008JP-I8
 for linux-mtd@lists.infradead.org; Fri, 02 May 2014 06:19:03 +0000
Message-ID: <536338BA.3040201@keymile.com>
Date: Fri, 02 May 2014 08:18:34 +0200
From: Valentin Longchamp <valentin.longchamp@keymile.com>
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>
Subject: Re: Possible race condition when accessing SPI NOR Flash ?
References: <53623597.8040909@keymile.com>
 <20140501223126.E4CD63809A5@gemini.denx.de>
In-Reply-To: <20140501223126.E4CD63809A5@gemini.denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bigler,
 Stefan" <Stefan.Bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Wolfgang,

On 05/02/2014 12:31 AM, Wolfgang Denk wrote:
> Dear Valentin,
> 
> In message <53623597.8040909@keymile.com> you wrote:
>>
>> Now when fw_setenv ([1], [2]) updates the environment variables, it sometimes
>> (approximately 1 out of 100 runs) triggers such kernel errors:
> ...
>> I see the same behavior with both the 2013.10 and the 2014.04 releases of
>> u-boot/fw_env. The kernel we are using is 3.10.36.
>>
>> I suspect that the problem is related to SPI NOR/m25p80 driver: on the system we
>> have a NAND Flash device with UBI volumes. If I create 2 ubi volumes on the NAND
>> Flash and configure fw_setenv (/etc/fw_env.config) to use them instead of the
>> the mtd devices targetting the s25fl256s1, I am not able to reproduce the
>> problem, even over more than 10'000 runs.
> 
> Um... this is _Linux_ crashing - at this point the U-Boot driver has
> nothing to do with it..  If there is a problem, then with the Linux
> kernel / driver code.  I guess you should rather post this on the MTD
> mailing ist.
> 

Yes, it was clear for me that this is Linux crashing, as I write "it [..]
triggers [..] kernel errors." I have posted it to the linux-mtd ML, I have just
added the u-boot ML as CC since fw_env is u-boot code and it triggers it, so I
though it could be of interest.

Best regards,

Valentin
