Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ChB07-0003ja-9r
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 13:14:20 -0500
Received: by wproxy.gmail.com with SMTP id 69so823wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2004 10:14:18 -0800 (PST)
Message-ID: <1f9886eb0412221014256b83e6@mail.gmail.com>
Date: Wed, 22 Dec 2004 12:14:18 -0600
From: xemc <xemcnet@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041222172637.GE9783@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: xemc <xemcnet@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> adler32 is strong agains 1bit errors:
...
> adler32 is relatively strong against 2bit erros:
... 
> For higher level errors, adler32 should have the usual a-priori
> chances of catching them.
...
> Overall, it is not as good as crc32, but pretty close, esp. for long
> data.  I would entrust my personal data to it, provided that the
> device in general is good enough and the first adler32 checksum
> failure (ignoring power-failure during writes) results in a message to
> discard the broken flash chips or something similar.

Please forgive me if this is a naive question, but isn't this data
also protected by ECC in the first place?  (or is that just for NAND?)
 How strong is this ECC compared to CRC32 or Adler32?

If the ECC can handle a few bit errors, then wouldn't a simple
checksum handle the case where the file was completely corrupt or
partially written?

Please correct any wrong assumptions.
Thanks,
Mike
