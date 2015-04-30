Received: from mail9.teraoka.com.sg ([152.101.95.36] helo=mail.teraoka.com.sg)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YndA9-0001N4-OB
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 01:21:14 +0000
From: "Tee Zhen Cong" <zc.tee@teraoka.com.sg>
To: "'Fabio Estevam'" <festevam@gmail.com>
References: <000c01d08261$9726b7c0$c5742740$@teraoka.com.sg>
 <CAOMZO5AenmiFEVYGDC6nkV4QB2o-Gr15FJCiaont3gyKAHbsDA@mail.gmail.com>
In-Reply-To: <CAOMZO5AenmiFEVYGDC6nkV4QB2o-Gr15FJCiaont3gyKAHbsDA@mail.gmail.com>
Subject: RE: nandtest error
Date: Thu, 30 Apr 2015 09:20:32 +0800
Message-ID: <000001d082e3$dbe724d0$93b56e70$@teraoka.com.sg>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-sg
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,
Thanks for pointing out. Indeed I cannot implement the fix as Han Xu
mentioned as I do not have FSL nor DTS config file in my kernel version.

Regards,
zc

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
Fabio Estevam
Sent: Thursday, 30 April, 2015 7:03 AM
To: Tee Zhen Cong
Cc: linux-mtd@lists.infradead.org
Subject: Re: nandtest error

On Wed, Apr 29, 2015 at 6:48 AM, Tee Zhen Cong <zc.tee@teraoka.com.sg>
wrote:

> I am using linux kernel version 3.0.35. Anybody has any idea why is 
> this happening? Is there any setting that I need to tweak to make it work?

FSL kernel 3.0.35 is not supported in this list.

Please use kernel 4.0 or 4.1-rc1.

Regards,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
