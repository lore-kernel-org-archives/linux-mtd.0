Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EkKYy-0005Qf-10
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2005 07:07:54 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id DD77C4733B
	for <linux-mtd@lists.infradead.org>;
	Thu,  8 Dec 2005 15:07:16 +0300 (MSK)
Message-ID: <439821F4.7010403@yandex.ru>
Date: Thu, 08 Dec 2005 15:07:16 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NAND simulator
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm going to rework NAND simulator (nandsim, drivers/mtd/nand/nandsim.c) 
to add the following functionality:

1. Emulation of devices larger then 128MB
2. Possibility to manually specify any page size/eraseblock size/flash size.

I am going to remove flash delays emulation as it appears to be 
unusable. No objections?

If there are some additional offers, please, provide.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
