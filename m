Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzPUg-0004t2-Sf
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 13:43:24 +0000
Subject: Re: can't mount ubifs after resizing with ubirsvol
To: Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
 <564DCFED.2070902@writesys.com.br>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <564DD1DF.9070009@nod.at>
Date: Thu, 19 Nov 2015 14:42:55 +0100
MIME-Version: 1.0
In-Reply-To: <564DCFED.2070902@writesys.com.br>
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

Hi!

Am 19.11.2015 um 14:34 schrieb Ibrahim Mattus Neto:
> Hi Richard!
> 
> Thanks for the response.
> 
> What I did was:
> 
> 1) I created an .ubi file using the following configuration.
> [rootfs]
> mode=ubi
> vol_id=0
> vol_type=dynamic
> vol_name=rootfs
> vol_alignment=1
> image=rootfs.ubifs
> vol_size=80MiB
> 
> [data]
> mode=ubi
> vol_id=1
> vol_type=dynamic
> vol_name=data
> vol_alignment=1
> vol_flags=autoresize
> vol_size=10MiB
> 
> [recover]
> mode=ubi
> vol_id=2
> vol_type=dynamic
> vol_name=recover
> vol_alignment=1
> vol_size=5MiB
> 
> 2) After booting I tried to shrink "data" and increase the size of recover using ubirsvol:
> 
> ubirsvol /dev/ubi0 -n 1 -s 4MiB    (data)
> 
> ubirsvol /dev/ubi0 -n 2 -s 15MiB (recover)
> 
> 3) After the resizing I tried to mount "data"
> 
> mount /home/data/
> [   88.510000] UBIFS error (ubi0:1 pid 668): validate_sb: bad LEB count: 1159 in superblock, 34 on UBI volume, 20 minimum required
> [   88.520000] UBIFS error (ubi0:1 pid 668): validate_sb: bad superblock, error 1

This cannot work. You resized the UBI *volume*, not the UBIFS filesystem.
And unless I'm very mistaken UBIFS does not support shrinking anyway.

Thanks,
//richard
