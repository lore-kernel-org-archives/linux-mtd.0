Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b4vzL-0005Rj-E9
 for linux-mtd@lists.infradead.org; Mon, 23 May 2016 19:58:08 +0000
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <574360B5.1040505@nod.at>
Date: Mon, 23 May 2016 21:57:41 +0200
MIME-Version: 1.0
In-Reply-To: <CABatt_zj+0Vr9PjM64VMYk-Gx+UGW-Xo6vJFNLJ1DsPNm0LPHQ@mail.gmail.com>
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

Am 23.05.2016 um 16:16 schrieb Martin Townsend:
>> Also will try patch on Monday :)
> Hi Richard,
> 
> with reboot I get the assert on shutdown too, the commit
> 807612db2f9940b9fa6deaef054eb16d51bd3e00 is there already.  A
> colleague doesn't see this problem so I will try on a newly flashed
> board.

Interesting, so it happens only with that UBIFS instance?
Can you share a nanddump?

Thanks,
//richard
