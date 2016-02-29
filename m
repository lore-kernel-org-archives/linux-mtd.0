Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aaT9x-0000AX-6S
 for linux-mtd@lists.infradead.org; Mon, 29 Feb 2016 19:07:10 +0000
Subject: Re: Filesystems over UBI can't handle badblocks
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB9762@PERU.autotrac.corp>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56D496BE.9020908@nod.at>
Date: Mon, 29 Feb 2016 20:06:38 +0100
MIME-Version: 1.0
In-Reply-To: <7F9DB42F7DDA544EA3EB31D694929A30EB9762@PERU.autotrac.corp>
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

Am 29.02.2016 um 18:53 schrieb Guilherme de Oliveira Costa:
>> I guess the reporter would come up with a good justification.
>>
>> I can imagine one, but it is not very strong: you have a development
>> device, you mess with bad blocks by marking/unmarking them for some
>> research reasons. You put UBI image there, then remember that some
>> of the blocks were bad and want to mark them as bad without re-
>> flashing UBI. Kind of a developer convenience.
> 
> Indeed. Originally, we were using cramfs over mtdblock, but were running on all sorts of problems during testing due to random corruptions. I wanted to mess with the partition blocks to check how cramfs over UBI would handle badblocks and bit-errors.

What you can do is mounting debugfs and set /sys/kernel/debug/ubi/ubi<NUM>/tst_emulate_bitflips to 1.

Thanks,
//richard
