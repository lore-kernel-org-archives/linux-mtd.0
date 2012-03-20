Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9nrj-0007V3-TA
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 01:28:00 +0000
Message-ID: <4F67DD13.6020501@newsguy.com>
Date: Mon, 19 Mar 2012 18:27:47 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
 <20120318100000.336c347d@pixies.home.jungo.com> <4F66F36E.9010102@parrot.com>
 <4F67844E.5020404@newsguy.com> <20120319211835.1073a491@halley>
In-Reply-To: <20120319211835.1073a491@halley>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: robert.jarzmik@free.fr, ivan.djelic@parrot.com, ricard.wanderlof@axis.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/19/2012 12:18 PM, Shmulik Ladkani wrote:
> On Mon, 19 Mar 2012 12:09:02 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
>>
>> I didn't get Shmulik's original email for some reason, only what was quoted in
>> Matthieu's. 
> 
> http://lists.infradead.org/pipermail/linux-mtd/2012-March/040343.html


Many thanks Shmulik.  I'm glad I didn't miss this.  Don't know why some emails
are getting dropped.  What you describe is exactly what I had in mind, and is
just an extension of the previous patches to the finer granularity of ecc steps.
 Yes it's not too hard, but touching drivers that I don't have the means to test
has to be done very carefully.

Quoting from your post off the list archive...


  [ BTW, at a side note, I failed to understand why you prefer the
  threshold comparison at the generic 'mtd_read' wrapper, and not within
  nand_base.c.
  I guess you didn't want to duplicate the condition into onenand_base.c
  and alauda.c?
  Thing is, I feel mtd->bitflip_threshold is a NAND property, so it
  makes more sense if it is tested within the NAND infrastricture (and
  clones).
  Changing the 'mtd->_read' interface was less elegant IMO. ]

I agree, it is a NAND property and would have preferred to keep it in the nand
interface,  But in addition to alauda, devices/docg3.c also is a nand device
that does not use the nand interface,  After being bandied about, it was decided
to make it part of the mtd driver interface.

Thanks,
Mike
