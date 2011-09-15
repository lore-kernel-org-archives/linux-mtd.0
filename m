Message-ID: <4E7218A0.2020309@eurekelettronica.it>
Date: Thu, 15 Sep 2011 17:24:16 +0200
From: gianluca <gianlucarenzi@eurekelettronica.it>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v12 0/3] add the GPMI controller driver for IMX23/IMX28
References: <1315450031-6371-1-git-send-email-b32955@freescale.com>	<20081.44941.12535.496764@ipc1.ka-ro>
	<4E71CDB2.4000205@freescale.com>
In-Reply-To: <4E71CDB2.4000205@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: dedekind1@gmail.com, koen.beel.barco@gmail.com, w.sang@pengutronix.de,
	marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
	shijie8@gmail.com, s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for intrusion in this discussion, but:

Huang Shijie wrote:
>> channels are being used concurrently. The GPMI driver will bail out
>> with the timeout error while the MMC driver obviously has no timeout
>> check for this situation.
>>
>> I can mostly rule out HW problems, because the same board works
>> perfectly well with WindowsCE (tested with a copy operation between
>> flash and SD card).
>>
>>
>> Lothar Waßmann

@Lothar: Probably WinCE with a copy operation between flash and SD is 
not reliable as synchronous as opposed dd command in the previous mail.

dd is sync when: dd if=/dev/mtd... of=/dev/mmc...

dd is async when:

# dd if=/dev/mtd of=/mnt/somewhere/file1 &
# dd if=/mnt/somewhere/file2 of=/dev/mmc &

Or even the worst scenario:

# dd if=/dev/mtdX of=/dev/null &
# dd if=/dev/urandom of=/dev/mmcX &
# dd if=/dev/mmcX of=/dev/null &
# dd if=/dev/urandom of=/dev/mtdX &

Just my .2 cents.

Best regards,
-- 
            ,,,
           (o o)
======oOO==(_)==OOo======

Gianluca Renzi
R&D
phone: +39.0542.609120
fax:   +39.0542.609212

       .oooO  Oooo.
======(   )==(   )=======
        \ (    ) /
         \_)  (_/
