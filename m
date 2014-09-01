Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOZVj-0007Cx-MR
 for linux-mtd@lists.infradead.org; Mon, 01 Sep 2014 21:51:40 +0000
Message-ID: <5404EA4F.1040508@nod.at>
Date: Mon, 01 Sep 2014 23:51:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: jean-philippe francois <jp.francois@cynove.com>,
 stable@vger.kernel.org
Subject: Re: Ubi patch proposition for 3.10.y
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
In-Reply-To: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.08.2014 14:26, schrieb jean-philippe francois:
> I think commit 4b3e0a25... [1] (UBI: Call scan_all() with correct
> offset in error case) should be added to 3.10.y stable branch.
> 
> It solves an ubifs corruption problem on my board. Edited bootlog for
> each case are attached.
> 
> ubifs corruption can be easily reproduced on this board :
> 1) format nand partition and flash rootfs
> 2) record h264 stream on nand
> 3) scp a file from host pc to rootfs while 2 is ongoing
> 4) unplug power

Hmm, I think this is a good point to bite the bullet and backport all
UBI fastmap related fixes to -stable.

Thanks,
//richard
