Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEWAz-0004VP-Ll
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 12:31:22 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DEWAY-0006dT-OF
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 18:31:01 +0100
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 18:30:54 +0100
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 18:30:54 +0100
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 24 Mar 2005 17:28:40 +0000 (UTC)
Message-ID: <loom.20050324T182625-656@post.gmane.org>
References: <loom.20050322T224733-491@post.gmane.org>	<4241396B.D689EB32@st.com>
	<loom.20050323T212715-407@post.gmane.org>
	<4242925F.D29BC7CE@st.com> <42429C1C.8050600@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy <dedekind <at> yandex.ru> writes:


> 1. write only 0-PAGE_SIZE bytes;
> 2. do not overlap n*PAGE_SIZE borders (n is 1,2, ...)
> 3. do fsync after write.
........
> Examples:
> (assume PAGE_SIZE is 4K)
> 
> write 4K to offset 16K is OK
> write 1 byte anywhere is OK
> write 10 bytes at offset 4095 is not OK.

Artem, when figuring out if the write goes over the page boudary you did not say
anything about CRC and other non-user data.. Should it be taken into account 
too or am I missing something?

Sergei Sharonov
