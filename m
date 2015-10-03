Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiDeQ-0004ea-Ka
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 03:38:23 +0000
Message-ID: <560F4BF8.7070408@cn.fujitsu.com>
Date: Sat, 3 Oct 2015 11:31:04 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
References: <1443631303-22057-1-git-send-email-sudipm.mukherjee@gmail.com>
 <560E50B6.5060103@cn.fujitsu.com> <20151002100133.GC9346@sudip-pc>
 <20151002173847.GG107187@google.com>
In-Reply-To: <20151002173847.GG107187@google.com>
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

On 10/03/2015 01:38 AM, Brian Norris wrote:
> On Fri, Oct 02, 2015 at 03:31:33PM +0530, Sudip Mukherjee wrote:
>> On Fri, Oct 02, 2015 at 05:39:02PM +0800, Dongsheng Yang wrote:
>>> On 10/01/2015 12:41 AM, Sudip Mukherjee wrote:
>>>> We should prevent user to erasing mtd device with an unaligned offset
>>>> or length.
>>>>
>>>> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
>>>> ---
>>>>
>>>> I am not sure if I should add the Signed-off-by of
>>>> Dongsheng Yang <yangds.fnst@cn.fujitsu.com> . He is the original author
>>>> and he should get the credit for that.
>>>
>>> But I had sent a a patch out to fix this problem before your v1.
>>>
>>> http://lists.infradead.org/pipermail/linux-mtd/2015-September/062234.html
>> I didn't know that. I think your v1 was applied.
>
> Sorry if I left any confusion. Dongsheng's v1 was applied and reverted.
> v2 is still under review (and was sent slightly before (?) your v1).

Yea, sorry I should have mentioned it earlier. But I was and am still
in a vacation, then I did not point it out in time.

Sudip, any comment or test for my patch there is always welcome.

Thanx
Yang
> Feel free to comment there.
>
> Brian
> .
>
