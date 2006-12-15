Received: from rubidium.solidboot.com ([81.22.244.175] helo=mail.solidboot.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gv8W5-0008H8-77
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 03:34:07 -0500
Date: Fri, 15 Dec 2006 10:33:11 +0200
From: Timo Teras <timo.teras@solidboot.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: OneNAND: Update OOB free table
Message-ID: <20061215083311.GA5793@mail.solidboot.com>
References: <3761211.13011166150326518.JavaMail.weblogic@ep_ml08>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3761211.13011166150326518.JavaMail.weblogic@ep_ml08>
Sender: timo.teras@solidboot.com
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Timo Teras <timo.teras@solidboot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 15, 2006 at 02:38:17AM +0000, Kyungmin Park wrote:
> > Tested. This breaks reading OOB area and the clean marker from there. After
> > OOB has been written without ECC it must be read without ECC too or
> >we start to get ECC errors.
> 
> Yes, you're right. and the current code don't check the read error.
> It's similay problem in onenand_wait which can't report the read/write/erase error.
> 
> I think I need to change the logic.
> 
> First, fix the onenand_wait error report
> Second, check the read error.
> 
> Anyway come back to main topic
> 
> How about the the change the JFFS2 logic to skip the eccpos in cleanmark check.
> In onenand_oob_64, it describes the eccpos. So the JFFS2 skip the eccpos
> 
> Is it possible?

I suppose it's worth asking from JFFS2 people. The free OOB usage seems to be
a bit broken in JFFS2 (it only uses the first pos/len pair of the OOB free
table. 

Cheers,
  Timo
