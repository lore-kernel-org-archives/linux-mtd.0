Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4mTD-00048Q-Qn
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 17:26:16 -0400
Message-ID: <43010875.4050708@inf.u-szeged.hu>
Date: Mon, 15 Aug 2005 23:26:13 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Ryan B. Lynch" <rlynch@bway.net>
References: <4300BEE2.4020104@bway.net>
In-Reply-To: <4300BEE2.4020104@bway.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: possible bug in "--pad" option for mkfs.jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ryan,

>I run 'mkfs.jffs2' with the following command line:
>
> $ /usr/sbin/mkfs.jffs2 \
> >    -r /tmp/root \
> >    -o /tmp/image-20050815.160044.jffs2 \
> >    -e 0x10000 \
> >    -p 214171648
>
>The image size is NOT padded to 214,171,648 bytes, though--the size
>  
>

Do not use space between -p and its parameter. It will work.

It is getopt bug (or feature) which happens using optional parameter.

If we whould change it to required parameter, than both "-p X" and "-pX"
would be OK, but in this case "-p X" means "-p" without parameter and X
- if I'm right.

Ferenc
