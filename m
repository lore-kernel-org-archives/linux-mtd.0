Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hLKy-0007O9-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 03:35:12 +0100
Received: from [192.168.5.81] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2502027 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2002 19:35:20 -0700
Message-ID: <3D62FD94.10009@redswitch.com>
Date: Tue, 20 Aug 2002 19:40:20 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: basic question on CFI flash and JEDEC flash
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

A basic question on flash memory. What's the difference between CFI and 
JEDEC flash?

I'm trying to add support of AMD Am29LV642D in MTD. After looking into 
MTD device drivers, I found three source files doing flash memory probe. 
They are cfi_probe.c, jedec_probe.c and jedec.c. The comments on jedec.c 
clearly descibe its usage. But I don't quite understand the other two 
files. Literally cfi_probe.c does cfi-compliant flash probe and 
jedec_probe.c does jedec flash probe. My confusion comes from that 
jedec_probe.c actually calls many cfi-related functions. So what should 
I do to support Am29LV642D?

BTW, I successfully added Intel I28F160F3T support, which is an JEDEC 
type flash (not sure about this, :(), by adding corresponding 
information into jedec_table[].

Thanks.

- Shawn.
