Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XADsC-0006X9-DV
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 07:55:32 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, bpqw <bpqw@micron.com>
Subject: RE: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Date: Thu, 24 Jul 2014 07:54:41 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EB068AB@DBDE04.ent.ti.com>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
 <20140724012730.GA3711@ld-irv-0074>
In-Reply-To: <20140724012730.GA3711@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ron@debian.org" <ron@debian.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris
>
>Hi White,
>
>On Thu, Jul 24, 2014 at 01:00:01AM +0000, bpqw wrote:
>> Do nand reset before write protect check
>> If we want to check the WP# low or high through STATUS READ and check bi=
t 7,
>> we must reset the device, other operation (eg.erase/program a locked blo=
ck) can
>> also clear the bit 7 of status register.
>>
>> Signed-off-by: White Ding <bpqw@micron.com>
>> ---
>>  drivers/mtd/nand/nand_base.c |   18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 41167e9..22dd3aa 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -965,6 +965,15 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, u=
int64_t len)
>[...]
>> @@ -1015,6 +1024,15 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, u=
int64_t len)
>[...]
>
>I don't see any in-tree users of nand_{un,}lock(). I recently caught a
>bug in nand_lock() via inspection (still need to send a fix), but I was
>considering dropping the functions entirely.
>
>I presume you have some out-of-tree driver that uses these functions,
>then?
>
Please don't drop nand_{unlock, lock} interfaces at-least for sometime.
I remember there were some users trying to use these for secure
applications. But due to lack of proper userland utility support they
probably dropped the idea.
Good to have this added as part of mtd-utils package, and then let it live
for some more time.


with regards, Pekon
