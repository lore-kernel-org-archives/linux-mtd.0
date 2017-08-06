Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deHVu-0002d5-MW
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 09:06:24 +0000
Subject: Re: Regarding UBI/UBIFS corruptions during random power-cuts.
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, bhuvanchandra.dv@toradex.com
References: <c44fc096-c994-5b63-2647-1774e8406c0c@codeaurora.org>
 <1ad7c77f-98e3-5d70-aa62-b72431000415@nod.at>
 <cd3ca825-82b4-857d-b5bd-d9f8947a434a@codeaurora.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <f832b55f-a914-efae-6292-431959edf414@nod.at>
Date: Sun, 6 Aug 2017 11:05:52 +0200
MIME-Version: 1.0
In-Reply-To: <cd3ca825-82b4-857d-b5bd-d9f8947a434a@codeaurora.org>
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

Am 27.07.2017 um 16:11 schrieb Ritesh Harjani:
>> The error you're facing is rather generic.
>> In our case we can reproduce the issue very reliable when we enable the UBIFS /sys/kernel/debug/ubifs/chk_fs debugfs knob.
>> Can you please also try? Please note that chk_fs will make mounting UBIFS very slow.
>>
>> I'm very interested in your results, maybe it helps tracking down the root cause.
> Sure, I will give this a shot and let you know the outcome.

Have you been able to trigger it again on your target?

Thanks,
//richard
