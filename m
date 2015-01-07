Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8pWx-0006fX-U1
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 12:16:08 +0000
Message-ID: <54AD22F4.9020202@imgtec.com>
Date: Wed, 7 Jan 2015 09:13:40 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?UTF-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?= <qiwang@micron.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/6] SPI NAND for everyone
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <20150106033012.GH9759@ld-irv-0074> <54AC4D9D.2050900@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714D979@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7714D979@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Ionela Voinescu <ionela.voinescu@imgtec.com>,
 =?UTF-8?B?IkZyYW5rIExpdQ==?= =?UTF-8?B?IOWImOe+pCAoZnJhbmtsaXUpIg==?=
 <frankliu@micron.com>, Andrew Bresticker <abrestic@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 James Hartley <james.hartley@imgtec.com>,
 =?UTF-8?B?IlBldGVyIFBhbiDmvZjmoIs=?= =?UTF-8?B?IChwZXRlcnBhbmRvbmcpIg==?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/06/2015 09:55 PM, Qi Wang 王起 (qiwang) wrote:
> Hi Brian and Ezequiel,
> 
> On 01/07/2015 5:03 AM, Ezequiel Garcia wrote:
>>
>>
>> On 01/06/2015 12:30 AM, Brian Norris wrote:
>>
>>>> The SPI NAND framework allows devices to register as NAND drivers. This
>> is
>>>> useful to take advantage of the bad block management code.
>>>
>>> I'm not so sure about this choice, but then I'm not so sure about the
>>> alternatives earlier. I understand that you and Qi Wang might have had
>>> some discussion off-list (please feel free to fill me and others in
>>> here, and I can add my thoughts).
>>>
>>
>> Indeed, I believe Qi Wang have these same concerns.
> 
> Yes, I also consider this a lot. Actually, I already complete a new SPI NAND
> Framework to implement SPI NAND code independent with Parallel NAND.
> Testing on Micron Device is finished, my colleague will send out this 
> patch to community soon for both you review.
> 

Great!

However, I don't think it's a good plan to delay its submission. At this
stage we won't care about the little details, but we are mostly
interested in seeing and discussing the overall approach.

That will allow us to start the discussion earlier.

We'll worry about properly testing it and polishing it later.

"Release early, release often".
-- 
Ezequiel
