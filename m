Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQ6FM-0007w8-1C
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2005 12:48:32 -0400
Message-ID: <434E8799.2000203@mvista.com>
Date: Thu, 13 Oct 2005 09:13:13 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <434E7211.6020709@gmail.com>
In-Reply-To: <434E7211.6020709@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: /dev/mtd* not there with latest MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernhard Priewasser wrote:

> But: there is no /dev/mtd* or /dev/mtdblock* at all!
> There are no changes to u-boot or some other kernel config, only the new 
> MTD source.
> 
> Patching the kernel with 2005-06-21 CVS results in having only 
> /dev/mtdblock*, but no /dev/mtd*!..... very confusing.

You're probably using devfs to automatically create device nodes, which 
is on its way out.  udev is the way recent 2.6 kernels do this 
http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html

-- 
Todd
