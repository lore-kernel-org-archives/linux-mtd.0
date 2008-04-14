Subject: Re: [PATCH] JFFS2 Fix of panics caused by wrong condition for hole
	frag creation in write_begin
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <1208202028.3005.37.camel@pmac.infradead.org>
References: <Pine.LNX.4.64.0804141747020.15842@pentafluge.infradead.org>
	<1208202028.3005.37.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Mon, 14 Apr 2008 20:50:58 +0100
Message-Id: <1208202658.3005.47.camel@pmac.infradead.org>
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

On Mon, 2008-04-14 at 20:40 +0100, David Woodhouse wrote:
> 
> Well spotted, Alexey. Thanks!
> 
> I've simplified it a little and sent it to Linus.

And now I've resent it with a _correct_ address for Linus...

-- 
dwmw2
