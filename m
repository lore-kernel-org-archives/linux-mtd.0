Received: from pecos2.iphase.com ([157.175.3.201] helo=iphase.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Jqyr-0001Ro-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 08:03:34 +0000
Received: from france.iphase.com (ariane [157.175.31.1])
	by iphase.com (8.8.8+Sun/8.8.7) with ESMTP id CAA27495
	for <linux-mtd@lists.infradead.org>; Thu, 5 Dec 2002 02:33:37 -0600 (CST)
Received: from thlang by france.iphase.com
	with SMTP (MDaemon.PRO.v5.0.4.R)
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 09:32:57 +0100
Message-ID: <005f01c29c38$47d813c0$221faf9d@iphase.com>
Reply-To: "Chantara Thlang" <thlang@iphase.com>
From: "Chantara Thlang" <thlang@iphase.com>
To: <linux-mtd@lists.infradead.org>
References: <001401c29c29$89845ae0$1e0da8c0@skumar>
Subject: JFFS2 questions
Date: Thu, 5 Dec 2002 09:28:25 +0100
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

Hi all,
I am facing with several questions with JFFS2. Could someone give me some
responses .....

what is the meaning for Empty Block and Marking dirty, why do I have Empty
Block ????
 jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
0x1985e002)! Marking dirty


The file system I created is very small size (5 MB) and the /dev/mtdblock2
size is around 30 MB

It seems that JFFS2 scans the entire memory space and erase unmarked block
 jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0100000c:
0xffff instead

Who is supoosed to write the Magic bitmask ???
Why Jffs2 scans the entire memory space ? It is not supposed to end at the
last address that we can find in the file system that I created with
mkfs.jffs2 ????


Write clean marker to block at 0x016c0000 failed: -5
Newly-erased block contained word 0xffff0198 at offset 0x01000004

What is a clean marker ???

Thanks in advance,

Chantara Thlang
Interphase Corporation
855 Avenue Roger Salengro
92370 Chaville
Tel.: (+33) (0)1.41.15.44.32
Fax.:(+33) (0)1.41.15.12.13
