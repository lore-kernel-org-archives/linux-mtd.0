Received: from smtp-vbr10.xs4all.nl ([194.109.24.30])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbV16-0000LA-30
	for linux-mtd@lists.infradead.org; Thu, 13 Aug 2009 07:46:36 +0000
Message-ID: <4A83C4D5.8080704@aimvalley.nl>
Date: Thu, 13 Aug 2009 09:46:29 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Teun Grinwis <teun@adesys.nl>
Subject: Re: flash section set to 0x0 on jffs2 filesystem
References: <4A83BD1F.6070806@adesys.nl>
In-Reply-To: <4A83BD1F.6070806@adesys.nl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mtd List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hallo Teun,

Is there no kernel/jffs2 error message or whatsoever ?
I would expect a node CRC error (maybe if you unount and mount jffs2 fs again).

Use jffs2dump to check your jffs2 partition, it's available
in the mtd-utils git repository, see git://git.infradead.org/mtd-utils.git

It's difficult to "reconstruct" the original exec. file though from
the jffs2dump info since jffs2 compresses data.

Groetjes,
Norbert.
