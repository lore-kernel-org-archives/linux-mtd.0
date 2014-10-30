Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjkEh-0004D9-5Y
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 07:33:35 +0000
Message-ID: <1414654390.23185.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: print erase size on init
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 30 Oct 2014 09:33:10 +0200
In-Reply-To: <5448344C.8020402@vanguardiasur.com.ar>
References: <1413842464-18016-1-git-send-email-zajec5@gmail.com>
 <5448344C.8020402@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-10-22 at 19:48 -0300, Ezequiel Garcia wrote:
> Hm, this line is already way too long!

Can be split then.

> Moreover, you have a /proc and a /sysfs interface to retrieve the erasesize:
> 
> What's wrong with using any of the currently available interfaces:
> 
> $ cat /sys/class/mtd/mtd0/erasesize 
> 131072
> 
> $ cat /proc/mtd | grep mtd0 | awk '{print $3}'
> 00020000
> 
> Any reason why you want the info in the kernel log?

When people ask for help and send their logs, it is very handy to have
this information there.
