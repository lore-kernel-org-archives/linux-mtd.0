Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdFM2-0000xs-DW
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 04:31:55 +0000
Subject: Re: [PATCH] mtd/nand: Update nand_default_block_markbad()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1279756427-9143-1-git-send-email-norris@broadcom.com>
References: <1279756427-9143-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 07:30:58 +0300
Message-ID: <1280118658.14917.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-21 at 16:53 -0700, Brian Norris wrote:
> This is an update that depends on the previous patches I sent.
> 
> We can now write to all the appropriate BB marker locations (i.e.
> pages 1 AND 2, bytes 1 AND 6) with nand_default_block_markbad() if
> necessary, according to the flags marked in chip->options.
> 
> Note that I removed the line:
> 	ofs += mtd->oobsize;
> Unless I am wrong, this line was completely unnecessary in the
> first place.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Pushed to mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
