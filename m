Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UNC5-00046S-00
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2002 07:24:09 +0000
Received: from there (203-96-30-9-adsl.actrix.co.nz [203.96.30.9])
	by creative.actrix.co.nz (Postfix) with SMTP id 7936116EA
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2002 20:35:06 +1300 (NZDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip
Date: Sat, 26 Jan 2002 20:31:20 +1300
References: <20020126062925.22509.qmail@web8101.in.yahoo.com>
In-Reply-To: <20020126062925.22509.qmail@web8101.in.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020126073506.7936116EA@creative.actrix.co.nz>
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

On Sat, 26 Jan 2002 19:29, Ramya Ravichandran wrote:
> > > Doesn't the ROM needed  depend on the application
> >
> > than
> >
> > > runs on Linux?
> >
> > you said "serial application". Doesn't seem like
> > much to me
>
> Right now I am trying to find out the price of DOC. I
> tried the serach words "DiskOnChip" and "DiskOnChip
> Price" . The search results explain DOC but don't give
> the price.
>    If the price of DOC  is less than the CF+IDE
> adapter or CF + PCMCIA-CF adapter then I guess we will
> settle for DOC.
>    Also I dont know which adapter to go for PCMCIA or
> IDE for CF as I am not a h/w person.
>

If the CF is "embedded" and you are not going to remove it while it is 
powered up (ie. use it like you would a DOC) then you quite likely do not 
need any PCMCIA adapter chips  I've seen a few designs using CF this way.

If you have an IDE bus/port on your board, then the following link also has 
an appnote on interfacing to that too.

See http://www.sandisk.com/tech/oem_design/cf_dc.asp for some app notes on 
doing this kinda thing.

NB Though... CF has no wear levelling and might give some product lifetime 
issues (it's really a consumer technology designed with a Kleenex mentality).

-- Charles
