Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rds4e-0001jM-KF
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 23:29:20 +0000
Message-ID: <4EF3BD2A.5020409@newsguy.com>
Date: Thu, 22 Dec 2011 15:28:42 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>	
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>	
 <1324559149.10300.93.camel@sauron.fi.intel.com>
 <1324577032.1165.15.camel@sauron.fi.intel.com>
In-Reply-To: <1324577032.1165.15.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/2011 10:03 AM, Artem Bityutskiy wrote:
> On Thu, 2011-12-22 at 15:05 +0200, Artem Bityutskiy wrote:
>> 1. Rework whole MTD interface from ->read()/->write()/etc (pointers to
>> functions) to mtd_read(mtd, ...)/mtd_write(mtd, ...)/etc.
> I will send a patch-set for this change tomorrow.
>
>> 2. In the new functions you may do the stuff you do at patch 2.
> Then you will be able to do this change easily.
>



OK, thank you Artem.  I'll watch for it and follow up with a reworked patch 2.

Mike
