Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164qxs-0001fs-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 21:56:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002e01c16ec9$1fdddc80$3e03010a@arcom.cc> 
References: <002e01c16ec9$1fdddc80$3e03010a@arcom.cc> 
To: "Alex J Lennon" <ajlennon@arcom.co.uk>
Cc: "Ian Campbell" <icampbell@arcom.co.uk>,
    "Linux MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: Re: [Fwd: Re: Caching of reads] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 16 Nov 2001 22:05:13 +0000
Message-ID: <7102.1005948313@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


> An strace seems to show it's related to the fork(), shortly after the fork()

There should be more debug info than that from JFFS2, shouldn't there?

> <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
> <7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. dsize b, csize b, offset 0, buf c3beec60
> <7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. dsize d, csize d, offset 0, buf c3be1ea0
> <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
> <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
> <7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. dsize b, csize b, offset 0, buf c3beec60
> <7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. dsize d, csize d, offset 0, buf c3be1ea0

Are you sure that's right? Those sizes look suspicious. But it definitely
looks like some of those nodes are being read repeatedly - I don't know why
they're being dropped from the page cache. What kernel, precisely?


> The message in this transmission is sent in confidence for the
> attention of the addressee only and should not be disclosed to any
> other party. Unauthorised recipients are requested to preserve this
> confidentiality. Please advise the sender if the addressee is not
> resident at the receiving end. 

Please could you turn that off?

--
dwmw2
