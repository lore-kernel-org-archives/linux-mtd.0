Received: from 173-11-172-146-houston.txt.hfc.comcastbusiness.net
	([173.11.172.146] helo=mail.breakawaysystems.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PcPH3-00058E-CZ
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2011 21:27:34 +0000
Received: from [192.168.1.100]
	(173-11.172.145-houston.txt.hfc.comcastbusiness.net [173.11.172.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: dlambert)
	by mail.breakawaysystems.com (Postfix) with ESMTPSA id E190B148BE4
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2011 15:27:27 -0600 (CST)
Message-ID: <4D2B79BF.6080304@lambsys.com>
Date: Mon, 10 Jan 2011 15:27:27 -0600
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Confusion over mkfs.ubifs versions
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

After upgrading to Ubuntu 10.10 I noticed that the stock mkfs.ubifs 
(version 1.3) failed to compute checksums correctly. I compiled my own 
version from the git source of mtd-utils which announces itself as 
version 1.4; this worked fine. Being curious I logged onto a machine 
running Ubuntu 10.4 and checked the version of mkfs.ubifs and also found 
it to be 1.3, but this version computes checksums correctly! Is there a 
sub-version of mkfs.ubifs between 1.3 and 1.4 that is not shown by using 
--version? Am I missing something critical here?

Regards,

Dave.
