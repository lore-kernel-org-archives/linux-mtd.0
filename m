Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Coemf-0006zs-Nu
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 04:27:23 -0500
Message-ID: <41E4EDBE.8070302@inf.u-szeged.hu>
Date: Wed, 12 Jan 2005 10:28:30 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <41E4D6E5.1090407@imc-berlin.de>
In-Reply-To: <41E4D6E5.1090407@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steven,

> But then it looks to me that - shortly after boot - the GC thread doing 
> the same again (in background.c), which takes another 6 scondes and 
> slows down the application startup...

If I am right there are two kind of CRC: hdr_crc and node_crc. At 
mounting time only the hdr_crc is checked which depends on only the 
header. (using summary there is only one summary CRC check)

Later (when the data is readed or in the background by GC) the node_crc 
will also be checked. GC is running on a "niced" (10) priority, so it 
should not disturb any other process.

If I am right the CRC protects against unclean reboots and hardware 
corruptions. If you need we can modify the summary patch not to check 
node_crc for summarized nodes (where the unclean reboots is no problem), 
but if we do it you lose the ability to detect the hardware corruption 
(flash errors). Unfortunatelly NOR flash doesn't have any error detection.

Bye,
Ferenc
