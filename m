Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOcfl-0008V4-RA
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 10:28:54 -0400
Message-ID: <4267B8EF.6000803@inf.u-szeged.hu>
Date: Thu, 21 Apr 2005 16:30:07 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050413T142519-107@post.gmane.org>	<425E3174.4030308@inf.u-szeged.hu>	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
	<loom.20050420T165531-253@post.gmane.org>
In-Reply-To: <loom.20050420T165531-253@post.gmane.org>
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

>Hmm.. then what improvement does summary patch provide? In my case mount
>returns in 1.5 minutes but then I cannot do anything to flash for
>another 20+ minutes.
>  
>
Yes, that is the CRC checking time.

Anyway, we are now working on a new boot time speed up technique. We 
call it centralized summary. The "old" summary is erase block summary.

Centralized summary will store information not at the end of every erase 
block, but in a centralized space. It'll stores it at the umount time, 
so if you do a clean umount the next mount will be very fast. Now it a 
prototype state.

If you would like to test it I can send a patch. I would be also useful 
for us, because we don't have real NAND device, so we cannot make real 
measurements. (Forutnatelly we can use Artem's NAND simulator.)

Bye,
Ferenc

P.s.: Artem: you wrote that you don't think that swithing off the CRC 
checking of summarized node is safe. Can you explain why? (I don't know 
the behavior of NAND deeply) Becuse it may help for Sergei...
