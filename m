Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VeIW-0002o6-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 19:52:04 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: "Alex Lennon" <ajlennon@arcom.co.uk>
Subject: Re: FW: [OT] Cf Card vs DiskOnChip -->CF wear levelling
Date: Wed, 30 Jan 2002 08:57:58 +1300
Cc: "MTD for Linux" <linux-mtd@lists.infradead.org>
References: <GEEAIDAKDGCGOMMOLAHMKEONCGAA.ajlennon@arcom.co.uk>
In-Reply-To: <GEEAIDAKDGCGOMMOLAHMKEONCGAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020129200142.4CAF11061@creative.actrix.co.nz>
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

I did read this some time back, I believe on the Sandisk www before it got 
restructured (Hey, that happy looking face on their home page sure looks like 
she's getting wear levelling).

I can no longer find the Sandisk reference, so I can't really support the 
assertion any more. If I recall correctly, they did wear levelling on the 
full-size cards but not on CF. They use (or did use) different controllers in 
these cards. Here is something I found on google 
http://www.technoir.nu/hplx/hplx-l/0006/msg00714.html

I guess it also comes down to your interpretation of wear levelling.  
SmartMedia, for instance, does not store a count of the number of times a 
block was programmed and does not do explicite wear levelling. However the 
block allocation strategy will tend to provide some sort of wear levelling 
(consistent with the intrinsic pool management blaah you mention below). I 
hunch therefore that CF uses the same strategy. 

OK so how does this translate into system reliability? Well my take on this 
is as follows:
* So what? NAND is expected to fail and NAND block drivers/file systems 
handle block failure. So if you wear out a block, it just gets mapped out. 
THis, combined with the intrinsic blaah, is probably good enough.
* CF is far more likely to be corrupted by removing half-way through a write 
or being de-powered while a write is active. 

I must also apologize for saying that a FlashDrive is a wrapped up CF card. I 
actually believe it is architectually similar to a full-size PCMCIA ATA card. 
They look the same to the PCMCIA/IDE bus, but the full-size card provides 
more space to use a better controller. This makes them more reliable.



-- CHarles



On Tue, 29 Jan 2002 07:36, Alex Lennon wrote:
> Hi Charles,
>
> >>move stuff around and level out the wearing.  Some devices do not apply
>
> wear
>
> >>levelling (eg. Compact Flash and SmartMedia). Some do (eg. full-size
>
> PCMCIA
>
> >>cards, DOC, JFFS).
>
> The lack of wear-levelling on CF comes as a surprise - could you comment on
> whether the various manufacturers, such as Sandisk are making this
> assertion?
>
> The closest we have seen is in the CF Sandisk spec. where they state they
> support wear levelling - but that this '.. is an intrinsic part of the
> Erase Pooling functionality of NAND memory...', '...if necessary, CF cards
> will rewrite data from a defective sector to a good sector...'.
>
> With this type of statement it certainly doesn't appear that our flash
> lifetime calculations for a 'true' wear-levelling implementation would
> hold for CF.
>
> Best,
>
> -Alex
