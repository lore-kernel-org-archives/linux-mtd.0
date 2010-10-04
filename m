Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P2m8a-0004mf-Uh
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 14:35:33 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>, <dedekind1@gmail.com>
References: <201010012116.o91LGRGn021118@imap1.linux-foundation.org>	
	<1286028592.32172.14.camel@brekeke>
	<1286030672.26080.2.camel@macbook.infradead.org>
In-Reply-To: <1286030672.26080.2.camel@macbook.infradead.org>
Subject: RE: [patch 1/2] mtdpart: memory accessor interface for MTD layer
Date: Mon, 4 Oct 2010 19:58:37 +0530
Message-ID: <004b01cb63d0$6ee7e630$4cb7b290$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: khilman@deeprootsystems.com, david-b@pacbell.net, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

On Sat, Oct 02, 2010 at 20:14:32, David Woodhouse wrote:
> On Sat, 2010-10-02 at 17:09 +0300, Artem Bityutskiy wrote:
> > 
> > > Implement a memory accessor interface in the MTD layer which enables
> > the
> > > kernel to access flash data.
> > > 
> > > This patch adds two new members to the mtd_partition structure, a
> > function
> > > handler which will be called during setup of the partition and an
> > argument
> > > to be passed to this setup function.
> > 
> > This patch does not apply to my l2-mtd-2.6.git tree
> 
> Wasn't there going to be a much nicer version of this patch coming
> anyway?
> 

This patch can be dropped. Please see the discussion at [1] regarding this.

[1] http://lists.infradead.org/pipermail/linux-mtd/2010-August/031483.html

Thanks,
Sudhakar
