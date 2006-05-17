From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0605170811i2229c718mbe6a69155f82c0ae@mail.gmail.com>
References: <fe810cf0605170811i2229c718mbe6a69155f82c0ae@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 17 May 2006 16:57:11 +0100
Message-Id: <1147881431.3875.22.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (rev.2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-17 at 19:11 +0400, Alexander Belyakov wrote:
> There is a second revision of "mtdconcat NAND/Sibley" patch. I hope
> the patch will not get damaged as I'm posting it from gmail account,
> thanks to Jorn.
> 
> The patch adds previously missing concat_writev(),
> concat_writev_ecc(), concat_block_isbad(), concat_block_markbad()
> functions to make concatenation layer compatible with Sibley and NAND
> chips.
> 
> Patch has been cleared from whitespaces, fixed some lines of code as
> requested. Also I have added code for alignment check that should
> support Jorn's "writesize" patch.
> 
> 
> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com> 

Applied; thanks.

-- 
dwmw2
