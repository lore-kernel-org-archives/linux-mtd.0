Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D28mQ-000778-Cr
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 09:06:51 -0500
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-03.spheriq.net with ESMTP id j1IE6hmh026840
	for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2005 14:06:43 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id j1IE6gJG024457
	for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2005 14:06:43 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4215F668.F570E28B@st.com>
Date: Fri, 18 Feb 2005 15:06:32 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Joe Barnett <joseph.barnett@gmail.com>
References: <52249cdc0502171225706e3cf8@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: symlink corruption in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Notice how even-length names are ok and odd-length names are KO.
There was a thread about a similar problem, with a suggested
approach for finding the bug.
http://lists.infradead.org/pipermail/linux-mtd/2004-May/009735.html

> lrwxrwxrwx  1 root root      11 Feb 17  2005 ld.so.1 -> ld-2.3.2.so?10
> lrwxrwxrwx  1 root root      24 Feb 17  2005 libBrokenLocale.so.1 ->
> libBrokenLocale-2.3.2.so
> lrwxrwxrwx  1 root root      15 Feb 17  2005 libacl.so.1 -> libacl.so.1.1.0?.3
> lrwxrwxrwx  1 root root      15 Feb 17  2005 libanl.so.1 ->
> libanl-2.3.2.so?.so?so
> lrwxrwxrwx  1 root root      16 Feb 17  2005 libattr.so.1 -> libattr.so.1.1.0
> lrwxrwxrwx  1 root root      15 Feb 17  2005 libblkid.so.1 -> libblkid.so.1.0?3?

bye
Estelle
