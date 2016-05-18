Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2yTs-0001Ia-4a
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 10:13:32 +0000
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
To: Martin Townsend <mtownsend1973@gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <573C4033.6010906@nod.at>
Date: Wed, 18 May 2016 12:13:07 +0200
MIME-Version: 1.0
In-Reply-To: <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
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

Am 18.05.2016 um 11:24 schrieb Martin Townsend:
> A bit info:
> I booted the board over the network using TFTP/NFS and then mounting
> the UBIFS partition using
> ubiattach /dev/ubi_ctrl -m 12 -O 2048
> mount -o ro -t ubifs /dev/ubi0_0 /mnt/ubifs/
> but this never triggered the assert. So I thought maybe it was
> something to do with U-Boot mounting the rootfs to load the kernel and
> device tree which are in the UBIFS so I loaded the kernel and device
> tree from a TFTP server and then booted from NAND but this still
> triggered the assert so this kind of rules out U-Boot.

So, you can trigger without U-Boot touching the UBIFS?
Also no UBI attach happens in U-Boot?

Is the assert you're facing really the top most error?
Another question, goes the error way when you call "sync"
before remounting ro?

Thanks,
//richard
