Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwEo9-0007Gx-Ci
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 19:42:21 +0000
Received: by pabfh17 with SMTP id fh17so6032909pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 11:42:00 -0800 (PST)
Date: Tue, 10 Nov 2015 11:41:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: joe@perches.com, andy.shevchenko@gmail.com, joern@lazybastard.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: error handling
Message-ID: <20151110194157.GS12143@google.com>
References: <20151110190343.GR12143@google.com>
 <1447183675-4840-1-git-send-email-saurabh.truth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447183675-4840-1-git-send-email-saurabh.truth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 11, 2015 at 12:57:55AM +0530, Saurabh Sengar wrote:
> Sorry, I am not able to test the driver, sending the patch as asked above.

Well, today you're in luck! You're touching a driver that requires no
special hardware, so you should be able to test it.

I think you can try using the mem= kernel parameter (see
Documentation/kernel-parameters.txt) to restrict your system memory, and
then try using that unreachable portions of memory for phram. You can
try this driver as either a module or built-in. For the former, you can
specify the parameters during modprobe time, or later by writing to
/sys/module/phram/parameters/phram. For the latter, you can specify on
the kernel command line or in /sys/module/phram/parameters/phram.

Let me know if you have any more questions about testing your patch.

Brian
