Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DERHl-0003GU-9Y
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 07:18:01 -0500
Date: Thu, 24 Mar 2005 12:17:41 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <4242AB96.8D95936D@st.com>
Message-ID: <Pine.LNX.4.58.0503241217310.15561@phoenix.infradead.org>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com>
	<loom.20050323T212715-407@post.gmane.org> <4242925F.D29BC7CE@st.com>
	<42429C1C.8050600@yandex.ru> <4242AB96.8D95936D@st.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi Artem,
Hi Estelle,

> This is not what I understand from jffs2_write_inode_range.
> When you reach the end of the block your data may be split at 
> any offset because jffs2_reserve_space may return more than 
> JFFS2_MIN_DATA_LEN but less than the data size (or not enough
> space to compress the whole input buffer if you use compression).
> Or is there some trick here that I don't understand ??

Hmm, yes, you're right. jffs2_write_inode_range may do further splits. I 
haven't mentioned this. I thought on the higher level - commit_write is 
called only once for the transactions I mentioned. But even in these cases 
jffs2_write_inode_range spoils the atomicity.

Then I must add one more requirement:
4. Transactions must be <= 128 bytes.

Or JFFS2_MIN_DATA_LEN should be re-defined.

Thus, some atomic writes are still possible :-)

Better now? :-)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
