Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jpZk-0004b2-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 00:16:45 +0100
Message-ID: <3D6C0999.4020507@redswitch.com>
Date: Tue, 27 Aug 2002 16:22:01 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: how to get mtd_info in kernel space?
References: <3D6BF554.3090102@redswitch.com> <30390.1030485871@redhat.com>
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

Thanks for the answer. My proposed device will contain basically some 
configuration data. But they are not as simple as MAC address. The size 
will grow dynamically.

I want such a flexible function to get minor number because our 
partitions may be changed later thus those numbers cannot be fixed. 
Anyway, since now the only way is to use the fix minor number, I'm OK 
with current mechanism. ;)

- Shawn.
