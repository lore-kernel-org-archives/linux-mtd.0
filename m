Subject: Re: NAND diskonchip driver broken with NFTL DOC 2000
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Marineau <mike@marineau.org>
In-Reply-To: <c0526ddf0701291710o65b9f786ifd1e579b75412cc2@mail.gmail.com>
References: <c0526ddf0701291710o65b9f786ifd1e579b75412cc2@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 02 Feb 2007 17:12:22 +0000
Message-Id: <1170436342.29759.555.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-01-29 at 17:10 -0800, Michael Marineau wrote:
> I have been having a bit of an adventure trying to get a DiskOnChip
> 2000 (NFTL model) working properly with nandwrite/nanddump utilities
> and jffs2.  With the current version in 2.6.20-rc6 nandwrite/nanddump
> can properly read and write the main data area but writes to the oob
> area didn't do anything and reads just got garbage.  jffs2 was
> similar, generally working but could never find clearmarkes.
> 
> If I use the generic nand_read/write_oob_std functions from
> nand_base.c instead of nand_read/write_syndrome then
> nandwrite/nanddump operates perfectly for both the data area and oob.
> Unfortunatly with those oob functions swapped jffs2 is unhappy,
> throwing ecc errors constantly.  I didn't check if jffs2 was able to
> read the clearmarkers from oob. 

Does Artem's patch to use MTD_OOB_AUTO fix this?

-- 
dwmw2
