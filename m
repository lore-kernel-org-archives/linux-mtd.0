Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Db1lK-0001sN-OY
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 15:41:57 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 4DBD2BAA0
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 21:41:53 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42460-09 for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 21:41:43 +0200 (CEST)
Received: from [192.168.0.77] (clj22-23.dial-up.arnes.si [153.5.34.23])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id B13D7BAAE
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 21:41:43 +0200 (CEST)
Message-ID: <4294D4F2.6010105@cetrtapot.si>
Date: Wed, 25 May 2005 21:41:38 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Serial flash memory support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

I'm starting to code kernel driver for SPI serial flash memory (we are using 
M25Pxx chips from ST). In the end I would like to see this chip to hold jffs2 
fs and be mtd-compatible. After quick inspection of current CVS code I didn't 
find any code in there for SPI flash. So my questions are:

Has anybody done something on the SPI flash memory devices already?

If I start to implement mtd driver for this chip what functions do I need?

I've glimpsed over the mtd_info struct which contains lots of function pointers 
- are they all necessary?

regards,
hinko k

-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
