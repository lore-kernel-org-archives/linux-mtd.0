Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CGz8I-0002cj-QY
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 08:18:32 -0400
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <416A7A0A.591B4A03@st.com>
Date: Mon, 11 Oct 2004 14:18:18 +0200
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Mark Hamilton <mhamilton@alliantnetworks.com>,
	linux-mtd@lists.infradead.org
References: <019301c4ad6e$33e3c730$0400a8c0@mark> <416A4930.6AF5C472@st.com>
Content-Type: text/plain; charset=us-ascii
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

Estelle Hammache wrote:
> 
> Hi Mark,
> 
> isn't it cleaner (for compatibility with Linux) to modify
> jffs2_gc_fetch_page so that it reads a
> PAGE_CACHE_SIZE-aligned buffer ?

Ok so this was discussed in the eCos mailing list, but I meant that
jffs2_gc_fetch_page should call jffs2_read_inode with the reading
offset set to the page boundary: (offset & ~(PAGE_CACHE_SIZE-1)).
I believe this is the expected behavior for jffs2_gc_fetch_page.

Estelle
