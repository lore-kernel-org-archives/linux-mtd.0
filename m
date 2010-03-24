Received: from s87.loopia.se ([194.9.95.115])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NuQWj-0007Bd-P5
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2010 13:21:46 +0000
Received: from s57.loopia.se (s34.loopia.se [194.9.94.70])
	by s87.loopia.se (Postfix) with ESMTP id B6B1F300060
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Mar 2010 14:21:41 +0100 (CET)
Received: from 212-162-171-110.skbbip.com (HELO [172.16.1.206])
	(leo.barnes@algotrim.com@[212.162.171.110])
	(envelope-sender <leo.barnes@algotrim.com>)
	by s57.loopia.se (qmail-ldap-1.03) with AES256-SHA encrypted SMTP
	for <linux-mtd@lists.infradead.org>; 24 Mar 2010 13:21:37 -0000
Message-ID: <4BAA11DF.3060306@algotrim.com>
Date: Wed, 24 Mar 2010 14:21:35 +0100
From: Leo Barnes <leo.barnes@algotrim.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Enabling D-cache for OneNAND bufferram
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I am currently writing a piece of software that takes advantage of the 
fact that OneNAND supports read-while-loading. What I am doing is trying 
to achieve higher efficiency when decoding data from the OneNAND by 
decoding data that is available in the OneNAND bufferram directly 
instead of copying it to normal RAM and decoding there. So far, I have 
gotten quite poor results due to the fact that the bufferrams are not 
cached (for good reason since it is Device memory). My software will be 
used on ARM devices of different types, with my testrigs being a Nokia 
N810 and a N900.

I have exclusive access to the OneNAND chip, and as such know exactly 
what information is stored in the bufferrams at all times. If I could 
only enable the D-cache for the bufferrams, I could therefore make sure 
to invalidate the cache whenever I reprogram the OneNAND chip.

 From what I have read so far, it seems that the only way to enable 
cacheing of the bufferrams would be to somehow change how the memory 
attributes for the memory region in the MMU. I have however not found 
any easy way of doing this. Any tips? I dont really have very much 
experience when it comes to how the MMU works.

Best regards,
Leo
