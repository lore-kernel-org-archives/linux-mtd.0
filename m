Received: from lon-del-01.spheriq.net ([195.46.50.97])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEQzo-000332-Hn
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 06:59:29 -0500
Received: from lon-out-02.spheriq.net ([195.46.50.130])
	by lon-del-01.spheriq.net with ESMTP id j2OBxRNE021711
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 11:59:27 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-02.spheriq.net with ESMTP id j2OBxQ5f000643
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 11:59:27 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4242AB96.8D95936D@st.com>
Date: Thu, 24 Mar 2005 12:59:19 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <loom.20050322T224733-491@post.gmane.org>	<4241396B.D689EB32@st.com>
	<loom.20050323T212715-407@post.gmane.org>
	<4242925F.D29BC7CE@st.com> <42429C1C.8050600@yandex.ru>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

"Artem B. Bityuckiy" wrote:
> 
> Estelle HAMMACHE wrote:
> > Yes, when I write that the input buffer is split it means that
> > several data nodes are written to the flash - each data node
> > is an independent piece of data complete with header and CRC.
> > If a data node is only partly written to flash, its CRC check
> > will fail so the partial data will not be taken into account
> > when building the file at next mount. In this sense each data
> > node is an atomic write - but JFFS2 does not guarantee that
> > a write() input buffer will be written as a single data node.
> 
> But if you:
> 
> 1. write only 0-PAGE_SIZE bytes;
> 2. do not overlap n*PAGE_SIZE borders (n is 1,2, ...)
> 3. do fsync after write.
> 
> then you have the guarantee that you either have written all or
> nowthing. JFFS2 does guarantee that due to its implementation.

This is not what I understand from jffs2_write_inode_range.
When you reach the end of the block your data may be split at 
any offset because jffs2_reserve_space may return more than 
JFFS2_MIN_DATA_LEN but less than the data size (or not enough
space to compress the whole input buffer if you use compression).
Or is there some trick here that I don't understand ??

bye
Estelle
