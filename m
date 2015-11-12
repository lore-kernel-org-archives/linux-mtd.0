Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwlIs-0008Oo-Ai
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 06:24:14 +0000
Received: by padhx2 with SMTP id hx2so55185510pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 22:23:53 -0800 (PST)
From: Saurabh Sengar <saurabh.truth@gmail.com>
To: computersforpeace@gmail.com,
	joe@perches.com
Cc: andy.shevchenko@gmail.com, joern@lazybastard.org, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: phram: error handling
Date: Thu, 12 Nov 2015 11:53:46 +0530
Message-Id: <1447309426-3583-1-git-send-email-saurabh.truth@gmail.com>
In-Reply-To: <20151111194449.GH12143@google.com>
References: <20151111194449.GH12143@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> More importantly, it's good to test these cases too:

> * phram is built-in (not a module), with and without a phram= line on
>   the commandline
> * writing to /sys/module/phram/parameters/phram (for both the module
>   and built-in cases)

Hi Brian,

1) I have tried phram as built-in, with and without phram= line in cmdline
but both the time there was no phram directory found in /sys/modules, neither /dev/mtd0
(do I need to enablesome config options ?)

2) There was no 'parameters' directory inside /sys/module/phram when I used phram as module,
though /dev/mtd0 and /dev/mtd0ro were present
 

I tried searching phram in kernel/Documentation but couldn't found anything.
I have few queries related to phram driver, please answer if your time permits.
(Feel free to ignore if I am taking too much your time, I know these are too many :) )

Q1) Phram driver is used for accessing memory which are there but not currently mapped in system? am I correct?

Q2) When I register device with junk names like phram=saurabh,0x1f7000000,0x400, it registers fine with name 'saurabh', isn't it wrong ?

Q3) If I access some memory which does not even exist, driver still registers and even read operation is successfull to it.
eg: phram=ram,8Gi,1ki (My laptop have 4GB ram but accessing 8GB address of ram)


Regards,
Saurabh

-------------------------------------------
