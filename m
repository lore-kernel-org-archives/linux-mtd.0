Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDCiJ-000875-UJ
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 09:31:48 +0000
Received: by eyh6 with SMTP id 6so156528eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Apr 2011 02:31:45 -0700 (PDT)
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4DB14218.8050708@parrot.com>
References: <4DB052DB.7040308@parrot.com>  <20110421171046.GA790@parrot.com>
	<1303460616.2757.52.camel@localhost>  <4DB14218.8050708@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Apr 2011 12:28:49 +0300
Message-ID: <1303464529.2757.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-22 at 10:53 +0200, Matthieu CASTET wrote:
> Artem Bityutskiy a écrit :
> > On Thu, 2011-04-21 at 19:10 +0200, Ivan Djelic wrote:
> >> On Thu, Apr 21, 2011 at 04:52:59PM +0100, Matthieu Castet wrote:
> >>> Hi,
> >>>
> >>> I believe NAND_BBT_SCANBYTE1AND6 behavior is very dangerous.
> >>> We have a ST flash where ecc where but on bit 5 and 6.
> >>> With new kernel all block are bad.
> >>>
> >>> Is this option is really needed ?
> >>> ST datasheet say [1]. We already check the first Word.
> >>> Why do we need to check the 6th Byte ?
> >> I agree with Matthieu, NAND_BBT_SCANBYTE1AND6 code also seems wrong to me.
> > 
> > This just means that we need a better way for drivers to inform the
> > generic code about how exactly blocks are marked as bad. Probably
> > drivers could describe this with a data structure, and sometimes even
> > provide a "is_block_bad()" function.
> > 
> > The options seem to be not enough.
> > 
> I think we should also unify bad block scanning.

Sure, just do this in small incremental steps, send small incremental
patches with nice description (and tested). The point is - you should
not wait when someone else fixes this for you - i do not think this
happens. Additional thing - if you are using MTD and interested in its
stability - review others patches which touch the area of your
interests :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
