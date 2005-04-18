From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <20050418085121.GA19091@infradead.org>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
Content-Type: text/plain
Date: Mon, 18 Apr 2005 12:58:50 +0400
Message-Id: <1113814730.31595.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATC] small VFS change for JFFS2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-18 at 09:51 +0100, Christoph Hellwig wrote:
> No, exporting locks is a really bad idea.  Please try to find a better
> method to fix your problem that doesn't export random kernel symbols.
> 
In general it must be true. But this specific case I believe is
reasonable enough to export the mutext (as an exception).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
