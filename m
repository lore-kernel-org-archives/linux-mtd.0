Received: from smtp-vbr1.xs4all.nl ([194.109.24.21])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N639r-0006ab-GL
	for linux-mtd@lists.infradead.org; Thu, 05 Nov 2009 14:17:56 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr1.xs4all.nl (8.13.8/8.13.8) with ESMTP id nA5EHbxb090654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Thu, 5 Nov 2009 15:17:37 +0100 (CET)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4AF2DE80.5010808@aimvalley.nl>
Date: Thu, 05 Nov 2009 15:17:36 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: can UBIFS be NFS exported
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


just to make sure. UBIFS can not be NFS exported, is this correct ?

(I need NFS in our distributed system. The server uses UBIFS.
  But there is a ISO9660 image on our UBIFS and fortunately
  ISO(Z)FS can be NFS exported, so it's not a problem)
