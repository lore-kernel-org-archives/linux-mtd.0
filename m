Subject: Re: [PATCH] mtd: nand: lpc32xx: fix invalid error handling of a
 requested irq
To: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20161205014710.2015-1-vz@mleia.com>
 <20170103101259.0ec123df@bbrezillon>
 <72ab91ec-a919-af42-8a82-f5d99b245edf@mleia.com>
 <20170103114746.141d7d7d@bbrezillon> <20170105175851.GC50438@google.com>
Cc: Richard Weinberger <richard@nod.at>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <a5970a47-56c9-4b10-6edb-6cd123eac60c@mleia.com>
Date: Thu, 5 Jan 2017 20:19:13 +0200
MIME-Version: 1.0
In-Reply-To: <20170105175851.GC50438@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/05/2017 07:58 PM, Brian Norris wrote:
> On Tue, Jan 03, 2017 at 11:47:46AM +0100, Boris Brezillon wrote:
>> On Tue, 3 Jan 2017 12:16:26 +0200
>> Vladimir Zapolskiy <vz@mleia.com> wrote:
>>> On 01/03/2017 11:12 AM, Boris Brezillon wrote:
>>>> Do you need to backport this fix to stable releases? If that's the
>>>> case, I'll add the Cc: stable tag when applying.  
>>>
>>> that will be great if you can add
>>>
>>> Cc: stable@kernel.org # v4.7+
>>>
>>> Please feel free to add also the tag
>>>
>>> Fixes: 8cb17b5ed017 ("irqchip: Add LPC32xx interrupt controller driver")
>>
>> Applied to nand/next (this patch will appear in 4.11).
> 
> For next time, checkpatch noticed that you got the stable address wrong:
> 
> ERROR:STABLE_ADDRESS: The 'stable' address should be 'stable@vger.kernel.org'
> #17: Cc: stable@kernel.org # v4.7+
> 
> Brian
> 

sorry, I've git-logged to commit 52bce91165 and pasted the address from
its commit message.

--
With best wishes,
Vladimir
