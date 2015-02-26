Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YR3No-0003qt-IC
 for linux-mtd@lists.infradead.org; Thu, 26 Feb 2015 18:42:01 +0000
Message-ID: <54EF684B.4000604@imgtec.com>
Date: Thu, 26 Feb 2015 15:39:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] An alternative to SPI NAND
References: <71CF8D7F32C5C24C9CD1D0E02D52498A7714DD2A@NTXXIAMBX02.xacn.micron.com>
 <54ADF90B.1070800@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714F043@NTXXIAMBX02.xacn.micron.com>
 <54BE2F7B.60003@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A77151E62@NTXXIAMBX02.xacn.micron.com>
 <54CA75F6.5020803@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A04AE751@NTXXIAMBX02.xacn.micron.com>
 <54CB6F51.2070403@imgtec.com> <20150131070204.GA3692@norris-Latitude-E6410>
 <54EB481A.8080606@imgtec.com> <20150224035402.GD18140@ld-irv-0074>
In-Reply-To: <20150224035402.GD18140@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: =?UTF-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?= <qiwang@micron.com>,
 Andrew Bresticker <abrestic@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?IkZyYW5rIExpdSDliJjnvqQgKGZyYW5rbGl1KSI=?= <frankliu@micron.com>,
 =?UTF-8?B?Ik1lbGFuaWUgWmhhbmcg5byg54eVIChtZWxhbmll?= =?UTF-8?B?emhhbmcpIg==?=
 <melaniezhang@micron.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 James Hartley <james.hartley@imgtec.com>,
 =?UTF-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZyki?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 02/24/2015 12:54 AM, Brian Norris wrote:
> On Mon, Feb 23, 2015 at 12:32:42PM -0300, Ezequiel Garcia wrote:
>> On 01/31/2015 04:02 AM, Brian Norris wrote:
>>> Unless someone else thinks they have an excellent handle on the above,
>>> I'll take a stab at doing this. I actually have a few patches that have
>>> hung around a while (with little incentive to finish them) that do parts
>>> of what I'm suggesting above.
>>
>> Any progress with this?
>>
>> You outlined the plan quite clearly, so perhaps I can help you by
>> putting together some patches? If you have some work-in-progress stuff,
>> I can even start there.
> 
> I did quite a decent chunk of work a few weeks back, but I didn't have
> time to finish it in my free time. The day job has distracted me from my
> less urgent tasks.
> 
> Anyway, I had queued up stuff here:
> 
> http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/nand-bbt
> 
> Take a look if you'd like. I could post the first couple, I guess, but
> the last is definitely not complete. I can flesh out the TODO list a bit
> better, if you really want to pick it up.
>

I think the first four patches are nice cleanups, so if you can submit
them it would be great.

-- 
Ezequiel
