Received: from relay2.mail.twtelecom.net ([216.54.204.190])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDX9b-0006zx-6K
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 00:17:19 +0100
Received: from MenInBlack.conformative.com (unknown [204.57.109.134])
	by relay2.mail.twtelecom.net (Postfix) with ESMTP id 9636AC1CE
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Apr 2004 18:17:09 -0500 (CDT)
Message-Id: <6.0.3.0.2.20040413175343.01c1b5a8@mail.conformative.com>
Date: Tue, 13 Apr 2004 18:14:42 -0500
To: linux-mtd@lists.infradead.org
From: Clay Douglass <clay.douglass@conformative.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: List of supported devices?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


A couple, hopefully quick questions. I have downloaded all the source and 
documentation I could find. I found many parts "IDs" in various files. I 
was wondering if there is some more central place to look to see if a given 
part is supported? Or some better way (magic grep pattern?) to collect the 
supported parts "IDs"...


Specifically, I did not find any Intel Sync Strata Flash parts (e.g. 
RC28F256JC3) in the list. From my, admittedly limited understanding, all I 
would have to write is  basic block read/write/erase functions? Is there a 
document on this set of function I missed?

Any comments how much work I'm biting off here?

Thanks in advance for your time,

Clay Douglass
