Received: from lon-del-02.spheriq.net ([195.46.50.98])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIjfT-0007fr-QJ
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2005 04:44:16 -0400
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-02.spheriq.net with ESMTP id j358iA4N006116
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2005 08:44:10 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id j358i7Vl013122
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2005 08:44:09 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <42524FBD.C418A0E6@st.com>
Date: Tue, 05 Apr 2005 10:43:41 +0200
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <20050404135849.4689.qmail@web52705.mail.yahoo.com>
	<loom.20050404T173154-376@post.gmane.org>
	<1112640934.24487.375.camel@hades.cambridge.redhat.com>
	<loom.20050404T224215-1@post.gmane.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 and frequent/small write operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

Sergei Sharonov wrote:
> 
> Hi,
> > On Mon, 2005-04-04 at 17:15 +0000, Sergei Sharonov wrote:
> > > I was told that O_SYNC flag for open does not work with JFFS2 (!?).
> >
> > You misunderstood. On NOR flash, O_SYNC does nothing because JFFS2 is
> > entirely synchronous anyway. On NAND flash, I believe that O_SYNC does
> > what it is supposed to -- any write will have reached the medium before
> > the write() system call returns.
> 
> Thanks, that is good to know. It was suggested by others
> http://article.gmane.org/gmane.linux.drivers.mtd/12175/match=+sync
> that it may not work on JFFS2. Estelle?

In the quoted message it was pretty clear that I don't know 
one way or another (don't use linux VFS).
I was referring to previous discussions such as
"jffs2_get_inode_nodes(): Data CRC failed on NAND device" in the
February archive, where O_SYNC is _not_ proposed as a solution
to force fsync.
Sorry for the confusion... I'm glad this erroneous notion
is corrected.

bye
Estelle
