Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHFuV-0006n0-0C
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 03:18:03 -0400
Message-ID: <432E660F.3010508@inf.u-szeged.hu>
Date: Mon, 19 Sep 2005 09:17:35 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Rob Zwiebel <rob.zwiebel@leitch.com>
References: <200501101530.46348.rob.zwiebel@leitch.com>
In-Reply-To: <200501101530.46348.rob.zwiebel@leitch.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: zlib version 1.1.3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,

Rob Zwiebel wrote:

>I am using SUSE 9.1 which includes zlib version 1.1.3.
>
>When I compile the latest version of the mkfs.jffs2. 
>There are errors caused by the lack of the zalloc variable found in the 
>z_stream structure.
>
>compr_zlib.c: In function `jffs2_zlib_compress':
>compr_zlib.c:65: error: structure has no member named `zalloc'
>compr_zlib.c:66: error: structure has no member named `zfree'
>compr_zlib.c:68: warning: implicit declaration of function `deflateInit'
>compr_zlib.c:80: warning: implicit declaration of function `deflate'
>compr_zlib.c:82: warning: implicit declaration of function `deflateEnd'
>compr_zlib.c: In function `jffs2_zlib_decompress':
>compr_zlib.c:110: error: structure has no member named `zalloc'
>compr_zlib.c:111: error: structure has no member named `zfree'
>compr_zlib.c:113: warning: implicit declaration of function `inflateInit'
>compr_zlib.c:124: warning: implicit declaration of function `inflate'
>compr_zlib.c:127: warning: implicit declaration of function `inflateEnd'
>  
>
Did you installed the development package of zlib, too?

At me there is two zlib related packages installed: 
zlib1g and zlib1g-dev. 

The version of them is 1.2.2 and on an other machine it is 1.1.4 - so I think it should work with 1.1.3, too.

Bye,
Ferenc
