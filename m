Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfpg2-00079G-Fh
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 10:24:34 +0000
Date: Tue, 4 Dec 2012 11:24:28 +0100
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] ubi: Remove PEB from free tree in get_peb_for_wl()
Message-ID: <20121204112428.6cbcf330@spider.haslach.nod.at>
In-Reply-To: <1354610079.11583.58.camel@sauron.fi.intel.com>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <1354564667-9549-2-git-send-email-richard@nod.at>
 <1354610079.11583.58.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, zsadecki@itwatchdogs.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tue, 04 Dec 2012 10:34:39 +0200
schrieb Artem Bityutskiy <dedekind1@gmail.com>:
 > Looking at all for these 'self_check_in_wl_tree()', I think can kill
> most of them and just make 'find_wl_entry()' complain if it did not
> find anything. But this is a subject of a separate patch.
>

Yeah. I've also thought about that.
This is material for 3.8-rc0.

Thanks,
//richard 
