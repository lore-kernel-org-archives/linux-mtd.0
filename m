Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kvtB-0007LI-00
	for <linux-mtd@lists.infradead.org>; Sat, 31 Aug 2002 01:13:21 +0100
Received: from [192.168.5.58] (HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2512490 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2002 17:13:31 -0700
Message-ID: <3D700A1F.9040208@redswitch.com>
Date: Fri, 30 Aug 2002 17:13:19 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd write takes 5 minutes
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

I have a weird problem when writing hundreds of bytes to an mtd device. 
It takes about 5 minutes. The situation is as follows.

In module A initialization, a kernel thread is created to update some 
configuration which is stored in an mtd device. But this thead spent 
almost 5 minutes to finish writing hundreds of bytes data. What caused 
this problem? I guess the mtd write was waiting for resources. If so, 
what kind of resources did it wait for?

Thanks.

- Shawn.
