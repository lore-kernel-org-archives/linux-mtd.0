Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Wehs-0002Y5-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 14:58:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D9955F8@webmail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D9955F8@webmail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: Vipin Malik <vipin@embeddedlinuxworks.com>,
    "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Erase.c in CVS tree, 08-13-2001 version does not compile 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 15:03:54 +0100
Message-ID: <14557.997797834@redhat.com>
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

fgiasson@mediatrix.com said:
> Erase.c in CVS tree does not compile.  This line have to be put this
> line at the beggining of the D2 block:
>         struct jffs2_raw_node_ref *this;

Sorry about that. Please commit it.

--
dwmw2
