Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJqsl-0001qY-KK
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 06:06:21 -0400
Message-ID: <4174E7D3.9050706@inf.u-szeged.hu>
Date: Tue, 19 Oct 2004 12:09:23 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru>
In-Reply-To: <4174D508.8050508@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> Just wonder, why the compression mode is the global variable 
> (jffs2_get_compression_mode, defined in compr.c). Theoretically, it 
> should be the attribute of superblock (in this case it would be possible 
> to have several JFFS2 filesystems with different compression modes).

Now the compression mode is a global thing. It can be configured by 
kernelconfig and is the same for every filesystem. There is no reserved 
space to store it in the different JFFS2 filesystems (it should need a 
new type of node or something like that).

There is plans for the future. One of them: there will be "compression 
configurations". This is much more general thing than compression mode. 
(contais not only the compression mode but the set of the enabled 
compressors and its priority) The user will be able to define different 
compressor configuration for files or directories. The description of 
these configuration will be stored in a new type of node 
(RWCOMPACT_COPY), and the index of the requested configuration will be 
stored in the upper 4 bits of 'usercompr' field of jffs2_raw_inode.

But it is only a plan. In mkfs it is already impemented (not commited 
yet), but in the file system for first we plan only to implement a very 
limited version of it (which support only the ability to declare a 
directory(s) for no compression).

Bye,
Ferenc
