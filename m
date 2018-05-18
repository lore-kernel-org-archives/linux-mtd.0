Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJbOv-0000rB-1R
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 09:10:42 +0000
Date: Fri, 18 May 2018 11:09:55 +0200 (CEST)
From: David Oberhollenzer <goliath@sigma-star.at>
To: Levente <leventelist@gmail.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <967434303.163429.1526634595483.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
References: <CACwWb3DnyxqTrQF-5UpuU+rUDRGrS2XM8+yQEf45miCbJ5nrpw@mail.gmail.com>
Subject: Re: mtd
MIME-Version: 1.0
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

Hi,


I took a look at the OpenWRT source repository and the tool you mention looks more
like some home grown utility to me.

The mtd-utils you've cloned are built by package/utils/mtd-utils/Makefile

You may want to sort this out on the OpenWRT mailing list, unless of course the source
of that utility has been copied from mkfs.jffs2 at some point and the later happens
to have the same issue.

See: https://lists.openwrt.org/mailman/listinfo/openwrt-devel


Thanks,

David
