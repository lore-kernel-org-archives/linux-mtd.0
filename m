Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b3fBn-0000Wb-RY
 for linux-mtd@lists.infradead.org; Fri, 20 May 2016 07:49:45 +0000
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
To: Martin Townsend <mtownsend1973@gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <573EC17D.40809@nod.at>
Date: Fri, 20 May 2016 09:49:17 +0200
MIME-Version: 1.0
In-Reply-To: <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
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

Am 18.05.2016 um 12:39 schrieb Martin Townsend:
> I can't do the sync as the error only occurs during boot and I can see
> the assert whilst systemd is rmounting all the filesystems. Once I've
> logged in I can't get the assert to trigger again.  Just to summarise
> the conditions for triggering the assert
> To trigger I login and remount / as rw and then reboot (to a ro
> rootfs) and the assert first during the boot.
> The assert will appear on all subsequent boots (Providing I don't do
> the following)
> To get rid of the assert I can, once logged in, remount / rw and then
> ro and then reboot.

Hmm, so there is no reset/power cut involved at all?
Can you trigger it when you mount a UBIFS by hand ro and remount?

Thanks,
//richard
