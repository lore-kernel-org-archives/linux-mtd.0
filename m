Received: from mail-qy0-f187.google.com ([209.85.221.187])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ml3SJ-0005qP-Cd
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 16:22:11 +0000
Received: by qyk17 with SMTP id 17so1430522qyk.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Sep 2009 09:22:05 -0700 (PDT)
Message-ID: <4AA684A6.1000303@billgatliff.com>
Date: Tue, 08 Sep 2009 11:21:58 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
References: <774508.54364.qm@web110103.mail.gq1.yahoo.com>
In-Reply-To: <774508.54364.qm@web110103.mail.gq1.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Justin Treon wrote:
> For NAND I think there is a simple flow chart to pick your filing system.
>
> Do you have a partition bigger than 256 MBytes?
> If YES: Use UBIFS (@128 MB you can argue the point)
> If NO: Do you have a LOT of RAM?
> 	If YES: Use YAFFS2 (It is fast, but RAM hungry)
> 	If NO: Use JFFS2
>   

With 128MB and/or 1GB partitions, does YAFFS2 use more memory than 
UBIFS?  It does seem to me that YAFFS2 mounts a tad faster, though I 
haven't broken out the stopwatch or anything (yet).


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
