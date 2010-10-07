Subject: Re: [PATCH] JFFS2: Dynamically choose inocache hash size
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind1@gmail.com
In-Reply-To: <1286479935.1797.14.camel@brekeke>
References: <20101007181402.982199D401B@zog.reactivated.net>
	<1286479935.1797.14.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Oct 2010 20:35:23 +0100
Message-ID: <1286480123.3757.2.camel@i7.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Daniel Drake <dsd@laptop.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-07 at 22:32 +0300, Artem Bityutskiy wrote:
> Why is this complication needed? Unless there is a very good reason, I'd
> just stick with older patch you sent, which I BTW also have in my
> l2-mtd-2.6.git tree: 

I asked for it. With smaller file systems, a huge increase buys nothing
and is just bloat.

-- 
dwmw2
