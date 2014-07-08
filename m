Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4Pkl-0005nP-Lf
 for linux-mtd@lists.infradead.org; Tue, 08 Jul 2014 07:23:52 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: denali: disable usage of subpages
Date: Tue, 8 Jul 2014 07:22:17 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAFC0FE@DBDE04.ent.ti.com>
References: <1398862001-29785-1-git-send-email-bigeasy@linutronix.de>
 <20140430222353.GE2497@norris-Latitude-E6410>
 <536925C0.4060809@linutronix.de>
In-Reply-To: <536925C0.4060809@linutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>,
 Huang Shijie <shijie8@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sebastien,

>From: Sebastian Andrzej Siewior [mailto:bigeasy@linutronix.de]
>>On 05/01/2014 12:23 AM, Brian Norris wrote:
>> On Wed, Apr 30, 2014 at 02:46:41PM +0200, Sebastian Andrzej Siewior wrot=
e:
>>> I use this driver on an Altera SoC (not MRST) and its ECC algorithm
>>> does not compute 0xff ECC of an empty page. That problem can be easily
>>> noticed if ubifs is used. Therefore I disable subpages support.
>>>
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>> ---
>>> I can't test if this is also the case for MRST or not.
>>
>> This is an important change to get right; if any systems have been using
>> Denali NAND with subpage writes, then this change will break any flash
>> with existing UBI data. Can we either confirm that no Denali systems
>> were using subpage writes successfully, or else tie this option to some
>> kind of platform data or DT information (e.g., compatible string)?
>
>First I would like to get some confirmation from the MRST hackers /
>users to make sure subpage write works for them (which I doubt).
>
>> Or is this related to commit 837a6ba4f3b6d23026674e6af6b6849a4634fff9,
>> which changed subpage write support? (Or conversely, could this help you
>> support subpage writes properly?)
>
>Not sure. If I look at the write_page() function in delali, it writes
>the whole page in one go. The ECC is transparently added. On read, the
>controller computes the data to fix and the driver just XORs the data
>(with the information the controller provided). And in case the the
>error is not recoverable it checks for an empty page which means 0xff is
>not the ECC for an empty page.
>Based on this I don't see how that commit could help.
>
I have tried fixing the write_subpage generic interface to write only relev=
ant
subpage data to NAND device. However I wasn't able to test it much.
Would it be possible for you to test these?

http://lists.infradead.org/pipermail/linux-mtd/2014-June/054446.html
http://patchwork.ozlabs.org/patch/365537/
http://patchwork.ozlabs.org/patch/365538/

with regards, pekon
