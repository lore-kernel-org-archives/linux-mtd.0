Received: from lon-del-01.spheriq.net ([195.46.50.97])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIMoC-0002Gi-DB
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 04:19:45 -0400
Received: from lon-out-02.spheriq.net ([195.46.50.130])
	by lon-del-01.spheriq.net with ESMTP id j348JiEn009639
	for <linux-mtd@lists.infradead.org>; Mon, 4 Apr 2005 08:19:44 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-02.spheriq.net with ESMTP id j348JhuN009652
	for <linux-mtd@lists.infradead.org>; Mon, 4 Apr 2005 08:19:43 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4250F88B.7942F7EB@st.com>
Date: Mon, 04 Apr 2005 10:19:23 +0200
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: manningc2@actrix.gen.nz
References: <20050403190352.396F21585F@desire.actrix.co.nz>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 and eCOS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> 
> Is JFFS2 kept current in eCOS or is it periodically merged?

Yes it is periodically merged - from eCos to MTD for
ecos-specific files, and from MTD to eCos for all other
files.

> If merged, when did this last happen?

This is the most recent MTD-to-eCos merge I found:
http://ecos.sourceware.org/ml/ecos-cvs/2005/msg00015.html

For more eCos information, here is the eCos mailing 
lists index:
http://ecos.sourceware.org/intouch.html

bye
Estelle
