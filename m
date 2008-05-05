Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jt06K-0000YN-Jg
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 12:47:29 +0000
Message-ID: <481F01DB.60603@users.sourceforge.net>
Date: Mon, 05 May 2008 14:47:23 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Alexander Belyakov <abelyako@mail.ru>
Subject: Re: [RFC/PATCH][NOR] Fix cfi_cmdset_0001.c FL_SYNCING race
References: <E1Jsaol-0007Gx-00.abelyako-mail-ru@f188.mail.ru>
In-Reply-To: <E1Jsaol-0007Gx-00.abelyako-mail-ru@f188.mail.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Nicolas Pitre <nico@cam.org>, David Woodhouse <dwmw2@infradead.org>,
	Alexander Belyakov <abelyako@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Belyakov wrote:
> +	/* Prevent setting state FL_SYNCING for chip in suspended state. */
> +	if (FL_SYNCING == mode && FL_READY != chip->oldstate)

The operand order differs from the rest of the code.
Apart from that I think it looks ok.

Anders
