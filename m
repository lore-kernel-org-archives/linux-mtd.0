Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b58H9-0001vF-GV
 for linux-mtd@lists.infradead.org; Tue, 24 May 2016 09:05:21 +0000
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
To: Martin Townsend <mtownsend1973@gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
 <573EC17D.40809@nod.at>
 <CABatt_wQfDFN4U5SgOLrcxWNiZYVRQ4eGy1LQmdRJJN-qncUHw@mail.gmail.com>
 <CABatt_zj+0Vr9PjM64VMYk-Gx+UGW-Xo6vJFNLJ1DsPNm0LPHQ@mail.gmail.com>
 <574360B5.1040505@nod.at>
 <CABatt_xRU57kp1gWwS+gNbSM7_j=ZWAZnQqZ_gjhSGV-+ytMEA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57441937.9070302@nod.at>
Date: Tue, 24 May 2016 11:04:55 +0200
MIME-Version: 1.0
In-Reply-To: <CABatt_xRU57kp1gWwS+gNbSM7_j=ZWAZnQqZ_gjhSGV-+ytMEA@mail.gmail.com>
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

Am 24.05.2016 um 10:31 schrieb Martin Townsend:
> On Mon, May 23, 2016 at 8:57 PM, Richard Weinberger <richard@nod.at> wrote:
>> Am 23.05.2016 um 16:16 schrieb Martin Townsend:
>>>> Also will try patch on Monday :)
>>> Hi Richard,
>>>
>>> with reboot I get the assert on shutdown too, the commit
>>> 807612db2f9940b9fa6deaef054eb16d51bd3e00 is there already.  A
>>> colleague doesn't see this problem so I will try on a newly flashed
>>> board.
>>
>> Interesting, so it happens only with that UBIFS instance?
>> Can you share a nanddump?
>>
> No problem, is there a specific command? looking at the help I would guess:
> nanddump --bb=dumpbad --oob -f nand.img /dev/mtdX

nandump --omitoob -f nand.img /dev/mtdX is fine.


> Is there a preference as to where to put the dump file?

Anything where I can download anonymously is fine.

Thanks,
//richard
