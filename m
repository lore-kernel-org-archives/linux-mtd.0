Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLm3J-00082H-RA
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 13:58:22 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <442041BE.9070407@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
Content-Type: text/plain
Date: Tue, 21 Mar 2006 21:57:24 +0300
Message-Id: <1142967444.13740.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-03-21 at 21:11 +0300, Alexander Belyakov wrote:
> Striped mtd device erasesize is an erasesize of subdevice multiplied by 
> number of subdevices (in case of equal erasesize subdevices). As 
> erasesize is commonly considered as a power-of-2 number it is not good 
> idea to use 3, 5, etc devices.
Why? I don't see any thing bad with having 3*128KiB eraseblock size...

> Subdevices are mtd devices which participate in creation of striped mtd 
> device (superdevice). vol1, vol2 here are the names of subdevices 
> assigned on partitioning stage (for example) by the following part of 
> kernel configuration string:
> CONFIG_CMDLINE=".......... 
> mtdparts=flash1:512k(blob)ro,2m(kernel)ro,16m(root),16m(vol1);flash2:16m(vol2),8m(vol3) 
> ........."
IMO, it is better to use MTD device numbers. 0 = mtd0, 1 = mtd1, etc. I
can always glance at /proc/mtd and realize which numbers to use. Names
may contain white spaces, or whatever inappropriate characters one may
conceive, right?

> > 4. I erase eraseblock 0 of mtd7
> In simple case eraseblock 0 on both subdevices 1 and 2 will be erased
I see. Why did you say "In simple case" ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
