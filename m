Received: from enigma.barak.net.il ([212.150.48.99])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17G0S3-00088L-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2002 17:49:31 +0100
Message-ID: <006801c20d82$697b6800$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: <dwmw2@infradead.org>
Cc: "Linux - MTD list" <linux-mtd@lists.infradead.org>
Subject: Fw: jffs2 crc errors
Date: Thu, 6 Jun 2002 19:48:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> i encounter this err in boot:
>
> jffs2_scan_inode_node(): Data CRC failed on node at 0x001eaa24: Read
> 0xda7b03c2,
>  calculated 0x0da9fb30
>
> and it keeps appearing every boot.
>
> is it bad ?
>
> maybe its not fixed becuse i'm terminating the jffs optimization thread in
> the middle of the init process ?
>
> thanks
>
> Gad
