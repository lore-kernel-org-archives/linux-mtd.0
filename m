Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTlU2-0007gZ-HJ
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 06:43:55 +0000
Message-ID: <55DABBAC.9040401@cn.fujitsu.com>
Date: Mon, 24 Aug 2015 14:37:32 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mkfs.ubifs: remove the check for UBIFS_MAX_LEB_SZ
References: <1439873555-5352-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439887948.31419.118.camel@gmail.com> <55DA6E69.8070301@cn.fujitsu.com>
 <1440397943.15510.2.camel@gmail.com>
In-Reply-To: <1440397943.15510.2.camel@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/24/2015 02:32 PM, Artem Bityutskiy wrote:
> On Mon, 2015-08-24 at 09:07 +0800, Dongsheng Yang wrote:
>> On 08/18/2015 04:52 PM, Artem Bityutskiy wrote:
>>> On Tue, 2015-08-18 at 12:52 +0800, Dongsheng Yang wrote:
>>>> There is a commit 92ed6c0 to increase UBIFS_MAX_LEB_SZ
>>>> to 2MiB. But recently, as the leb size become larger and
>>>> larger, 2MiB is not a suitable limit any more.
>>>>
>>>> Then remove this check in mkfs.ubifs
>>>>
>>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>>> ---
>>>> NOTE:
>>>> 	I am not sure the reason why we have to
>>>> limit the leb size in mkfs.ubifs. Because
>>>> I did not find any reason for it, I send
>>>> this patch out. It's very possible I am
>>>> mising something.
>>>
>>> Well, this is sanity check for the user input. If you accidentally
>>> added few zeroes, we want to spot this and inform you, and you may
>>> appreciate that we did not just created a bugus image for you.
>>> That's
>>> the idea.
>>
>> Sorry, Artem, I was trying to understand it, but I did not got the
>> point. Could you give me some more information about the idea? Maybe
>> an example?
>
> Well, this is defensive programming concept.

Ha, okey, got it. That's good.

But I got a device with ped_size=32M. (Although that would affect
ubi/ubifs performance negatively, that's another topic) I am
not sure increasing the MAX_LEB_SIZE to 32M is a good idea, at least
I don't think it's convincing to others that "I have a device with 32M
peb, so I will increase it to 32M". Could you give me some more suggestion?

Thanx

> Something goes wrong, due
> to bad user input and/or a bug we get to this place with an bogus size.
> This check catches it and errors out versus we just go forward,
> generate a bugus image, which you then flash and find that things do
> not work, and then spend your time for further investigations. Nothing
> more than that.
>
> Artem.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
