Received: from web51010.mail.yahoo.com ([206.190.39.129])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZJPf-0003KC-0m
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 21:40:47 -0500
Message-ID: <20051108023355.71752.qmail@web51010.mail.yahoo.com>
Date: Mon, 7 Nov 2005 18:33:54 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: "zhao, forrest" <forrest.zhao@intel.com>
In-Reply-To: <1131416403.3417.3.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Two Issues with JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using the TIPs of the JFFS2 and the MTD from
couple of months ago. We dot not see this problem that
often. For exmaple in one case we rewrite the
pages(each 4K) P1, P2, P3, and P4 with the new
versions of them: P1', P2', P3', and P4'. After 5
times resetting the board we notices that the JFFS2 is
reporting the following: P1, P2, P3, and P4'.

Regards,
--vahid

--- "zhao, forrest" <forrest.zhao@intel.com> wrote:

> 
> > 
> >   2) In rare cases the JFFS2 uses the obsolete
> version
> > of the pages stored on the flash.
> 
> Which MTD snapshot are you using?
> Could you provide the real evidence that "In rare
> cases
> the JFFS2 uses the obsolete version of the pages"?
> 
> Forrest
> 
> 



		
__________________________________ 
Yahoo! FareChase: Search multiple travel sites in one click.
http://farechase.yahoo.com
