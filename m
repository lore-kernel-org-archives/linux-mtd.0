Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xxy2I-0005oy-Gi
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 13:07:35 +0000
Message-ID: <5485A27B.5060409@nod.at>
Date: Mon, 08 Dec 2014 14:07:07 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, dedekind1@gmail.com
Subject: Re: [PATCH 3/6] UBI: Fastmap: Notify user in case of an
 ubi_update_fastmap() failure
References: <1417347340-6872-1-git-send-email-richard@nod.at>
 <1417347340-6872-4-git-send-email-richard@nod.at>
 <54845D53.1070903@codeaurora.org> <548462A8.2010107@nod.at>
 <54854C28.4050107@codeaurora.org> <54856B54.7020306@nod.at>
 <5485A0E8.4050901@codeaurora.org>
In-Reply-To: <5485A0E8.4050901@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.12.2014 um 14:00 schrieb Tanya Brokhman:
>>>> Maybe the case you've described is powercut safe, but there can be other unsafe cases.
>>>> Let's stay on the safe side and be paranoid, it does not hurt.
>>>> If fastmap has proven stable we can start with tricky optimizations.
>>>
>>> I'm sorry that I'm being petty here but the commit msg states that you "notify the user in case of update fastamap failure". It says nothing about you failing ubi_wl_get_peb as
>>> well. And this is a major change. At least divide this into 2 patches (so I can disagree to the function failing and agree to the msg to user :) )
>>
>> With user I meant users of that function.
> 
> I still don't like it.
> Leaving this one for Artem... sorry

As I said, as soon we all consider fastmap mature and stable we can start with optimizations.
But as of now I want all logic to be on the safe side. This is how all fastmap code is designed.

Thanks,
//richard
