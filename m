Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0TTY-000600-0x
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 12:42:53 +0000
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at> <20160511112630.GB22640@visteon-gnana>
Cc: "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>,
 "babu3@visteon.com" <babu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <573328B2.5010709@nod.at>
Date: Wed, 11 May 2016 14:42:26 +0200
MIME-Version: 1.0
In-Reply-To: <20160511112630.GB22640@visteon-gnana>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 11.05.2016 um 13:16 schrieb DHANAPAL, GNANACHANDRAN (G.):
>> Is this a pristine UBIFS with all fixes applied?
>> Your kernel is rather old. Not sure if we ever had such an issue,
>   Yes, This is pretty much older one provided by chip vendor NXP(Freescale) BSP 3.10.17.
>   Last commit id for ubifs is 
> 
> 	commit 4791df938fe7aa27a9fe50e4582efd583a045541
> 	Author: Richard Genoud <richard.genoud@gmail.com>
> 	Date:   Tue Apr 2 12:24:37 2013 +0200
> 
>   Last commit id for ubi is 
> 
> 	commit d779146e04aacc8abe8d645284388c837d5d50cd
> 	Author: Huang Shijie <b32955@freescale.com>
> 	Date:   Wed Sep 18 10:17:39 2013 +0800	

rw@sandpuppy:~/linux (master $)> git show d779146e04aacc8abe8d645284388c837d5d50cd
fatal: bad object d779146e04aacc8abe8d645284388c837d5d50cd

For both commits. So, a rebased tree.

:-(

>  
>> but still...
>> Can you please explain a bit more what your device is doing and what
>> NAND/UBI layout you are using?
>  This is an automotive infotainment system  that has 5 raw partitions for
>  u-boot, kernel and recovery software. And there are 3 ubifs partitions for 
> 	1.  / - (RO) -  896 MB, 
> 	2. /var - (RW) - 128 MB, 
> 	3. /meta - (RW)- 512 MB. 
> 
>  All of these partition has been through following  commands (in order) for 
>  ubifs file system creation during production.
> 	1. ubiformat
> 	2. ubimkvol
> 	3. ubiattach
> 	4. mount -t ubifs
>  A rootfs tar file from yocto build output files  was untar in / and /var partitions. 
> 
> 
>  /meta partition is configured as home folder that has runtime files for 
>  pulseaudio, gstreamer, infotainment radio tuner alignment and radio channel preset. 
>  this partition also has mount point for USB storage device. Where the user can plug 
>  and unplug their USB flash pen drive without umount -ing  it. This is the partition 
>  that got corrupted in two units out of 1000 units in vehicles  that has running for  
>  last 6 months.

What exactly is the error message you get from the kernel while mounting?
Something like "bad node type (255 but expected 9)"?
It seems like some LEBs are erased with shouldn't.

Thanks,
//richard
