Received: from 246.063.dsl.mel.iprimus.net.au ([211.27.107.246]
	helo=greyinnovation.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgsPv-0002NT-Sl
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 18:28:19 -0500
Message-ID: <438B9355.6080603@greyinnovation.com>
Date: Tue, 29 Nov 2005 10:31:33 +1100
From: Tehn Yit Chin <tehn-yit.chin@greyinnovation.com>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <4386F21B.9010507@inf.u-szeged.hu>
In-Reply-To: <4386F21B.9010507@inf.u-szeged.hu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: New compression method for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> New feautres:
> - it uses the kernel's CryptoAPI interface, and will allow not only
> compressors but also crypto algorithms
> - advanced compressor configuration which allows to compress/encode a
> block with more algorithm sequencially.
> - certainly full backward compatibility for old JFFS2 images
> 

With the crypto stuff being used, is there much of a performance hit?

Tehn Yit Chin
Software Engineer, Grey Innovation Pty. Ltd.
