From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <416A7A0A.591B4A03@st.com>
References: <019301c4ad6e$33e3c730$0400a8c0@mark> <416A4930.6AF5C472@st.com>
	<416A7A0A.591B4A03@st.com>
Content-Type: text/plain
Message-Id: <1100172461.8191.1369.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Nov 2004 11:27:42 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Mark Hamilton <mhamilton@alliantnetworks.com>
Subject: Re: [JFFS2] GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-11 at 14:18 +0200, Estelle HAMMACHE wrote:
> was discussed in the eCos mailing list, but I meant that
> jffs2_gc_fetch_page should call jffs2_read_inode with the reading
> offset set to the page boundary: (offset & ~(PAGE_CACHE_SIZE-1)).
> I believe this is the expected behavior for jffs2_gc_fetch_page.

Yes, that is the expected behaviour and looks like the correct fix. I've
just committed the corresponding change to the eCos version of
jffs2_gc_fetch_page(). 

Sorry for the delay in responding.

The eCos port could definitely do with some love -- I did a lot of work
to remove all the Linuxisms from it, and provide abstractions like
jffs2_gc_fetch_page(), and it would be nice if someone could make the
eCos bits no longer look like it's trying to emulate the Linux VFS, but
actually behave as a proper eCos file system.

-- 
dwmw2
