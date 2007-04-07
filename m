Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HZzco-0000SI-0V
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 21:21:54 -0400
Received: from archite by server37.tchmachines.com with local (Exim 4.63)
	(envelope-from <linux@architechnical.net>) id 1HZzcU-0001Pw-QG
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 21:21:34 -0400
Message-ID: <33135.69.30.123.186.1175908894.squirrel@architechnical.net>
Date: Fri, 6 Apr 2007 18:21:34 -0700 (PDT)
Subject: OneNAND IRQ usage?
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've dedicated a GPIO line on the PXA-270 to monitor the INT line of a 1G
OneNAND.  Using an IRQ resource and the "generic platform support" I was
able to get the OneNAND driver to request the IRQ, but the interrupt was
not being handled and the driver reverted to polling.  I was able to get
this to work by changing the IRQF_SHARED flag to IRQF_TRIGGER_FALLING. 
Should onenand_base.c be patched or am I mapping it to the platform
improperly?

Thanks,
Pete MacKay
