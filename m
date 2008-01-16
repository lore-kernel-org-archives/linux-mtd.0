Received: from ipn36372-d52026.cidr.lightship.net ([216.204.15.186]
	helo=zeus.bittware.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JF8s4-0001Ng-Mm
	for linux-mtd@lists.infradead.org; Wed, 16 Jan 2008 14:04:00 +0000
Message-ID: <478E0D5E.8070508@bittware.com>
Date: Wed, 16 Jan 2008 08:57:50 -0500
From: DMcLeod <dmcleod@bittware.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 access time
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We are using uClinux git 2.6.23. We have 4 2.5MB files sitting in a 
directory on a ~40MB jffs2 partition (on NOR flash). The very first time 
we do an 'ls' in that directory, the response takes literally minutes. 
After the initial delay, any accesses to those files are very 
quick.,,Originally, we started off with the Microtronix 1.4 kernel and 
it did not have this problem. The pre-git version of uClinux-dist had 
this problem but not as severe - it was more like 40 seconds to list the 
contents of that directory.


Thanks in advance,
