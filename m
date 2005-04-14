Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM1K8-0003cl-8e
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 06:11:49 -0400
Message-ID: <425E41D8.5070408@setabox.com>
Date: Thu, 14 Apr 2005 18:11:36 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: m.mikolaiczyk@rac.de
References: <425E37FF.5040703@rac.de>
In-Reply-To: <425E37FF.5040703@rac.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash not found.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marcus,

Marcus Mikolaiczyk wrote:
> Dear list users,
> 
> I've adapted a hardware driver for our board, and compiled the new
> kernel successfully. But it doesn't find the NAND Flash. When loading
> the module I get:
> insmod ./btutc1130.o
> ./btutc1130.o: init_module: No such device or address
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO or IRQ parameters
> 
> in /var/log/messages:
> Jan  1 19:25:15 10 daemon.warn klogd: No NAND device found!!!
> 
> Is there any possibility to test the 'connection' to the NAND or how can
> I check/debug the problem. I think that the HW functions are not
> properly configured, any idea how this can be checked.

I often have this problem if I don't have a good physical connection 
between the flash device and it's socket, so recheck your connection. 
Can you post your hardware function?

-- 
William J Beksi                          <wjbeksi@users.sourceforge.net>
GPG Key Fingerprint = ED4B 32C3 69E6 C2B7 705C  263F CB2F 3253 E7E1 DB3B
