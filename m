Received: from smtpauth02.csee.onr.siteprotect.com ([64.26.60.136])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M55dN-0004qR-CG
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 22:12:12 +0000
Message-ID: <4A0DE8A9.8020108@boundarydevices.com>
Date: Fri, 15 May 2009 15:11:53 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: repost [Fwd: [PATCH 1/5] mtd: nand: move layout structure into
	nand_ecc_ctrl]
References: <4A0DA8B1.2060109@boundarydevices.com>
	<80b317760905151303n50973aceh588cfa8b96842b7f@mail.gmail.com>
In-Reply-To: <80b317760905151303n50973aceh588cfa8b96842b7f@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard Genoud wrote:
>> +       bad_block_marker_offset = 0;
> you should use NAND_LARGE_BADBLOCK_POS defined in nand.h

Thanks, will do

>> +       bad_block_marker_length = 2;
>> +       if (mtd->oobsize == 8) {
>> +               bad_block_marker_offset = 5;
> same with NAND_SMALL_BADBLOCK_POS
> 
>> +               bad_block_marker_length = 1;
>> +       } else if (mtd->oobsize == 16) {
>> +               bad_block_marker_offset = 4;    /* length still 2 */
> 

ditto.

Troy
