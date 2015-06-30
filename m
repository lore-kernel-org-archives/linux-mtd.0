Received: from us2.outbound.mailhostbox.com ([162.210.70.52])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZA0wO-0007nZ-EC
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 19:11:33 +0000
Message-ID: <5592E9BB.2010007@pek-sem.com>
Date: Wed, 01 Jul 2015 00:40:51 +0530
From: pekon <pekon@pek-sem.com>
MIME-Version: 1.0
To: Willem Atsma <willem.atsma@tanglebridge.com>
CC: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Bug fix in kernel nand driver code for ONFI flash with
 unconfigured buswidth
References: <1435276006-804-1-git-send-email-willem.atsma@tanglebridge.com>
 <55918E99.4030701@pek-sem.com> <559194D8.30001@tanglebridge.com>
In-Reply-To: <559194D8.30001@tanglebridge.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 30 June 2015 12:26 AM, Willem Atsma wrote:
> Thank you for reviewing my patch and the feedback. I understand I am
> creating a "false pass" and that the check is in fact needed to ensure
> the initial setup was correct.  My patch incorrectly fixes this bug as
> configuration fails without a fix.
>
> With the nand I have the configuration will succeed under the following
> conditions:
>
>   - I force ONFI to fail (i.e. make nand_flash_detect_onfi() return 0)
>   - Set the options structure as indicated (and create the false pass).
>
> In nand_get_flash_type() a successful call to nand_flash_detect_onfi()
> results in a jump to ident_done, skipping code that would otherwise
> correctly initialize the chip, including buswidth. This suggested to me
> that:
>
>   - the driver configuration is correctly configured;
>   - failure results from (in this instance) inappropriate comparison
> between ONFI setting and buswidth setting done up to this point.
>
>  From this I understand that the driver setting should have been set to
> NAND_BUSWIDTH_AUTO. The chip can in fact handle either 8 or 16 and is
> connected with 16.
>
Yes, that is correct ..
By default if the NAND_BUSWIDTH_AUTO is set, then driver should start 
the probe in x8 mode, and then switch based on device's bus-width which 
is detected from
- ONFI parameter page, or
- NAND_ID bytes

> Where do I correct/find DT and/or platform-data?
>
It will be in arch specific folder, like for OMAP devices ..
- arch/arm/mach-omap2/board-flash.c
- arch/arm/boot/dts/...


with regards, pekon
