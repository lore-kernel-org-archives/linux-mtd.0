Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJbSo-0002lu-Di
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 09:14:16 +0000
Received: by mail-qt0-x236.google.com with SMTP id m5-v6so9395624qti.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 May 2018 02:14:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <967434303.163429.1526634595483.JavaMail.zimbra@sigma-star.at>
References: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
 <967434303.163429.1526634595483.JavaMail.zimbra@sigma-star.at>
From: Levente <leventelist@gmail.com>
Date: Fri, 18 May 2018 11:14:02 +0200
Message-ID: <CACwWb3AVnJOjNW2DE6jn8CR3SRFECP=2mgr-n_rQ-4fNAOd11A@mail.gmail.com>
Subject: Re: mtd
To: David Oberhollenzer <goliath@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I did this, and the OpenWRT guys directed me here.

But thank you for your help anyways.

Levente

On Fri, May 18, 2018 at 11:09 AM, David Oberhollenzer
<goliath@sigma-star.at> wrote:
> Hi,
>
>
> I took a look at the OpenWRT source repository and the tool you mention looks more
> like some home grown utility to me.
>
> The mtd-utils you've cloned are built by package/utils/mtd-utils/Makefile
>
> You may want to sort this out on the OpenWRT mailing list, unless of course the source
> of that utility has been copied from mkfs.jffs2 at some point and the later happens
> to have the same issue.
>
> See: https://lists.openwrt.org/mailman/listinfo/openwrt-devel
>
>
> Thanks,
>
> David
