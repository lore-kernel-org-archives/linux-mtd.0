Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM0DR-0002ZO-BF
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 05:00:50 -0400
Message-ID: <425E3174.4030308@inf.u-szeged.hu>
Date: Thu, 14 Apr 2005 11:01:40 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050413T142519-107@post.gmane.org>
In-Reply-To: <loom.20050413T142519-107@post.gmane.org>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

>It looks like there is a long delay before filesystem becomes available 
>after mount returns. Test setup: jffs2 on 256 MByte NAND chip, 2.6.10 linux
>  
>
Just an idea: you may try out our summary patch. ( 
http://www.inf.u-szeged.hu/jffs2/mount.php )

It makes the mount time faster and there is an experimental option, 
where you can disable the check the CRC of nodes which have good 
summary. (most of the nodes will have it, if you use it correctly)

Regards,
Ferenc
