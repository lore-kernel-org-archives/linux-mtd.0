Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WRXP-0001ai-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 00:54:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5.1.0.14.0.20010813172206.00b02a38@mail.spewey.com> 
References: <5.1.0.14.0.20010813172206.00b02a38@mail.spewey.com> 
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
    "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 is broken 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 01:00:17 +0100
Message-ID: <17795.997747217@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

vipin@embeddedlinuxworks.com said:
> David once mentioned that there are some obvious optimizations that
> can be carried out in the JFFS2 code. Maybe he could list out his
> favorite ones  and maybe someone could volunteer to tackle them one by
> one. 

I committed the cleanup to jffs2_remove_node_refs_from_ino_list() (Christ, 
did I name that function?), which showed up near the top of the profiles 
you did. What's next? ISTR we got strange data from the profiling. 

--
dwmw2
