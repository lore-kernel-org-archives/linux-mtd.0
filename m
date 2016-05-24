Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5FYJ-0006uF-O6
 for linux-mtd@lists.infradead.org; Tue, 24 May 2016 16:51:32 +0000
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
 <57441937.9070302@nod.at>
 <CABatt_w4qzj9sqn9gQPMYe7c5y9hPCUws5QJNK_q6Kz+mMuMbw@mail.gmail.com>
 <57444876.7090405@nod.at>
 <CABatt_zXcp59i+6AYo=BuSYYQu-cP==r5V5jFOruUcoHeKGrfg@mail.gmail.com>
 <57445A52.3010704@nod.at>
 <CABatt_xe6SEmsSLfSrbC2LNv6WTK=Ltkj8ZqLja+pHXqMqSv-g@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57448675.9010904@nod.at>
Date: Tue, 24 May 2016 18:51:01 +0200
MIME-Version: 1.0
In-Reply-To: <CABatt_xe6SEmsSLfSrbC2LNv6WTK=Ltkj8ZqLja+pHXqMqSv-g@mail.gmail.com>
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

Am 24.05.2016 um 16:12 schrieb Martin Townsend:
> aaarrgh, sums my day up so far, try this one, I've just tested and at
> least it started downloading the file.
> http://tempsend.com/32760A445F

That worked.
Can you please share your NAND id bytes or the flash geometry?

Thanks,
//richard
