Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmUzQ-0005If-F6
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 15:26:08 +0000
Message-ID: <49CA4D02.3080009@grandegger.com>
Date: Wed, 25 Mar 2009 16:25:54 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>	<1237975701-23201-2-git-send-email-wg@grandegger.com>
	<20090325145719.GA32313@oksana.dev.rtsoft.ru>
In-Reply-To: <20090325145719.GA32313@oksana.dev.rtsoft.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anton,

Anton Vorontsov wrote:
> Hi Wolfgang,
> 
> On Wed, Mar 25, 2009 at 11:08:18AM +0100, Wolfgang Grandegger wrote:
>> This patch adds support for multi-chip NAND devices to the FSL-UPM
>> driver. This requires support for multiple GPIOs for the RNB pins.
>> The NAND chips are selected through address lines defined by the
>> FDT property "chip-offset".
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
> 
> Some cosmetic issues are still there...

Normally I use checkpatch.pl to validate my patches, but ... grrr,
sorry. It finds all the obvious issues you reported.

[snip]

> When the cosmetic issues are fixed, I'll readily ack this patch.

Thanks, will resend a.s.a.p.

Wolfgang.
