Received: from numenor.qualcomm.com ([129.46.51.58])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5W96-0003lY-TW
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 21:03:25 +0100
Received: from crowley.qualcomm.com (crowley.qualcomm.com [129.46.61.151])
	h93K2R77007699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Fri, 3 Oct 2003 13:02:28 -0700 (PDT)
Received: from HKING.qualcomm.com (hking.qualcomm.com [129.46.71.236])
	h93K2PDw020521	for <linux-mtd@lists.infradead.org>;
	Fri, 3 Oct 2003 13:02:26 -0700 (PDT)
Message-Id: <6.0.0.22.2.20031003125817.03ae9010@e2k.qualcomm.com>
Date: Fri, 03 Oct 2003 13:02:22 -0700
To: linux-mtd@lists.infradead.org
From: Howard King <hking@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: mtd support for 64-bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have a customized board with 4 AMD 29L641V flash chips (4 * 8Mbyte) with 
64-bit wide bus. The mtd driver in linux 2.4.18 kernel does not work for 
this configuration.  Does anyone have similar experiences?  What is the 
solution?  Thanks.
