Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3HoC-0001nK-Uj
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 04:10:29 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Huang Shijie
 <b32955@freescale.com>
Subject: RE: [PATCH v4 1/5] mtd: nand: localize ECC failures per page
Date: Wed, 15 Jan 2014 04:10:00 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA61A32@DBDE04.ent.ti.com>
References: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
 <20140114023439.GA22730@shlinux2.ap.freescale.net>
 <20140114073652.GL1992@norris-Latitude-E6410>
In-Reply-To: <20140114073652.GL1992@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Chen, Rich" <richchen@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Hsu,
 Hacker \(Hacker.Hsu@avnet.com\)" <Hacker.Hsu@avnet.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Tue, Jan 14, 2014 at 10:34:40AM +0800, Huang Shijie wrote:
>> On Mon, Jan 13, 2014 at 11:44:36AM -0800, Brian Norris wrote:
>> > ECC failures can be tracked at the page level, not the do_read_ops lev=
el
>> > (i.e., a potentially multi-page transaction).
>> >
>> > This helps prepare for READ RETRY support.
>> >
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> > ---
>
>[...]
>
>> Please add my acks to all the patch set:
>> Acked-by: Huang Shijie <b32955@freescale.com>
>
>Thanks! Done, and pushed to l2-mtd.git.
>
Thanks Brian and Shijie for getting this READ_RETRY feature in kernel.

Sorry, I din't had any MLC NAND locally at my place, so couldn't help in
Testing these patches, but I know these would be helpful later. As
we observed quite frequent failures due to read-disturb bit-flips on MLC
NANDs, and I hope these patches would reduce such failures.


with regards, pekon
