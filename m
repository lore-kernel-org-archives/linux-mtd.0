Received: from mail.ureach.com ([63.150.151.36] helo=ureach.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E52dE-0001MG-OY
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 10:41:45 -0400
Received: from www21.ureach.com (www21.ureach.com [172.16.2.49])
	by ureach.com (8.12.9/8.12.9) with ESMTP id j7GEfaGu032608
	for <linux-mtd@lists.infradead.org>; Tue, 16 Aug 2005 10:41:36 -0400
Date: Tue, 16 Aug 2005 10:41:35 -0400
Message-Id: <200508161441.KAA07341@www21.ureach.com>
To: linux-mtd@lists.infradead.org
From: Manjula D <manboot@ureach.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Subject: Intel NOR flash(P30) query
Reply-To: manboot@ureach.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
Iam a newbie to mtd. We have a MPC8272 custom board with INTEL
TE28F640P30B85 (P30-CFI compilant)NOR boot Flash and NAND flash
with JFFS2 filesystem running linux-2.4.20-8.
The NOR Flash need not have any partition/filesystem.
My requirement is to have an application to copy an image from
the NAND Flash to the NOR Flash.
My current understanding is 
Under RAM/ROM/Flash chip drivers on selecting, 
Detect flash chips by Common Flash Interface (CFI) probe :
  cfi_probe_init() will register with the mtd_chip_driver.
Support for Intel/Sharp flash chips:
  cfi_cmdset_0001.c contains the list of commands supported by
  Intel.
  
1) I need to understand how the application views the NOR flash
    once it is registered as a mtd device.
2) Once i register as mtd_chip_driver how can i call the
    read/write commands of the flash from the application?
3) What is do_map_probe for and how is it different from
    cfi_probe?

  -Thanks
  Manju

________________________________________________
Get your own "800" number
Voicemail, fax, email, and a lot more
http://www.ureach.com/reg/tag
