From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Vitaly Wool'" <vwool@ru.mvista.com>
References: <000001c76c77$80f44a70$06100a3b@user001b2c71e3>
	<46028A4F.9010907@ru.mvista.com>
Subject: RE: Onenand and yaffs [was: Re: bug in
	drivers/mtd/onenand/onenand_base.c?]
Date: Fri, 23 Mar 2007 11:11:45 +0900
Message-ID: <00fa01c76cf0$9ddfa8e0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <46028A4F.9010907@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> Kyungmin Park wrote:
> 
> >I saw your mtd git tree related with yaffs. I tested the 
> yaffs on onenand
> >before. But as you know it failed.
> >Now with your patch how many bytes are needed in yaffs if 
> ecc provided?
> >  
> >
> Not sure if I understood you right here. YAFFS2 generally needs 28 OOB
> bytes, and 16 without ECCOther.

Oh, Good!
16 bytes enough for 2KB page OneNAND. and Maybe we can run 1KB page OneNAND
with minor patch.

Note: It's out of Spec. So it's used for development only.

/**
 * onenand_oob_32 - oob info for middle (1KB) page
 */
static struct nand_ecclayout onenand_oob_32 = {
        .eccbytes       = 10,
        .eccpos         = {
                8, 9, 10, 11, 12,
                24, 25, 26, 27, 28,
                },
#ifdef ONENAND_FOR_YAFFS
        .oobfree        = { {2, 6}, {14, 2}, {18, 6}, {30, 2} }	
#else
        .oobfree        = { {2, 3}, {14, 2}, {18, 3}, {30, 2} }
#endif
};

Thank you,
Kyungmin Park
