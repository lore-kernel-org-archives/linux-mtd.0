Received: from mail2.cirilium.com ([12.47.176.10] helo=typhoon.cirilium.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Mxfy-0002RG-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 21:12:06 +0100
Message-ID: <3B55EECB.11AD8886@cirilium.com>
Date: Wed, 18 Jul 2001 16:17:15 -0400
From: Stephen Brasher <sbrasher@cirilium.com>
MIME-Version: 1.0
To: uclinux-dev@uclinux.org, jffs-dev@axis.com,
 	linux-mtd@lists.infradead.org
Subject: jffs and tinylogin on uClinux
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

Does anyone have tinylogin working with jffs?  I am backporting
it to 2.0.38.1pre7 and when updating the passwd file in /etc,
the hard link fails to the passwd.lock file.  The version of 
jffs that I am using does not support hard links.  

Thanks in advance.
-- 
Stephen Brasher
sbrasher@cirilium.com
Sr Development Engineer

Cirilium Corp.
1615 S. 52nd St. 
Tempe, AZ 85821
