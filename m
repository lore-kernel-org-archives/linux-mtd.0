Received: from mercuryimc.plus.com ([80.229.200.144]
 helo=centos1.newflow.co.uk)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUYdG-0002Ve-Fj
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 08:31:23 +0000
Message-ID: <517646D5.9090700@newflow.co.uk>
Date: Tue, 23 Apr 2013 09:31:17 +0100
From: Mark Jackson <mpfj-list@newflow.co.uk>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: MTD : cannot reserve enough PEBs for bad PEB handling [SOLVED]
References: <51750526.70508@newflow.co.uk>
In-Reply-To: <51750526.70508@newflow.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/04/13 10:38, Mark Jackson wrote:
> I'm trying to work out how to generate a "valid" UBI image, but I keep
> getting a "cannot get enough PEBs" warning.
> 
> I generate my image (destined for a 64MB NAND partition) using:-
> 
> $ mkfs.ubifs -d output/target -e 0x1f000 -c 483 -m 0x800 -x none -F -o
> output/images/rootfs.ubifs
> $ ubinize -o output/images/rootfs.ubi -m 0x800 -p 0x20000 -s 512 -O 2048
> ubinize.cfg
> 
> My .cfg file is:-
> 
> [ubifs]
> mode=ubi
> vol_id=0
> vol_type=dynamic
> vol_name=rootfs
> vol_alignment=1
> vol_flags=autoresize
> vol_size=61MiB

I just removed this vol_size entry and it all seems to be fine now.

I guess this was too big ??

Mark J.
