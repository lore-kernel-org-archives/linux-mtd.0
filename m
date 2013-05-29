Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhbAx-00076J-84
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 07:52:05 +0000
Message-ID: <1369814085.5446.235.camel@sauron.fi.intel.com>
Subject: Re: UBI: optimize erase-header read checks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Wed, 29 May 2013 10:54:45 +0300
In-Reply-To: <1367092363-5249-1-git-send-email-pekon@ti.com>
References: <1367092363-5249-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

thanks for the patch. Generally, I am fine to change the
reading/scanning path, but carefully.

On Sun, 2013-04-28 at 01:22 +0530, Gupta, Pekon wrote:
> From: "Gupta, Pekon" <pekon@ti.com>
> 
> During mounting of UBI volume, all PEB headers are scanned and checked.
> This scanning of PEB header is done
> - To re-creating PEB to LEB map table.
> - To filter out bad PEB or alien (non-UBI) PEB.
> - recover corrupt PEB effected by sudden power-failure.
> During this scanning both erase_header and volume_id_header are scanned.
> This volume recovery time is critical for some safety use-cases where system
> should recover as soon as possible after the fault.
> 
> This patch tries to optimize erase-header checks done during scan by:
> - re-ordering data checks based on below analysis.
> - removing ubi_check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)
> 	(checking of 0xFF in page-data)
> 	- REASON1: even if first few bytes 'sizeof(ec_hdr)' of page-data are
> 		0xFF, still it does not guarantee that page is erased | blank.
> 	- REASON2: As per analysis below, pages with invalid magic-number need
> 		 to be erased in most of the conditions. Thus explicit checking
> 		 of 0xFF in page-data can be avoided.
> 
> MTD device driver can return following return-code for read access (mtd_read)
> --------------------------------------------------------------------------
> RETURN_VALUE	REASON					NEXT STEP
> --------------------------------------------------------------------------
> 0		no errors or bit-flips detected		parse data
> 
> EUCLEAN		correctable bit-flips detected		parse data & scrub PEB
> 
> EBADMSG		uncorrectable bit-flip detected		parse data & scrub PEB
> 
> <others>	device error or incomplete data		reject data
> --------------------------------------------------------------------------
> 
> Parsing the read_data can result in following combinations:
> --------------------------------------------------------------------------
>                 MAGIC
> ECC	HDR_CRC	NUMBER	CONCLUSION			NEXT STEP
> --------------------------------------------------------------------------
> OK	valid	valid*	valid UBI erase_header		parse header
> EUCLEAN	valid	valid*	valid UBI erase_header		parse header
> EBADMSG	valid	valid*	valid UBI erase_header		parse header
> 
> OK	invalid	valid	corrupted UBI erase_header	depends on vid_hdr
> EUCLEAN	invalid	valid	corrupted UBI erase_header	depends on vid_hdr
> EBADMSG invalid	--	undeterministic_data**		schedule for erase
> 
> OK	invalid	invalid	undeterministic_data**		schedule for erase
> EUCLEAN	invalid	invalid	undeterministic_data**		schedule for erase
> EBADMSG invalid	invalid	undeterministic_data**		schedule for erase
> --------------------------------------------------------------------------
> 
> where
> 'valid*': As hdr_crc covers magic-number field so matching of hdr_crc
> 	implicitely indicates matching of magic=number.
> 
> underministic_data**: page-data can be any of the following
> 	(a) programmed page (non-UBI)
> 	(b) programmed page (all 0xFF
> 	(c) erased page	without bit-flips
> 	(d) erased page	with bit-flips
> 	(d) valid UBI erase_header with un-recoverable bit-flips corrupting
> 		erase-header content.
> 
> Signed-off-by: Gupta, Pekon <pekon@ti.com>

So the subject says this is an optimization, but I do not really see
what did you optimize? Speed? If yes, some numbers?

Or this is about improving robustness? May be some clear explanations
about that?

Or this is just simplifying the code and making it more clear?

I am fine with all of that, just want to clearly see this explained in
the commit message.

Also, the patch is a bit too big. Can you try to figure out smaller
steps and split it on smaller pieces?

There are also minor cosmetic things, but I do not want to touch them
now.

Note: I am processing the mtd mailing list from oldest e-mails to
newest, with few exceptions. But when I answer an e-mail, and the person
re-sends patches, I usually jump to the new version right away. So if
you resend, I should look at them with a lot smaller delay :-)

-- 
Best Regards,
Artem Bityutskiy
