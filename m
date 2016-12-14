Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH4Dw-0001nc-Ji
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 07:43:37 +0000
Date: Wed, 14 Dec 2016 08:43:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matthias Auchmann <m.auchmann@artech.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI/UBIFS on NAND with PEB 4MB
Message-ID: <20161214084303.0059cbf5@bbrezillon>
In-Reply-To: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA17@SRV01.ARTech.local>
References: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA17@SRV01.ARTech.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthias,

On Tue, 13 Dec 2016 20:40:59 +0100
Matthias Auchmann <m.auchmann@artech.at> wrote:

> Hi guys!
> 
> I'm trying to use UBI and UBIFS on a Micron MT29F32G08ABCDBJ4 SLC NAND with an erase block size 4MB.

Woh! an SLC NAND with 4MB eraseblocks, that's surprizing.

> 
> First of all, mkfs.ubifs wouldn't support a LEB larger than UBIFS_MAX_LEB_SZ being (2*1024*1024).

This is the easy part ;). We already have patches to increase the limit
in different ubi utils (IIRC, it's also needed in ubinize).

> 
> When I use ubiattach though, it seems to be quite happy, giving me that on a 128MB partition:
> 
> UBI device number 0, total 32 LEBs (133169152 bytes, 127.0 MiB), available 8 LEBs (33292288 bytes, 31.8 MiB), LEB size 4161536 bytes (4.0 MiB)
> 
> Anyway, when I detach and reattach, it won't work. Details are in the bottom of that mail, but since I haven't thoroughly looked into it myself yet, this is only for those who care... I don't want to ask preliminary questions.
> 
> Anyway, my questions I guess then are:
> -) Are there any patches/branches that enable UBIFS to be run with a LEB of 4161536?
> -) Are there any known limitations with using a 4MiB PEB with UBI itself, or shall I assume for now that the problem is on my board/NAND driver regarding the above ubiattach errors upon the second attach?

I don't think so. We did several tests on different MLC NANDs exposing
4MB blocks, and the UBI/UBIFS layers were not complaining about that
(we had other problems related to the MLC constraints).
What's your controller?

Regards,

Boris
