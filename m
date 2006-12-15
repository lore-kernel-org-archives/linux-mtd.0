Received: from rubidium.solidboot.com ([81.22.244.175] helo=mail.solidboot.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvB6X-0000pB-DX
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 06:19:55 -0500
Date: Fri, 15 Dec 2006 13:19:00 +0200
From: Timo Teras <timo.teras@solidboot.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: OneNAND: Update OOB free table
Message-ID: <20061215111900.GB5793@mail.solidboot.com>
References: <3761211.13011166150326518.JavaMail.weblogic@ep_ml08>
	<1166179313.18628.52.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1166179313.18628.52.camel@sauron>
Sender: timo.teras@solidboot.com
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Timo Teras <timo.teras@solidboot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 15, 2006 at 12:41:53PM +0200, Artem Bityutskiy wrote:
> On Fri, 2006-12-15 at 02:38 +0000, Kyungmin Park wrote:
> > How about the the change the JFFS2 logic to skip the eccpos in cleanmark check.
> > In onenand_oob_64, it describes the eccpos. So the JFFS2 skip the eccpos
> 
> May you refine what is the problem please?

jffs2_check_oob_empty() check that the whole OOB area contains only 0xff
bytes except for the clean marker area. This is broken on OneNAND as writing
clean marker to OOB area will change ECC bytes.

Also the clean marker is not written properly as only the first oobfree
table element is used. But this is a different issue.

- Timo
