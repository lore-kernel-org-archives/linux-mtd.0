Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSxQ-0003co-E8
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 12:33:50 +0000
Subject: Re: UBIFS errors are randomly seen after reboots
To: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
 <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
Date: Tue, 17 Jan 2017 13:33:21 +0100
MIME-Version: 1.0
In-Reply-To: <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
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

Chaitanya,


Am 17.01.2017 um 12:47 schrieb chaitanya vinnakota:
> Hi Richard,
> 
> Seems that the ubi-tests are failing work on my board. I'm getting the
> below output when I initiated the test.
> 
> # ./runtests.sh /dev/ubi1
> 
> Running mkvol_basic /dev/ubi1
> [mkvol_basic] __initial_check():74: insufficient available eraseblocks
> 0 on UBI device, required 5
> 
> # ./runtests.sh /dev/ubi1_0
> Running mkvol_basic /dev/ubi1_0
> [mkvol_basic] __initial_check():69: function ubi_get_dev_info() failed
> with error 19 (No such device)
> 
> Which device should I pass as the argument , is that ubi1 or ubi1_0
> [the partition to mount rootfs ] ?
> 
> Added ubinfo of /dev/ubi1_0 and /dev/ubi1 for further reference

ubi1 needs to be empty for testing.

Thanks,
//richard
