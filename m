Received: from dekhockeyquebec.com ([66.201.193.5] helo=mail.webnet.qc.ca)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 173L5v-0003wI-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 19:14:19 +0100
Subject: Re: Booting from DOC2000 with GRUB loader
From: Frederick Lefebvre <flefebvre@irg.ca>
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <82EADAEE-5DF3-11D6-B6D6-000502893FA1@regolith.co.uk>
References: <82EADAEE-5DF3-11D6-B6D6-000502893FA1@regolith.co.uk>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 02 May 2002 14:17:19 -0400
Message-Id: <1020363439.31863.18.camel@zeus>
Mime-Version: 1.0
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

I have some poblem getting grub+doc working.

I followed the instructions :

1- patched grub-0.91 with mtd/patches/grub-2002-02-19-doc.patch
2- ./configure --enable-diskonchip-2000
3- make
4- cp stage2/pre_stage2 mtd/grub
5- cd mtd/grub
6- make
7- ../util/doc_loadbios /dev/mtd0 grub_firmware
8- reboot (I have a nftl partition right after the grub on the doc 2000)

I get the grub prompt but it does not know about dc0.  When I enter
"root (dc0,0)", I get : "Error 21: Selected disk does not exist".

Did I do something wrong?

Fred
