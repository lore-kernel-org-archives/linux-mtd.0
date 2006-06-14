Received: from fra-del-01.spheriq.net ([195.46.51.97])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FqcCK-0000PA-2R
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 16:42:53 -0400
Received: from fra-out-03.spheriq.net (fra-out-03.spheriq.net [195.46.51.131])
	by fra-del-01.spheriq.net with ESMTP id k5EKgSk0020645
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 20:42:28 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-03.spheriq.net with ESMTP id k5EKgRoC015188
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 20:42:27 GMT
Received: from beta.dmz-us.st.com (beta.dmz-us.st.com [167.4.1.35])
	by fra-cus-01.spheriq.net with ESMTP id k5EKgPir030501
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 20:42:27 GMT
Received: from zeta.dmz-us.st.com (ns4.st.com [167.4.80.115])
	by beta.dmz-us.st.com (STMicroelectronics) with ESMTP id 74114DA41
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 20:42:24 +0000 (GMT)
Received: from mail1.phx.st.com (mail1.phx.st.com [167.4.198.60])
	by zeta.dmz-us.st.com (STMicroelectronics) with ESMTP id 1CF5B4F61D
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 20:42:23 +0000 (GMT)
Message-ID: <44907572.5040304@st.com>
Date: Wed, 14 Jun 2006 13:45:38 -0700
From: Paul J THACKER <paul.thacker@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: suspend/resume for multiple partitions
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On my ARM9-based platform, we have 5 MTD partitions on NOR flash. One of 
those partitions contains a jffs2 filesystem. Upon wake-up from deep 
sleep, the NOR comes up in locked state. The resume code unlocks the 
first partition, but not the rest. This causes subsequent writes to the 
jffs2 filesystem to fail. Debugging showed that the mtd_info struct 
fields for suspend and resume were only set for the first partition. I 
traced this back to add_mtd_partitions():

        if (!i && master->suspend && master->resume) {
                slave->mtd.suspend = part_suspend;
                slave->mtd.resume = part_resume;
        }

which sets the fields, but only for the first partition. Removing the 
"!i" condition seems to fix this problem, at least for my platform.

I'm not that familiar with the MTD code, so can somebody explain why 
it's done this way, and if changing it will break something somewhere else?

Thanks,
Paul
