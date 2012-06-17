Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgGSt-0006qh-2U
 for linux-mtd@lists.infradead.org; Sun, 17 Jun 2012 14:28:32 +0000
Received: by ghbf11 with SMTP id f11so3439393ghb.36
 for <linux-mtd@lists.infradead.org>; Sun, 17 Jun 2012 07:28:29 -0700 (PDT)
Message-ID: <4FDDE970.40301@gmail.com>
Date: Sun, 17 Jun 2012 11:28:00 -0300
From: "William F." <william76.sh@gmail.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: Linux 3.5-rc2 and ubifs as root
References: <87k3z616s4.fsf@free.fr>
In-Reply-To: <87k3z616s4.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em 17-06-2012 09:07, Robert Jarzmik escreveu:
> Hi all, unsubscribe me from this list
>
> I have my root partition on a UBIFS, on top on my docg3 MTD.
> With version 3.4, my kernel boots fine. With version 3.5-rc2, my kernel can't
> find the root partition.
>
> My command line is :
> mtdparts=docg3.0:256k@3456k(barebox)ro,256k(barebox-logo),128k(barebox-env),4M(kernel),-(root)
> ubi.mtd=4 rootfstype=ubifs root=ubi0:linux_root ro
>
> Now, the funny thing : if I boot with the same kernel on my SD card (change on
> the commandline to root=/dev/mmcblk0p2 for example), and then
> issue "mount -t ubifs ubi0:linux_root /mnt", it works.
>
> Did that happen to anybody else ?
>
> Cheers.
>
