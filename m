Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ES0K7-00023b-6a
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 18:52:51 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Wed, 19 Oct 2005 11:58:49 +1300
References: <20051018211330.GA28414@slurryseal.ddns.mvista.com>
In-Reply-To: <20051018211330.GA28414@slurryseal.ddns.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510191158.49192.manningc2@actrix.gen.nz>
Cc: 
Subject: Re: JFFS2 ignore ECC bytes in cleanmarker
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19 October 2005 10:13, Todd Poynor wrote:
> Floating for discussion a patch that avoids inspecting the ECC (and bad
> block indicator) bytes in the OOB area when checking an autoplaced
> chip's block for a valid JFFS2 cleanmarker.  It sounds like cleanmarkers
> are on their way out, so this specific code might have a pretty short
> lifespan.  But in general it may be best for the flash filesystems to
> restrict themselves to looking at the free OOB bytes and ignoring those
> that the hardware claims for its own purposes, whatever the FS-specific
> data structure.

As to scrapping clean markers: One benefit I see in clean markers is that it 
protects against power loss/reset halfway through an erase. Even though an 
erase only takes ~2ms, the chip won't complete the erase if the write protect 
kicks in. For this reason, YAFFS2 *might* start using cleanmarkers at some 
stage.

This is definitely the way to go for the oob data. This is how YAFFS2 handles 
things. [YAFFS1 is Smartmedia-format centric, so that is another matter].

As recently discussed on YAFFS list this is the fundamental reason for having 
AUTOPLACE. Basically oob bytes go in and oob bytes come out and actual 
physical positioning (and other trickery) should not need to be visible 
through the fs<-->mtd interface.

>
> In my case I'm dealing with a NAND flash hardware controller that
> automatically plunks down generated ECC bytes into the OOB (and so far I
> haven't found a good way to avoid behaviors that modify those bytes), so
> once the cleanmarker is written the ECC bytes will not be 0xFF and the
> existing check will fail.

Yes, an excellent example of why the fs does not want to know, though I have 
seen even uglier ones!

>
> This falls under the general topic of recent discussion re: JFFS2 and
> YAFFS* use of OOB bytes, and redefining what read_oob() returns based on
> the chip-specific layout may well be a better answer (I think Vitaly
> Wool's recent patches address this).  All in all, I'm not suggesting
> commit the patch below at this time, but if it's useful to somebody with
> a NAND controller that behaves similarly or it sparks any discussion
> then have at. -- Todd

The current semantics of read_oob give raw info, not AUTOPLACEd info.  Whether 
the semantics should be changed, I don't know. 

An alternative way to get at the autoplaced oob is to change nand_read_ecc to 
accept a NULL parameter for the data. ie:
 mtd->read_ecc(mtd, addr,
                         0,  /* n-data-bytes == 0 : don't read any data */
                          &dummy,
                          NULL, /* data-ptr == 0: don't read any data */
                          oob_buffer,
                          NULL); /* AUTOPLACE */

This would be more consistent since it preserved read_oob() as "read raw". 
Some people might baulk at the use of NULL to signify this meaning, but this 
function already uses oob_buffer == NULL to signify that oob should not be 
transfered and oobsel==NULL that AUTOPLACE should be used.

- Charles
