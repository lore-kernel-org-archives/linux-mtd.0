Received: from [164.164.83.132] (helo=arianne.in.ishoni.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15OfRc-0001vS-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2001 14:08:21 +0100
Received: from raghav ([192.168.1.172])
	by arianne.in.ishoni.com (8.11.1/8.11.4/Ishonir2) with SMTP id f6NDIKd07546
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2001 18:48:21 +0530
Reply-To: <raghav@ishoni.com>
From: "Raghav P" <raghav@ishoni.com>
To: <linux-mtd@lists.infradead.org>
Subject: Porting FFS2 on MIPS
Date: Mon, 23 Jul 2001 18:49:09 +0530
Message-ID: <E0FDC90A9031D511915D00C04F0CCD250399CB@LEONOID>
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

I am trying to get FFS2 working on my big endian MIPS. I was doing a dump of
a formatted FFS2 flash and it was storing the FFS2 data structures in little
endian mode. Since I do not have access to the format document nor access to
FFS2 documenatation; can anyone point as to whether FFS2 specifies any
endian for storing the data structures?

Thanks
Raghav

_________________________________________________
P.Raghavan
ishoni Networks (India) Pvt Ltd (http://www.ishoni.com)
...Broadband for everyone
email:raghav@ishoni.com
Phone: +91-80-2292125 (Work)
Fax: +91-80-2995545 (Work)
