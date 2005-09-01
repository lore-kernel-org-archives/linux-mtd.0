Received: from smtprelay01.ispgateway.de ([80.67.18.13])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAm0s-0000nP-F8
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 06:10:23 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.94.177])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay01.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 1 Sep 2005 10:09:38 -0000
Message-ID: <4316D361.3030203@gmail.com>
Date: Thu, 01 Sep 2005 12:09:37 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
References: <0IM4002SYUMFJ8@mmp2.samsung.com>
In-Reply-To: <0IM4002SYUMFJ8@mmp2.samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > I don't know the exactly but I heard that JFFS2 handles runtime
 > badblock internally.
 > So OneNAND MTD don't care badblock handling in read/write function.
 > MTD only care the initial bad block at erase operation.

Isn't this rather important? :-) As I said, I'm rather new to the bad 
block stuff, so I'm ashamed of don't knowing it at all. Can JFFS2 
recognize a bad block without OneNAND driver explicitely reporting one?? 
I'm very interested in this thing; presumably it may be easy to find out 
having a look on the list's NAND BBT threads...

 > In our commercial software, we use another bad block handling, known
 > as Bad Block Management (BBM) based on replace instead of skip as BBT
 > So we don't care the intial bad and runtime bad.
 > Now we are trying to implement our scheme and will be released at open
 > source. But not yet available in this time.

You are speaking about RFS? I'm wondering for quite a time about the 
technical and commercial parallels/differences of MTD/JFFS2 and RFS...

Do you have any (public) comment on the occurence of (runtime) bad 
blocks? When, why, ...?

 > If do you have any question. please let me know :)

Too many to write down, but I'll try ;-)

Regards,
Bernhard
