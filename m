Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17n3nO-0004uG-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2002 22:04:10 +0100
Received: from [192.168.5.81] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2516990 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2002 14:04:20 -0700
Message-ID: <3D77C812.3080108@redswitch.com>
Date: Thu, 05 Sep 2002 14:09:38 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: writing to jffs2 is so slow?
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

I have an empty mtd partition (capacity is 16 MB) where a jffs2 fs is 
mounted. The strange observation is that making a first directory on 
that partition takes almost 2 minutes. So far I observed this behaviour 
just when making the first directory and just on that particular 
partition. Can anyone help me to explain this? Is there anything wrong 
with flash memory (hardware) or MTD device driver or JFFS2? Thanks.

- Shawn.
