Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181Req-0007JA-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 14:22:48 +0100
Message-Id: <200210151321.g9FDLP722607@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] add access to AMD secure silicon area
Date: Tue, 15 Oct 2002 14:21:24 +0100
Cc: linux-mtd@lists.infradead.org
References: <200210151025.g9FAP9221781@localhost.localdomain> <19345.1034676569@passion.cambridge.redhat.com> <26135.1034678204@passion.cambridge.redhat.com>
In-Reply-To: <26135.1034678204@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> And CFI_DEVICETYPE_X8 is always correct? No X16 devices?
>

Good point, how about ....

+       cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+
+       map->copy_from(map, buf, adr, len);
+
+       cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+       cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+

instead?
