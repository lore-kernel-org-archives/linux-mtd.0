Received: from mail-da0-x231.google.com ([2607:f8b0:400e:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKaoF-00033h-3U
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 20:49:31 +0000
Received: by mail-da0-f49.google.com with SMTP id t11so3843190daj.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2013 13:49:29 -0700 (PDT)
Sender: Paul Henson <paul.b.henson@gmail.com>
Message-ID: <515209D5.4020902@acm.org>
Date: Tue, 26 Mar 2013 13:49:25 -0700
From: "Paul B. Henson" <henson@acm.org>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: i.MX28 gpmi-nand underlying geometry
References: <514FC1F1.8040500@acm.org> <514FFA64.6000205@freescale.com>
 <515099D4.1090605@acm.org> <51510541.8020209@freescale.com>
In-Reply-To: <51510541.8020209@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/25/2013 7:17 PM, Huang Shijie wrote:

> The latest kobs-ng uses the same method as the kernel to calculate
> the necessary parameters. It does not depend on the sysfs node any
> more. So do not worry about this.
>
> You can download the latest kobs-ng for imx6q from freescale's
> website(sorry, I do not know the weblink.)


Oh, cool; thanks for the info. I'm working with an imx28, and the 
version of kobs-ng that comes with the latest BSP for that processor. 
I'll try to get a hold of the newest kobs-ng and see if that works for 
imx28 on a current kernel.

Thanks again…
