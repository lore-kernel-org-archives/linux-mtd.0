Received: from fobos.marketsite.ru ([62.152.84.30] helo=relay1.dataart.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEPxq-0002KS-BQ
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 05:53:23 -0500
Message-ID: <42429C1C.8050600@yandex.ru>
Date: Thu, 24 Mar 2005 13:53:16 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050322T224733-491@post.gmane.org>	<4241396B.D689EB32@st.com>
	<loom.20050323T212715-407@post.gmane.org>
	<4242925F.D29BC7CE@st.com>
In-Reply-To: <4242925F.D29BC7CE@st.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Estelle HAMMACHE wrote:
> Yes, when I write that the input buffer is split it means that
> several data nodes are written to the flash - each data node
> is an independent piece of data complete with header and CRC.
> If a data node is only partly written to flash, its CRC check
> will fail so the partial data will not be taken into account
> when building the file at next mount. In this sense each data
> node is an atomic write - but JFFS2 does not guarantee that
> a write() input buffer will be written as a single data node.

But if you:

1. write only 0-PAGE_SIZE bytes;
2. do not overlap n*PAGE_SIZE borders (n is 1,2, ...)
3. do fsync after write.

then you have the guarantee that you either have written all or 
nowthing. JFFS2 does guarantee that due to its implementation.

To put it differently, write by small peaces, and do not overlap page 
boundaries, and do fsync, and be happy with an atomic writes :-)

Examples:
(assume PAGE_SIZE is 4K)

write 4K to offset 16K is OK
write 1 byte anywhere is OK
write 10 bytes at offset 4095 is not OK.

HTH.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
