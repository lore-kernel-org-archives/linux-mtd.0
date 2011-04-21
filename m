Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCxQM-0003Gh-EH
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 17:12:15 +0000
Date: Thu, 21 Apr 2011 19:10:46 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
Message-ID: <20110421171046.GA790@parrot.com>
References: <4DB052DB.7040308@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4DB052DB.7040308@parrot.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 21, 2011 at 04:52:59PM +0100, Matthieu Castet wrote:
> Hi,
> 
> I believe NAND_BBT_SCANBYTE1AND6 behavior is very dangerous.
> We have a ST flash where ecc where but on bit 5 and 6.
> With new kernel all block are bad.
> 
> Is this option is really needed ?
> ST datasheet say [1]. We already check the first Word.
> Why do we need to check the 6th Byte ?

I agree with Matthieu, NAND_BBT_SCANBYTE1AND6 code also seems wrong to me.

Old small page nand devices used to have their bad block marker in 6th byte of
the spare area of the first page.

ST datasheet says that factory bad blocks will have _both_ bytes cleared
(1st and 6th); I guess this was done to allow choosing which marker to check
(but I may be wrong). Maybe to be compatible with large page marker location
scheme (again, just guessing).

Option NAND_BBT_SCANBYTE1AND6 code was introduced in commit
58373ff0afff4cc8ac40608872995f4d87eb72ec; but the commit message does not
clearly explain why both markers should be checked.

My understanding of bad block markers is (please correct me if I am wrong):
small page => check 6th byte of spare area of first page
large page, non-ONFI => check first word of spare area of first page
ONFI => see ONFI spec

Ivan
