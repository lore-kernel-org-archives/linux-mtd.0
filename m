Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XcIq-0000lf-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 07:40:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020724200415.98373.qmail@mail.com> 
References: <20020724200415.98373.qmail@mail.com> 
To: "Mike Schumi" <schumi@techie.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_do_reserve_space 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 07:40:39 +0100
Message-ID: <29483.1027579239@redhat.com>
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

schumi@techie.com said:
>   I've looked for a solution to this problem, but haven't seen it
> posted anywhere, although some ppl have had it before.  

Please could you provide a complete debug log, from mount onwards. I need to 
see how the data structure got into that state. It'll be large -- maybe 
bzip2 it and tick it up for FTP somewhere?

Also do 'df' as soon as it's happened.


--
dwmw2
