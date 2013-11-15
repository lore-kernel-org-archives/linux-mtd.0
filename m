Message-ID: <5285D44C.7080501@gmail.com>
Date: Fri, 15 Nov 2013 08:59:08 +0100
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 00/14] Armada 370/XP NAND support
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131114230436.GV9468@ld-irv-0074.broadcom.com>
 <20131114230540.GW9468@ld-irv-0074.broadcom.com>
 <20131114231528.GA9793@localhost>
In-Reply-To: <20131114231528.GA9793@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/2013 12:15 AM, Ezequiel Garcia wrote:
> On Thu, Nov 14, 2013 at 03:05:40PM -0800, Brian Norris wrote:
>> + Daniel (missed the CC)
>>
>> On Thu, Nov 14, 2013 at 03:04:36PM -0800, Brian Norris wrote:
>>> On Thu, Nov 14, 2013 at 06:25:25PM -0300, Ezequiel Garcia wrote:
>>>> * Changes from v4
>>>>
>>>>   * Rebased on top of l2-mtd.git origin/next branch
>>>>
>>>>   * Fixed is_ready flag reset, renamed by a more descriptive
>>>>     and readble "need_wait".
>>>>
>>>
>>> ...
>>>
>>> I think this series is now good as-is. Pushing to l2-mtd.git/next.
>>> Thanks for the efforts! I can submit my extra diff from patch 12 as a
>>> separate patch for review.
>>>
>>> Do you have any available regression tests? Or was there somebody else
>>> we could run this by for some Tested-by's? Daniel Mack, perhaps?
>>
>> Brian
> 
> Yes, if Daniel (or anybody else) can push a Tested-by, that's better because
> he's a "third-party" tester.

Yes. Sorry, I could only partially follow all the discussions around
these patch sets, but I can certainly do a quick regression test on my
pxa3xx platform.

Ezequiel, could you maybe point me to a repository where I can pull
everything from you want me to have a look at?


Thanks,
Daniel
