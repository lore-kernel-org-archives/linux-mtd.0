Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CfGMk-0004kN-IB
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 06:33:47 -0500
Message-ID: <41C2C416.5090602@arcom.com>
Date: Fri, 17 Dec 2004 11:33:42 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
References: <JPEALJAFNGDDLOPNDIEEEEGDCPAA.joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEEEGDCPAA.joakim.tjernlund@lumentis.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> 
> 2) Consider another checksum algorithm. Crc32 is very expensive
>    and JFFS2 suffered severely in the early days. Now that crc32 is
>    very optimized that problem is less visible, but crc32 is still
>    expensive. Maybe an Adler32 checksum is good enough or a crc16?

Does anyone have links to the profilling data that showed this?

(Also, I wouldn't have thought crc16 on 32 bit archs would have any 
significant performance benefits.  But since I don't know either the 
crc16 or crc32 algorithms... *shrug*)

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
