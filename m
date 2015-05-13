Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsMzL-00010f-S3
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 03:05:40 +0000
Received: by pdbnk13 with SMTP id nk13so36194536pdb.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 20:05:18 -0700 (PDT)
Date: Tue, 12 May 2015 20:05:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michael N <michael.niarchos@gmail.com>
Subject: Re: Cannot mount ubifs partition
Message-ID: <20150513030515.GB23718@brian-ubuntu>
References: <CAHafNYtURNYAxuYROnEU++1c=uF2Jq-oFEKTkDhUPQtdCnpcHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHafNYtURNYAxuYROnEU++1c=uF2Jq-oFEKTkDhUPQtdCnpcHQ@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 12, 2015 at 10:38:31PM +0300, Michael N wrote:
> I am using a Zynq7000 with NAND 512MB and I am trying to deploy Linux on NAND
> memory. I use a custom built kernel with minimal features (UBI and UBIFS
> support are enabled and mtd-utils installed). I can ubiformat an mtd
> partition, I
> can ubiattach and ubidetach it but whenever I try to mount the
> partition I get this error.
> 
>            mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
> No such device

What's the exact mount command you're running? Did you take a look at
the MTD FAQ?

http://linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubifs

> (ubi-rootfs is the name of the partition, I am sure about it)

Brian
