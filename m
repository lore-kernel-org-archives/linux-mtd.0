Received: from motgate3.mot.com ([144.189.100.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Lcza-0005R9-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 05:31:38 +0000
Reply-To: <fred@sc23.sc.mcel.mot.com>
From: "fred" <fred@sc23.sc.mcel.mot.com>
To: <linuxppc-embedded@lists.linuxppc.org>, <linux-mtd@lists.infradead.org>
Subject: Which filesystem can live on one flash sector?
Date: Tue, 10 Dec 2002 14:02:05 +0800
Message-ID: <000001c2a011$ab5926f0$940879c8@sc.mcel.mot.com>
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

I am using CRAMFS plus RAMFS on my board.
And there is only one sector left for saving configuration data.
Can I put a file system, e.g. JFFS, on it?

BR,
Fred
