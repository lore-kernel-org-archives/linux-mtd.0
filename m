Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J32Nm-0006w3-KM
	for linux-mtd@lists.infradead.org; Fri, 14 Dec 2007 04:42:48 +0000
Received: by py-out-1112.google.com with SMTP id a25so2270072pyi.11
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Dec 2007 20:42:41 -0800 (PST)
Message-ID: <97a0a9ac0712132042t62ceda85h8505c49876fecf37@mail.gmail.com>
Date: Thu, 13 Dec 2007 21:42:40 -0700
From: "Gordon Farquharson" <gordonfarquharson@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: physmap platform flash device on the GLAN Tank
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Martin Michlmayr <tbm@cyrius.com>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

(I hope this is the right place to post this.)

Using 2.6.23 on the GLAN Tank, I see the following boot log messages
(full boot log can be found here [1]).

physmap platform flash device: 00080000 at f0000000
request_module: runaway loop modprobe net-pf-1
modprobe: FATAL: Could not load
/lib/modules/2.6.23-1-iop32x/modules.dep: No such file or directory
modprobe: FATAL: Could not load
/lib/modules/2.6.23-1-iop32x/modules.dep: No such file or directory
...
request_module: runaway loop modprobe net-pf-1
modprobe: FATAL: Could not load
/lib/modules/2.6.23-1-iop32x/modules.dep: No such file or directory
...
physmap-flash physmap-flash.0: map_probe failed

If I remove the call to register the flash device
(platform_device_register(&glantank_flash_device); ) from
arch/arm/mach-iop32x/glantank.c, the errors in the boot log disappear.

Any ideas what problem is causing these boot log messages? What other
information can I provide to help debug this problem?

Thanks.

Gordon

[1] http://www.pastebin.ca/801322

-- 
Gordon Farquharson
GnuPG Key ID: 32D6D676
