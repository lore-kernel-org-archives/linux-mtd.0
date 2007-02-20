Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJPO1-0004ah-Ii
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 02:26:16 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: Question about MTD Erase mechanism.
Date: Tue, 20 Feb 2007 20:29:33 +1300
References: <9b52d64c0702192241y2c778a54r17cea174eb8781d8@mail.gmail.com>
In-Reply-To: <9b52d64c0702192241y2c778a54r17cea174eb8781d8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702202029.33870.manningc2@actrix.gen.nz>
Cc: Vinit Agnihotri <vinit.agnihotri@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 February 2007 19:41, Vinit Agnihotri wrote:
> I have 1 question about MTD Erase mechanism.
>
> Say we have a MTD device with 'n' no. of blocks. Each block is of size
> 100Bytes. Once erased we can write 25bytes i.e. min_io_size is
> 25bytes. So once a block is erased I can perform 4 writes without
> erasing it again only if those 4 writes are not overlapping. But if
> any of those write is overlapping i.e. if re-write occurs then entire
> block have to be erased.

That's a pretty contrived example, and depends on the type of flash etc.
>
> So my question is who handles these types of conditions. I mean does
> hardware handles such conditions or software have to handle such
> situations? I mean who handles re-writing & erasures due to that???

Software of course. Hardware is pretty dumb stuff and cannot track and enforce 
algorithmic rules like that. 


>
>
> Thanks & Regards
> Vinit.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
