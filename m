Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfVOj-0003dT-ES
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 18:08:04 +0000
Subject: Re: Regarding UBI/UBIFS corruptions during random power-cuts.
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, bhuvanchandra.dv@toradex.com
References: <c44fc096-c994-5b63-2647-1774e8406c0c@codeaurora.org>
 <1ad7c77f-98e3-5d70-aa62-b72431000415@nod.at>
 <cd3ca825-82b4-857d-b5bd-d9f8947a434a@codeaurora.org>
 <f832b55f-a914-efae-6292-431959edf414@nod.at>
 <bc9517c3-b0c7-b971-75ab-0b17a2ce8af9@codeaurora.org>
 <16715a18-6a98-5add-f744-d2c356ce17be@codeaurora.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <8a65ad9b-b647-9ce2-d74f-400e3c201b09@nod.at>
Date: Wed, 9 Aug 2017 20:07:34 +0200
MIME-Version: 1.0
In-Reply-To: <16715a18-6a98-5add-f744-d2c356ce17be@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ritesh,

Am 09.08.2017 um 17:23 schrieb Ritesh Harjani:
>>> Have you been able to trigger it again on your target?
>> Yes, we tried reproducing with chk_fs enabled. But could not reproduce it yet (earlier we were trying without chk_fs enabled). We will continue to retry for more time. Is there
>> anything specific scenario you think I should include in power on/off to reproduce this issue. The test(with chk_fs enabled) is still running since 6-7 hours.
> 
> This could not be reproduced yet. Ran tests for overnight.
> Do you have anything else for us to try? Also kindly loops us in whenever you have any updates on the fix of this issue :)

First of all, we don't know whether this issue is related in any kind.
99% of all UBIFS issue I get in touch with (mostly off list) have their roots in driver and hardware specific issues.

Make sure that you do a "real" power-cut. i.e. make sure that the board really loses all power.
A plain chip reset often does not trigger these issues because the NAND still has power to complete.

Thanks,
//richard
