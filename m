Received: from [202.153.40.245] (helo=hyd.hyd.hellosoft.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IB2Na-00025T-Iq
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 01:47:19 -0400
Received: from [192.168.2.243] (unknown [192.168.4.174])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hyd.hyd.hellosoft.com (Postfix) with ESMTP id D9957F5802A
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Jul 2007 11:24:55 +0530 (IST)
Message-ID: <469DA8CE.1000405@hyd.hellosoft.com>
Date: Wed, 18 Jul 2007 11:14:46 +0530
From: Ranga Raju B <brraju@hyd.hellosoft.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Controller which doesn't give spare area access
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: brraju@hyd.hellosoft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   
1. The NFC I am using doesn't give read/write access to spare area.
2. I have to write 512 bytes at a time or read 512 bytes at a time.
3. I don't have access to status, ready/busy pin.

Please tell me what auto placement strategy I need to adopt. What ECC 
scheme I need to use. It has a HW ECC Generator but I don't have access 
to the value of ECC.
I only get an interrupt if there is a ECC mismatch.

Best regards
Ranga Raju B
