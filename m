Received: from smtp813.mail.sc5.yahoo.com ([66.163.170.83])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRdeM-0000iI-Ho
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 16:35:40 -0500
Message-ID: <020101c4c6a2$c9ae6e30$0101000a@mark>
From: "Mark Hamilton" <mark_lee_hamilton@sbcglobal.net>
To: "Estelle HAMMACHE" <estelle.hammache@st.com>,
	<linux-mtd@lists.infradead.org>
References: <019301c4ad6e$33e3c730$0400a8c0@mark> <416A4930.6AF5C472@st.com>
	<416A7A0A.591B4A03@st.com>
Date: Tue, 9 Nov 2004 13:26:09 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [JFFS2] GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle,
  Sorry for not getting back to you sooner on this. I agree that ideally I
would prefer to see a fix done in the eCos port of JFFS2. I'll try your
suggestion and rerun my tests to make sure that something isn't overlooked.
Hopefully, I can resubmit a patch to the eCos group.
-Mark
----- Original Message ----- 
From: "Estelle HAMMACHE" <estelle.hammache@st.com>
To: "Mark Hamilton" <mhamilton@alliantnetworks.com>;
<linux-mtd@lists.infradead.org>
Sent: Monday, October 11, 2004 4:18 AM
Subject: Re: [JFFS2] GC patch for eCos port


> Estelle Hammache wrote:
> >
> > Hi Mark,
> >
> > isn't it cleaner (for compatibility with Linux) to modify
> > jffs2_gc_fetch_page so that it reads a
> > PAGE_CACHE_SIZE-aligned buffer ?
>
> Ok so this was discussed in the eCos mailing list, but I meant that
> jffs2_gc_fetch_page should call jffs2_read_inode with the reading
> offset set to the page boundary: (offset & ~(PAGE_CACHE_SIZE-1)).
> I believe this is the expected behavior for jffs2_gc_fetch_page.
>
> Estelle
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
