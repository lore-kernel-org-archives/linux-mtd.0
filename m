Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDBhB-0007qM-J6
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 08:26:34 +0000
Received: by ewy3 with SMTP id 3so144570ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Apr 2011 01:26:31 -0700 (PDT)
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110421171046.GA790@parrot.com>
References: <4DB052DB.7040308@parrot.com>  <20110421171046.GA790@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Apr 2011 11:23:36 +0300
Message-ID: <1303460616.2757.52.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-21 at 19:10 +0200, Ivan Djelic wrote:
> On Thu, Apr 21, 2011 at 04:52:59PM +0100, Matthieu Castet wrote:
> > Hi,
> > 
> > I believe NAND_BBT_SCANBYTE1AND6 behavior is very dangerous.
> > We have a ST flash where ecc where but on bit 5 and 6.
> > With new kernel all block are bad.
> > 
> > Is this option is really needed ?
> > ST datasheet say [1]. We already check the first Word.
> > Why do we need to check the 6th Byte ?
> 
> I agree with Matthieu, NAND_BBT_SCANBYTE1AND6 code also seems wrong to me.

This just means that we need a better way for drivers to inform the
generic code about how exactly blocks are marked as bad. Probably
drivers could describe this with a data structure, and sometimes even
provide a "is_block_bad()" function.

The options seem to be not enough.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
