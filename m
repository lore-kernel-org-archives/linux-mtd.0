Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7N2d-0008NX-Qn
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 11:06:33 +0000
Message-ID: <1405508755.1906.27.camel@sauron.fi.intel.com>
Subject: Re: ubifs issue about xattr node when replay journal
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: look wang <walklook@gmail.com>
Date: Wed, 16 Jul 2014 14:05:55 +0300
In-Reply-To: <7590973538024349719@unknownmsgid>
References: <7590973538024349719@unknownmsgid>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-07-11 at 16:37 +0800, look wang wrote:
> Hi all,
> 
> Now we use xattr based on ubifs, and find some issues about it.
> Situation like that:
> 1.poweron ->2.create a file -> 3.set xattr -> 4.delete the file ->
> 5.power cut
> After several cycles with above steps, we can not boot up the device
> with the error below.

Do you use the UBI fastmap feature?

-- 
Best Regards,
Artem Bityutskiy
