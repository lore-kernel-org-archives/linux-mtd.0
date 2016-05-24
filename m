Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5Cbx-0007ZY-43
 for linux-mtd@lists.infradead.org; Tue, 24 May 2016 13:43:05 +0000
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57445A52.3010704@nod.at>
Date: Tue, 24 May 2016 15:42:42 +0200
MIME-Version: 1.0
In-Reply-To: <CABatt_zXcp59i+6AYo=BuSYYQu-cP==r5V5jFOruUcoHeKGrfg@mail.gmail.com>
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

Am 24.05.2016 um 15:23 schrieb Martin Townsend:
> On Tue, May 24, 2016 at 1:26 PM, Richard Weinberger <richard@nod.at> wrote:
>> Am 24.05.2016 um 12:37 schrieb Martin Townsend:
>>> Here's a link to the image
>>> https://file.io/0s7OA9
>>
>> 404 :-(
>>
>>> I've just tried on another board and can still get the same assert so
>>> it's not just a one off. I also saw this warning whilst formatting
>>> this board.  I tried reflashing again until I did not get the warning
>>> below but still saw the assert so I don't think they are related.
>>> ubiformat: mtd12 (nand), size 533725184 bytes (509.0 MiB), 4072
>>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
>>> libscan: scanning eraseblock 4071 -- 100 % complete
>>> ubiformat: 4070 eraseblocks are supposedly empty
>>> ubiformat: 2 bad eraseblocks found, numbers: 1324, 1640
>>> ubiformat: flashing eraseblock 191 -- 17 % complete  [   51.525672]
>>> ------------[ cut here ]------------
>>> [   80.185567] WARNING: CPU: 0 PID: 896 at
>>> /home/poweroasis/bia/build/am43-controller-aquila/tmp/work-shared/am43-controller-aquila/kernel-source/drivers/mtd/nand/nand_base.c:928
>>> nand_wait+0x150/0x174()
>>
>> Not good. Please verify.
>> See the comment above that WARN_ON().
>>
> 
> Try this one:
> http://gofile.io/?id=P2z2Zd

Again file not found. WTF?

Thanks,
//richard
