Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvSgU-0003Jm-0f
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 18:28:21 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Mathias Thore <Mathias.Thore@infinera.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>
Subject: Re: Regression for NOR flash with multiple erase block regions
Date: Fri, 22 Sep 2017 18:27:42 +0000
Message-ID: <74af973f5ae542c3b53240c95949628c@svr-chch-ex1.atlnz.lc>
References: <4762f230bbd3437990b9f5baa61ab095@sv-ex13-prd1.infinera.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mathias,=0A=
=0A=
On 23/09/17 01:12, Mathias Thore wrote:=0A=
> Hello,=0A=
> =0A=
> Commit 1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 included in Linux 4.13 ( =
=0A=
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/mtd/mtdpart.c?h=3Dv4.13&id=3D1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc=
549 =0A=
> ) introduces a regression for NOR flash with multiple erase block =0A=
> regions of different sizes.=0A=
> =0A=
> Only the largest erase block size seems to be considered when =0A=
> determining if partitions are aligned. Partitions in smaller regions =0A=
> will be mounted as read-only. With Linux 4.12 and earlier, read/write =0A=
> access was available for these partitions.=0A=
=0A=
Sorry about that. I think a fix would be to re-calculate the =0A=
wr_alignment as we're looking at each erase block. Unfortunately I'm =0A=
about to get on a plane for 13 hours so I'm pretty much a write off for =0A=
the next couple of days.=0A=
=0A=
I'll take a look when I get back on-line unless Boris beats me to it.=0A=
