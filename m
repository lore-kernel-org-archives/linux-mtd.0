Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181Odu-0006wZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 11:09:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200210030816.g938GaW03616@localhost.localdomain> 
References: <200210030816.g938GaW03616@localhost.localdomain> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] add access to AMD secure silicon area 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 11:09:29 +0100
Message-ID: <19345.1034676569@passion.cambridge.redhat.com>
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

cdavies@altera.com said:
> This patch makes the secure silicon (secsi) area available in some AMD
> flash  devices available for reading via the read_user_prot_reg/
> read_fact_prot_reg  functions. 

+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);

Is this always correct?

+        /* does this chip even have a secsi area? */
+	if(cfi->mfr!=1)
+		return -EINVAL;
+	switch(cfi->id){
+	case 0x50:
+	case 0x53:
+	case 0x55:
+	case 0x56:
+	case 0x5C:
+	case 0x5F:
+		break;
+	default:
+		return -EINVAL;

Er, is this information not available from the CFI info? I really want to 
avoid having stuff like this in the chip drivers.


--
dwmw2
