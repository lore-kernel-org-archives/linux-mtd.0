Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTjB-0001ge-ET
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 15:56:55 +0000
Received: by mail-wj0-x242.google.com with SMTP id jb2so26896257wjb.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 07:56:32 -0800 (PST)
Subject: Re: [PATCH] mtd: Allocate bdi objects dynamically
To: Sandeep Jain <Sandeep_Jain@mentor.com>
References: <Sandeep_Jain@mentor.com>
 <1470319275-9465-1-git-send-email-Sandeep_Jain@mentor.com>
 <CAFLxGvx6B02c+HgYwJ8exVLT6owrkQL1Rq+X6VzUDKVUxE=aoQ@mail.gmail.com>
 <20161103113421.GA4873@mentor.com>
 <4055a3ed-c024-4c29-45e1-e600cdc5902e@gmail.com>
 <20161129081204.GA6617@mentor.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Steve Longerbeam <steve_longerbeam@mentor.com>,
 LKML <linux-kernel@vger.kernel.org>, Jim Baxter <jim_baxter@mentor.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2339c911-3399-e69b-aabc-f7d57d26af7d@gmail.com>
Date: Thu, 1 Dec 2016 16:39:23 +0100
MIME-Version: 1.0
In-Reply-To: <20161129081204.GA6617@mentor.com>
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

On 11/29/2016 09:12 AM, Sandeep Jain wrote:
> Dear Maintainers,
>    This patch is already reviewed twice with no issues.
> Requesting your attention for patch merge.
> 
> Thanks & Regards,
> Sandeep Jain
> 
> On Sat, Nov 05, 2016 at 08:22:31AM +0100, Marek Vasut wrote:
>> On 11/03/2016 12:34 PM, Sandeep Jain wrote:
>>> Dear Maintainers,
>>>   This patch is reviewed by Richard.
>>> Requesting for Maintainer's attention for patch merge.
>>>
>>> Thanks & Regards,
>>> Sandeep Jain
>>>
>>> On Sat, Sep 17, 2016 at 04:41:47PM +0200, Richard Weinberger wrote:
>>>> On Thu, Aug 4, 2016 at 4:01 PM, Sandeep Jain <Sandeep_Jain@mentor.com> wrote:
>>>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>>
>>>>> The MTD backing dev info objects mtd_bdi was statically allocated.
>>>>> So when MTD is built as a loadable module, this object fall in the
>>>>> vmalloc address space.
>>>>>
>>>>> The problem with that, is that the BDI APIs use wake_up_bit(), which calls
>>>>> virt_to_page() to retrieve the memory zone of the page containing the
>>>>> wait_queue to wake up, and virt_to_page() is not valid for vmalloc or
>>>>> highmem addresses.
>>>>>
>>>>> Fix this by allocating the BDI objects dynamically with kmalloc. The
>>>>> objects now fall in the logical address space so that BDI APIs will
>>>>> work in all cases (mtd builtin or module).
>>>>>
>>>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>> Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
>>>>> Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
>>>>
>>>> Reviewed-by: Richard Weinberger <richard@nod.at>
>>
>> I don't see any obvious problem either:
>> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Bump?

-- 
Best regards,
Marek Vasut
