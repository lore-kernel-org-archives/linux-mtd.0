Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CfFp2-0003Vf-1l
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 05:58:59 -0500
Date: Fri, 17 Dec 2004 10:46:40 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.61.0412171045400.11077@hex.linuxgrrls.org>
References: <JPEALJAFNGDDLOPNDIEEGEHCCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Fri, 17 Dec 2004, Artem B. Bityuckiy wrote:

>> Another idea, calculate the CRC backwards(from the end of the buffer to the beginning).
>> That give better L1 cache behaviour.
>>
> Why (may be some URL)? For all archs?

Because the process to use the buffer after the CRC will probably start 
from the beginning.  Processing the CRC from the beginning to the end will 
tend to leave the L1 cache full of the end of the buffer and thus the next 
process to use it will need to reload the L1.

-J.
