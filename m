Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kFIH-0002Qo-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 03:44:25 +0100
Received: from [192.168.5.81] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2510106 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2002 19:44:35 -0700
Message-ID: <3D6D8BC6.8000909@redswitch.com>
Date: Wed, 28 Aug 2002 19:49:42 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: the latest MTD code from CVS has compilation errors
Content-Type: text/plain; charset=us-ascii; format=flowed
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

I tried to compile the latest MTD code got from CVS tree on linux 2.4.4 
(from DENX). When fs/jffs2/background.c is compiled, it complains that
   background.c:108: arguments given to macro 'recalc_sigpending'
   background.c:155: arguments given to macro 'recalc_sigpending'
errors. I looked into the code and included header file. In 
linux/mtd/compatmac.h the macro is re-defined to have no arguments at 
all if kernel version < 2.5.5. So in my case 108 and 155 should be 
changed to have no arguments.

Anybody reported this "bug" before?

- Shawn.

PS: compatmac.h's modification date is 2002/08/07, version v1.39.
