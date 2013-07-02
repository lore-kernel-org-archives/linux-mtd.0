Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Utunx-0008Sd-8s
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2013 07:15:13 +0000
Message-ID: <51D27DE0.3000905@ti.com>
Date: Tue, 2 Jul 2013 12:44:40 +0530
From: Mugunthan V N <mugunthanvnm@ti.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 1/4] mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC
 configurations in device_probe
References: <1372010299-30141-1-git-send-email-pekon@ti.com>
 <1372010299-30141-2-git-send-email-pekon@ti.com>
 <1372666588.22014.43.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E29F6@DBDE04.ent.ti.com>
 <51D1BE59.4000203@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E3B5D@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9E3B5D@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "arnd@arndb.de" <arnd@arndb.de>, "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Benoit Cousson \(benoit.cousson@linaro.org\)" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/2/2013 9:44 AM, Gupta, Pekon wrote:
>>>> This does not apply to l2-mtd.git, could you please re-base?
>>>>
>>> [Pekon]: rebased to l2-mtd.git
>>> - updated [Patch 3/4] which conflicted with commit '26331c04' which
>> touched omap2.c.
>>> - Please ignore [Patch 4/4] as it’s a DT update, which adds on top of Benoit's
>> tree (which has NAND node commits too).
>> If you need one patch (DT patch) in the series to be merged in another
>> repository (DT maintainer tree) then separate out that patch as separate
>> series and mention the dependency or need ack from the driver maintainer
>> so that both maintainer can apply the whole series into his repository
>> instead of applying partially here and there.
>>
> Agree. Yes, I should have sent the DT patch separately.
> But I posted all changes as part of single series, as its easy for users to
> Test and Ack them.
> Similarly patches for GPMC (Tony's tree) and NAND (Artem's tree) are
> functionally coupled, So at times I have to send them as part of same series.
> However, I'll clearly mention that in my cover-letter for future patches.
> Thanks for feedback ..
>
>
In that case you can publish your testing branch to a public repo and point to
that repo in your cover letter so that someone who wants to test can test
from your repo which has all dependent patches.

Regards
Mugunthan V N
