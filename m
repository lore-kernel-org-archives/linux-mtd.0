Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxJvv-0000iS-30
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 03:33:05 -0400
Message-ID: <42E5E816.5090500@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 09:36:54 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>	<20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru>
In-Reply-To: <42E0E2C8.7090304@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> BTW, IMO the Summary patch of Ferenc Havasi is not yet in CVS (even 
> though it greatly helps with mount time) because he didn't bothered 
> making it cute. He just took messy JFFS2 code, and made it even messier. 
> I'd be glad to see Ferenc's patch nice and in CVS.

We also would be happy if it summary patch would be the part of the 
official JFFS2 (at least the erase block summary).

If I remember well David (dwmw2) said that it should be the part of 
JFFS3 only, because he would like to see only bugfixes in JFFS2. He did 
not mentioned that the reason is that it is messy. If it is true we will 
clean it (or partially rewrite if necessery) just please say some words 
about exactly why and where it is messy.

Thanks,
Ferenc
