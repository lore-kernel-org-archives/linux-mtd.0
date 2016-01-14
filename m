Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJWSt-0005sO-NB
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 01:12:40 +0000
Subject: Re: [RFC] [PATCH] mtd: add tracepoints for mtd_read and mtd_write
To: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <20151117191448.GA5367@dw-nb.local>
 <20151117191801.GA864@dw-nb.local>
 <CAFLxGvxPHN0JcEZShS_QV869U_E+Rdk=DYTCTeUHQ-eiH4_BfA@mail.gmail.com>
 <20160108175741.GO109450@google.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Daniel Walter <dwalter@sigma-star.at>
Message-ID: <5696F5EF.70802@sigma-star.at>
Date: Thu, 14 Jan 2016 02:12:15 +0100
MIME-Version: 1.0
In-Reply-To: <20160108175741.GO109450@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/08/2016 06:57 PM, Brian Norris wrote:
> On Fri, Jan 08, 2016 at 10:33:03AM +0100, Richard Weinberger wrote:
>> On Tue, Nov 17, 2015 at 8:18 PM, Daniel Walter <dwalter@sigma-star.at> wrote:
>>> Add tracepoints to mtd subsystem for read and write
>>> operations. This should allow us to identify applications
>>> which are generating too much reads/writes on a flash-device.
>>>
>>> Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
>>
>> Brian, any comments on this?
> 
> Only a few. I'm not very familiar with writing trace events. I've only
> barely used them! And I haven't run this patch yet.
> 
> But I thought Daniel reported having some difficulty here -- that it
> isn't actually that useful to get real "user" information, since most
> writing/erasing happens from background UBI tasks in practice. So is
> this still the best mechanism for tracking this information? (Even if
> there's better ways to get info directly out of UBI, I guess maybe it'd
> still be good to have this infrastructure.)
> 
> Also, maybe I'm missing something, but it doesn't look like this
> attempts to record *which* MTD is being accessed, right? I'd think
> logging mtd->name could help?
> 
> Brian
> 
Hi,

sorry for the late reply, filters ate your mail :/
I'll add mtd->name, since this sounds like a great idea.
regarding your other mail (mtd_erase/read/write_oob), I'll add
tracepoints for them as well (they have been on my list anyway).

Thanks for the input, expect a v2 later this week.

cheers,

daniel
