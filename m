Received: from ftpbox.mot.com ([129.188.136.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GsSl-0004PV-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Nov 2002 03:02:07 +0000
Received: from pobox4.mot.com (pobox4.mot.com [10.64.251.243])
	by ftpbox.mot.com (Motorola/Ftpbox) with ESMTP id gAR3Wai5012241
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 20:32:36 -0700 (MST)
Received: [from sc23.sc.mcel.mot.com (sc23.sc.mcel.mot.com [200.2.1.23]) by pobox4.mot.com (MOT-pobox4 2.0) with ESMTP id UAA17045 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 20:32:34 -0700 (MST)]
Received: from bj00xx ([200.121.8.148])
	by sc23.sc.mcel.mot.com (8.8.8+Sun/8.8.8) with SMTP id LAA06380
	for <linux-mtd@lists.infradead.org>; Wed, 27 Nov 2002 11:32:30 +0800 (CST)
Reply-To: <fred@sc23.sc.mcel.mot.com>
From: "fred" <fred@sc23.sc.mcel.mot.com>
To: <linux-mtd@lists.infradead.org>
Subject: does compressed JFFS filesystem need ramdisk?
Date: Wed, 27 Nov 2002 11:32:19 +0800
Message-ID: <001001c295c5$97afec20$940879c8@sc.mcel.mot.com>
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

Hi,

I read the mtd/mtd-jffs-HOWTO.txt in MTD home page
http://www.linux-mtd.infradead.org/.
I found that if I'd like to use a compressed JFFS2 file system on MTD device
as root, I would have to decompress it on boot to RAMDISK (in DRAM) and then
mount it.
Is it true?
Why can't I decompress a program in JFFS then run it?

BR,
Fred
