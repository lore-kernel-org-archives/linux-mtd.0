Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP9Gc-0001vR-B5
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 14:11:35 +0000
Subject: Re: [PATCH mtd-utils] nanddump: check write function result for errors
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <1468833493-28311-1-git-send-email-zajec5@gmail.com>
 <CAFLxGvxpB-sAS4tsZu4fFVp4OxGdg1nccip-y6fh-V1ffdXQdQ@mail.gmail.com>
 <CACna6ry-AdRH9Yk02piJoc0N4VSWom=_N4dE9_-NDjV4gQQi4g@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <578CE371.9090604@nod.at>
Date: Mon, 18 Jul 2016 16:10:57 +0200
MIME-Version: 1.0
In-Reply-To: <CACna6ry-AdRH9Yk02piJoc0N4VSWom=_N4dE9_-NDjV4gQQi4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafał,

Am 18.07.2016 um 13:59 schrieb Rafał Miłecki:
> On 18 July 2016 at 13:33, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Mon, Jul 18, 2016 at 11:18 AM, Rafał Miłecki <zajec5@gmail.com> wrote:
>>> Errors may happen, it's e.g. easy on embedded devices to run out of space
>>> when dumping big partitions. This patch adds a helper function for
>>> writing. It deals with partial writes and just returns 0 on success or
>>> error number.
>>>
>>> The old code didn't check for errors at all which could result in
>>> incomplete dumps without exiting with an error.
>>
>> Is this patch different from my version, does it fix more?
>> http://lists.infradead.org/pipermail/linux-mtd/2016-April/067234.html
>>
>> Brian, if this is fine with you I'd apply one of these patches.
> 
> I wasn't aware of your patch, having it accepted would save me some
> time for sure.
> 
> Two minor advantages I see in my version:
> 1) It handles partial writes, just retries if only some part of buffer
> has been written

That's a plus point. :-)

> 2) It displays error number and string which may provide some extra
> hint to the user

My patch too since it uses mtd-util's logging functions.
sys_errmsg(...)

Could you please merge both patches and resend?

Thanks,
//richard
