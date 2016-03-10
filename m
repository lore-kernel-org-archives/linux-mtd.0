Received: from smtprelay0021.hostedemail.com ([216.40.44.21]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae5ww-0007ZJ-DM
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 19:08:43 +0000
Message-ID: <1457636880.3433.12.camel@perches.com>
Subject: Re: checkpatch.pl false positive: FSF mailing address
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Mar 2016 11:08:00 -0800
In-Reply-To: <20160310190023.GB2545@google.com>
References: <20160310190023.GB2545@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-03-10 at 11:00 -0800, Brian Norris wrote:
> Hi Joe,

Hi Brian.

> I found this false positive amusing:
> 
> $ curl http://patchwork.ozlabs.org/patch/577786/mbox/ | scripts/checkpatch.pl -
> [...]
> ERROR: Do not include the paragraph about writing to the Free Software
> Foundation's mailing address from the sample GPL notice. The FSF has
> changed addresses in the past, and may do so again. Linux already
> includes a copy of the GPL.
> #1489: FILE: drivers/mtd/nand/qcom_nandc.c:1335:
> +^I^I * write to the free oob area.$
> [...]
> 
> The patch is:
>   http://patchwork.ozlabs.org/patch/577786/
>   [PATCH v8,2/3] mtd: nand: Qualcomm NAND controller driver
> 
> and the comment text is:
> 
>   "For the last codeword, we skip the bbm positions and write to the
>   free oob area."
> 
> which matches on this:
> 
> # Check for FSF mailing addresses.
>                 if ($rawline =~ /\bwrite to the Free/i ||
> 
> I'm just writing as recommended by the closing text of your tool.

Thanks.

Yeah, it's amusing.  It's also likely not something worth
bothering with though as the likelihood of fixing it is low
and eventually the FSF warning will be minimized or removed
as no longer necessary.

checkpatch is stupid, false positives will always exist.

cheers, Joe
