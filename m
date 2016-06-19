Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEcHE-00054T-Bl
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 12:56:36 +0000
Subject: Re: [PATCH v2 6/8] MTD: xway: fix nand locking
To: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-7-git-send-email-hauke@hauke-m.de>
 <20160619144152.4ba4de77@bbrezillon> <576695D4.3000108@nod.at>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <b33bd2fb-4cf6-1acf-8022-fd76f3cf9f06@hauke-m.de>
Date: Sun, 19 Jun 2016 14:56:03 +0200
MIME-Version: 1.0
In-Reply-To: <576695D4.3000108@nod.at>
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

On 06/19/2016 02:53 PM, Richard Weinberger wrote:
> Am 19.06.2016 um 14:41 schrieb Boris Brezillon:
>> On Sat, 18 Jun 2016 21:14:10 +0200
>> Hauke Mehrtens <hauke@hauke-m.de> wrote:
>>
>>> From: John Crispin <john@phrozen.org>
>>>
>>> The external Bus Unit (EBU) can control different flash devices, but
>>> these NAND flash commands have to be atomic and should not be
>>> interrupted in between. Lock the EBU from the beginning of the command
>>> till the end by moving the lock to the chip select.
>>>
>>> Signed-off-by: John Crispin <john@phrozen.org>
>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>> ---
>>>  drivers/mtd/nand/xway_nand.c | 20 ++++----------------
>>>  1 file changed, 4 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
>>> index 1511bdb..064ee41 100644
>>> --- a/drivers/mtd/nand/xway_nand.c
>>> +++ b/drivers/mtd/nand/xway_nand.c
>>> @@ -94,13 +94,16 @@ static void xway_reset_chip(struct nand_chip *chip)
>>>  
>>>  static void xway_select_chip(struct mtd_info *mtd, int chip)
>>>  {
>>> +	static unsigned long csflags;
> 
> Why is csflags static? AFAICT this is racy then...

Because the lock is taken when the chip is selected and it is unlocked
when the chip select is deactivated again. This should be part of the
private driver struct.

Hauke
