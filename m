Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cyLG-0007P1-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 02:13:26 +0100
Received: from [192.168.5.81] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2468724 for linux-mtd@lists.infradead.org; Thu, 08 Aug 2002 18:13:34 -0700
Message-ID: <3D53185C.9060100@redswitch.com>
Date: Thu, 08 Aug 2002 18:18:20 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: A custom board need a specific map file?
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

For a custom board, is it necessary to write a specific map file like 
'rpxlite.c' and 'mbx860.c'? I'm really new to MTD stuff. I looked into 
these two files as examples and found that they are almost similar. BTW, 
what's differece between '__raw_readb()' and 'readb()'? Thanks.

- Shawn.
