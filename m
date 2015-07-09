Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD4rr-0003cC-NI
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 05:59:32 +0000
Message-ID: <559E0DAA.20105@openwrt.org>
Date: Thu, 09 Jul 2015 07:59:06 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Paul Fertser <fercerpav@gmail.com>
Subject: resetting m25p80 on reboot
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

there are some SoCs made by MTK/Ralink, where the bootrom has problems
when the flash chip has 4 byte addressing enabled. This will make the
unit not boot properly after reboot was called. The flash chip needs a
reset prior to working. Paul has sent a patch to our ML which looks good
to me but i wanted someone that knows more about m25p80 to look at it
before i merge it into OpenWrt and send it upstream to linux-mtd
the patch in question can be found here

-> http://patchwork.ozlabs.org/patch/492878/

I am not subscribed to linux-mtd so please CC me on replies.

thanks in advance,
	John
