Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhjqS-00065J-Rh
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 18:12:01 +0000
Message-ID: <536925C0.4060809@linutronix.de>
Date: Tue, 06 May 2014 20:11:12 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: denali: disable usage of subpages
References: <1398862001-29785-1-git-send-email-bigeasy@linutronix.de>
 <20140430222353.GE2497@norris-Latitude-E6410>
In-Reply-To: <20140430222353.GE2497@norris-Latitude-E6410>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/01/2014 12:23 AM, Brian Norris wrote:
> On Wed, Apr 30, 2014 at 02:46:41PM +0200, Sebastian Andrzej Siewior wrote:
>> I use this driver on an Altera SoC (not MRST) and its ECC algorithm
>> does not compute 0xff ECC of an empty page. That problem can be easily
>> noticed if ubifs is used. Therefore I disable subpages support.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>> I can't test if this is also the case for MRST or not.
> 
> This is an important change to get right; if any systems have been using
> Denali NAND with subpage writes, then this change will break any flash
> with existing UBI data. Can we either confirm that no Denali systems
> were using subpage writes successfully, or else tie this option to some
> kind of platform data or DT information (e.g., compatible string)?

First I would like to get some confirmation from the MRST hackers /
users to make sure subpage write works for them (which I doubt).

> Or is this related to commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9,
> which changed subpage write support? (Or conversely, could this help you
> support subpage writes properly?)

Not sure. If I look at the write_page() function in delali, it writes
the whole page in one go. The ECC is transparently added. On read, the
controller computes the data to fix and the driver just XORs the data
(with the information the controller provided). And in case the the
error is not recoverable it checks for an empty page which means 0xff is
not the ECC for an empty page.
Based on this I don't see how that commit could help.

> 
> Brian

Sebastian
