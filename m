Date: Mon, 14 Apr 2008 18:08:42 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
In-Reply-To: <Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<1208011719.2698.19.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

 
> > > The problem is related to introduction  of write_begin and write_end
> > > functions instead of original prepare_write & commit_write. The kernel
> > > panic has disappeared when we rolled back write_begin and write_end
> > > changes in JFFS2. We tried to fix it - but it seems problem is bit
> > > tough for us.
> > 

Seems the problem is overcome. See the patch in message "[PATCH] JFFS2
Fix of panics caused by wrong condition for hole fragcreation in
write_begin". Validation is done. The problem does not take palce if to apply the patch. 

Thanks,
Alexey
