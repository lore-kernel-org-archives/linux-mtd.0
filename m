Received: from fra-del-02.spheriq.net ([195.46.51.98])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9Nci-0001ax-OO
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 08:22:45 -0500
Received: from fra-out-03.spheriq.net (fra-out-03.spheriq.net [195.46.51.131])
	by fra-del-02.spheriq.net with ESMTP id j2ADMOXr011745
	for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2005 13:22:24 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-03.spheriq.net with ESMTP id j2ADMOTF006699
	for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2005 13:22:24 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <42304A0B.434C1858@st.com>
Date: Thu, 10 Mar 2005 14:22:19 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Joe Barnett <joseph.barnett@gmail.com>, linux-mtd@lists.infradead.org
References: <52249cdc0502171225706e3cf8@mail.gmail.com>
	<4215F668.F570E28B@st.com> <52249cdc05021807135f0ff90f@mail.gmail.com>
	<52249cdc0503091355364639dc@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: symlink corruption in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forwarded to the list.
Congratulations !

Joe Barnett wrote:
> 
> Found it, map driver was broken in the copy_to/copy_from routines.
> Seems that the odd reads where broken
> 
> On Fri, 18 Feb 2005 10:13:06 -0500, Joe Barnett
> <joseph.barnett@gmail.com> wrote:
> > Thank you all for your input, I will try your suggestions and post any
> > results I find back to the list.
> >
> > Kind regards,
> > Joseph
> >
> >
> > On Fri, 18 Feb 2005 15:06:32 +0100, Estelle wrote :
> > > Notice how even-length names are ok and odd-length names are KO.
> > > There was a thread about a similar problem, with a suggested
> > > approach for finding the bug.
> > > http://lists.infradead.org/pipermail/linux-mtd/2004-May/009735.html
> > >
> > > > lrwxrwxrwx  1 root root      11 Feb 17  2005 ld.so.1 -> ld-2.3.2.so?10
> > > > lrwxrwxrwx  1 root root      24 Feb 17  2005 libBrokenLocale.so.1 ->
> > > > libBrokenLocale-2.3.2.so
> > > > lrwxrwxrwx  1 root root      15 Feb 17  2005 libacl.so.1 -> libacl.so.1.1.0?.3
> > > > lrwxrwxrwx  1 root root      15 Feb 17  2005 libanl.so.1 ->
> > > > libanl-2.3.2.so?.so?so
> > > > lrwxrwxrwx  1 root root      16 Feb 17  2005 libattr.so.1 -> libattr.so.1.1.0
> > > > lrwxrwxrwx  1 root root      15 Feb 17  2005 libblkid.so.1 -> libblkid.so.1.0?3?
> > >
> > > bye
> > > Estelle
> > >
> >
