Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4obu-0002rR-21
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2013 08:51:51 +0000
Received: by mail-we0-f169.google.com with SMTP id n5so1471875wev.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2013 01:51:27 -0700 (PDT)
Message-ID: <51FA2167.7060305@gmail.com>
Date: Thu, 01 Aug 2013 10:50:47 +0200
From: Wladislav Wiebe <wladislav.kw@gmail.com>
MIME-Version: 1.0
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: mm/slab: ppc: ubi: kmalloc_slab WARNING / PPC + UBI driver
References: <51F8F827.6020108@gmail.com>
 <20130731173434.GA27470@blackmetal.musicnaut.iki.fi>
In-Reply-To: <20130731173434.GA27470@blackmetal.musicnaut.iki.fi>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, dwmw2@infradead.org, penberg@kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, cl@linux.com,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 31/07/13 19:34, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Jul 31, 2013 at 01:42:31PM +0200, Wladislav Wiebe wrote:
>> DEBUG: xxx kmalloc_slab, requested 'size' = 8388608, KMALLOC_MAX_SIZE = 4194304
> [...]
> 
> It seems some procfs file is trying to dump 8 MB at a single go. You
> need to fix that to return data in smaller chunks. What file is it?

seems it's coming from DT:
..
DEBUG: xxx seq_path: file path = /proc/device-tree/localbus@5000/flash@0/partition@1/reg
------------[ cut here ]------------
..

need to check if and how it's possible divide it in smaller chunks.
If somebody has suggestions, feel free to comment-)

Thanks & BR
Wladislav Wiebe
