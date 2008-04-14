Subject: Re: [PATCH] JFFS2 Fix of panics caused by wrong condition for hole
	frag creation in write_begin
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804141747020.15842@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804141747020.15842@pentafluge.infradead.org>
Content-Type: text/plain
Date: Mon, 14 Apr 2008 20:40:28 +0100
Message-Id: <1208202028.3005.37.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, vailiy.leonenko@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-14 at 17:55 +0100, Alexey Korolev wrote:
> Hi,
> 
> 
> JFFS2 in Linux 2.6.24 fails to kernel panic on random read/write/truncate operatons. We investigated the issue it is caused by
> bug in conditions for hole fragment creation in write_begin function. Offset of starting offset which is used to identify should we create hole frag or not is calculated improperly.
> As result hole frags are not created when they must be - it leads to internal memory corruptions and kernel panic. 
> 
> The following patch fixes the bug in JFFS2 write_begin hole frag conditions. 
> Please include the patch. 

Well spotted, Alexey. Thanks!

I've simplified it a little and sent it to Linus.

-- 
dwmw2
