Subject: Re: [patch 1/2] mtdpart: memory accessor interface for MTD layer
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind1@gmail.com
In-Reply-To: <1286028592.32172.14.camel@brekeke>
References: <201010012116.o91LGRGn021118@imap1.linux-foundation.org>
	<1286028592.32172.14.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Oct 2010 23:44:32 +0900
Message-ID: <1286030672.26080.2.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: sudhakar.raj@ti.com, khilman@deeprootsystems.com, david-b@pacbell.net,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-02 at 17:09 +0300, Artem Bityutskiy wrote:
> 
> > Implement a memory accessor interface in the MTD layer which enables
> the
> > kernel to access flash data.
> > 
> > This patch adds two new members to the mtd_partition structure, a
> function
> > handler which will be called during setup of the partition and an
> argument
> > to be passed to this setup function.
> 
> This patch does not apply to my l2-mtd-2.6.git tree

Wasn't there going to be a much nicer version of this patch coming
anyway?

-- 
dwmw2
