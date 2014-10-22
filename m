Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgtWD-0005Hz-0g
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 10:51:54 +0000
Message-ID: <54478C2F.9080208@nod.at>
Date: Wed, 22 Oct 2014 12:51:27 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubiformat: Leave space for fastmap anchor
References: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
 <1413964111-4048-3-git-send-email-s.hauer@pengutronix.de>
 <54476785.5020603@nod.at> <544768A5.5000505@codeaurora.org>
 <54476C0F.4050603@nod.at> <54478B6A.4020106@codeaurora.org>
In-Reply-To: <54478B6A.4020106@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.10.2014 um 12:48 schrieb Tanya Brokhman:
> On 10/22/2014 11:34 AM, Richard Weinberger wrote:
>> Am 22.10.2014 um 10:19 schrieb Tanya Brokhman:
>>> I care :) Its in my TODO to update ubinize to leave space for fastmap anchor (and perhaps generate a fastmap data as well but this is just a thought).
>>
>> While talking about fastmap TODOs, here you can find my fastmap patch queue:
>> https://git.kernel.org/cgit/linux/kernel/git/rw/misc.git/log/?h=ubi-current
>>
>> These patches are *not* ready for mainline, some of them need a rewrite
>> to meet all design goals of UBI. But maybe the one or other fixes an issue
>> which is on your TODO list. :-)
>>
>> Thanks,
>> //richard
>>
> 
> thanks! it's very helpful! and just to combine the reply in one email:
> 
> "Please generate the fastmap data such that upon the very first attach fastmap can be used."
> 
> This is what I was thinking. Its doable, right? since in ubinize we have all data required for constructing fastmap.

Of course it is doable. :)

> From all your discussions with Artem I figure we can expect quite a few changes to the fastmap implementation. Is the layout also going to change? I remember you mentioning such
> idea in one of the emails.

So far the layout is not going to change.

Thanks,
//richard
