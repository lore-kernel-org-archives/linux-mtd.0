Received: from mercury.sun.com ([192.9.25.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Krfp-0001TZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 02:23:17 +0100
Received: from hsmtv32a.SFBay.Sun.COM ([129.145.122.36])
	by mercury.Sun.COM (8.9.3+Sun/8.9.3) with ESMTP id SAA04479
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 18:28:55 -0700 (PDT)
Received: from sun.com (natbox [129.145.120.47])
	by hsmtv32a.SFBay.Sun.COM (8.9.3+Sun/8.9.3/ENSMAIL,v2.1p1) with ESMTP id SAA11746
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 18:28:55 -0700 (PDT)
Message-ID: <3B4E5085.62422401@sun.com>
Date: Thu, 12 Jul 2001 18:36:05 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: module names in request_module()
Content-Type: text/plain; charset=us-ascii
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

Hi all, I've noticed a problem:

if I depmod a module that needs cfi and cfi_probe is not loaded,
request_module fails, because it is looking for the module named "cfi" not
"cfi_probe".  

should we fix this?

-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
