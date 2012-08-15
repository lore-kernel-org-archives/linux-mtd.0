Received: from moutng.kundenserver.de ([212.227.126.171])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1j20-0006Il-Mb
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 19:13:29 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH RESEND 2/2] MTD: autcpu12-nvram: Convert driver to
 platform_device
Date: Wed, 15 Aug 2012 19:13:23 +0000
References: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
 <1345048086-15709-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1345048086-15709-2-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201208151913.24057.arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 15 August 2012, Alexander Shiyan wrote:
> 
> Because we can have a single kernel to support multiple machines, we
> need to make loading specific drivers for the target platform only.
> For this, driver is converted to the platform driver.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Looks good. I can take both patches into arm-soc if necessary, 
otherwise I'm fine with them going through the mtd tree as well.

Acked-by: Arnd Bergmann <arnd@arndb.de>
