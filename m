Received: from enigma.barak.net.il ([212.150.48.99])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JvBR-0002Xz-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 13:00:34 +0100
Received: from gad ([10.10.11.11]) by enigma.barak.net.il
          (InterMail vK.4.03.00.00 201-232-121 license 5444ddd44659357c6c93343e0ce38507)
          with SMTP id <20020617120204.IIMW9834.enigma@gad>
          for <linux-mtd@lists.infradead.org>;
          Mon, 17 Jun 2002 15:02:04 +0300
Message-ID: <004c01c215fe$ed08f960$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Linux - MTD list" <linux-mtd@lists.infradead.org>
Subject: slow copy on jffs2
Date: Mon, 17 Jun 2002 15:00:16 +0200
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

why a simple copy of 87 kbytes file from CF (ext2) to JFFS2 partition takes
about 30 seconds ?
i use SA1110 , nanoengine , 2.4.17-rmk1-bse kernel.

thanks

Gad
