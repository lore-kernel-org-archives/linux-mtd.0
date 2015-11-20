Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzvaq-0001mL-9i
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 23:59:53 +0000
Received: by pabfh17 with SMTP id fh17so134580947pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 15:59:30 -0800 (PST)
Date: Fri, 20 Nov 2015 15:59:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: enhance ONFI table reliability/stable
Message-ID: <20151120235927.GD64635@google.com>
References: <A765B125120D1346A63912DDE6D8B6310BF37D1C@NTXXIAMBX02.xacn.micron.com>
 <20151118025010.GB140057@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF51459@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF51459@NTXXIAMBX02.xacn.micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 04:21:01AM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> > On Tue, Jul 21, 2015 at 02:42:34PM +0000, Bean Huo 霍斌斌 (beanhuo)
> > wrote:
> > > Hi,
> > >
> > > Recently, I faced some case about ONFI table reliability, now it used CRC.
> > > If there is bit flips in ONFI parameter pages, parameter backup page will be
> > taken.
> > > For latest linux,default read three copys.
> > >
> > > 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> > > 	for (i = 0; i < 3; i++) {
> > > 		for (j = 0; j < sizeof(*p); j++)
> > > 			((uint8_t *)p)[j] = chip->read_byte(mtd);
> > > 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> > > 				le16_to_cpu(p->crc)) {
> > > 			break;
> > > 		}
> > > 	}
> > >
> > > However ,with technoogy improvement,for TLC and new generatin MLC,I
> > > think, three copys of
> > 
> > Ha, "improvement" :)
> > 
> > > Parameter tables is not powerful enough.my question is that if there
> > > is a good method to protect and corrent parameter page. For example,we
> > > can use linux software BCH ecc. Any suggections and input be
> > > welcomed,if you having any concerns about this,don't free tell me.
> > 
> > I recall this being brought up at my old job, and I all I can say is...
> > (please pardon my censored language)
> 
> 
> Yes , you ever told about this. I just follow.
> Sorry for my rude following.
> I only want to share my one suggestion about using software ECC to protect 
> ONFI table that read from NAND. I want to hear every MTD expert 's valuable 
> Feedback on this. if OK, I can do it. 

Perhaps I'm misunderstanding you, I don't understand how you could
possibly "do it" if it is a circular dependency. You have nowhere to
store ECC/parity data for a parameter page, because you can't actually
read/write the NAND flash until after you know its geometry.

> > ...that is complete and utter bulls***. An ONFI standard that can't guarantee
> > "reliable enough" parameter pages is no standard at all.
> > 
> > To step back a bit: How would one expect to store and retrieve ECC parity
> > data? ...on the NAND flash? But to do that, we have to know the geometry
> > parameters of said NAND flash. How do we figure out the geometry? From the
> > ONFI parameter pages! Nice Catch 22 you have there.

I realize a non-native English speaker might not understand the "Catch
22" reference. Wikipedia has a nice summary:

  https://en.wikipedia.org/wiki/Catch-22_(logic)

Essentially, it's a circular argument, or a contradiction. An
impossibility.

> > Please encourage your employer never to produce "ONFI-compliant" flash that
> > are this bad.

I still stand by the above statement.

But now that I'm in a slightly more charitable mood, there are ways to
improve our ability to recover from slightly corrupted parameter pages
(ECC is not one of them).

For one, you could do some kind of bit majority. e.g.:

 (1) try pages 1-3
 (2) if none pass the CRC check, then compute bit majority of all 3; if
     the CRC of this combined page passes, then use it
 (3) ???

Brian
