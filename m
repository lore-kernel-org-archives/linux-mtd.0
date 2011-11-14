Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPjxy-0004JH-FR
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2011 00:00:03 +0000
Message-ID: <4EC067CE.4050805@newsguy.com>
Date: Sun, 13 Nov 2011 16:58:54 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>	<1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>	<4EBECB89.2020102@newsguy.com>
 <87vcqoiavr.fsf@free.fr>
In-Reply-To: <87vcqoiavr.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/13/2011 02:18 AM, Robert Jarzmik wrote:
> I took a different approach.  I check an internal docg3 register to see if the
> page was written. Or I could had have checked the Hamming code, as I don't think
> it can be 0xff whatever the pagesize 7 bytes values.
>
> The reason behind is that the Hamming code is Ham(64, 57), ie. Ham(2^6,
> 2^6-6-1). The means the 6 bits are enough to cover all codewords possibilities,
> and 0xff is not one of them.
>
> So unless a bitflip in Hamming code, 0xff in it means blank page.


Clever!


>  And I think
> the ECC engine is even smarter, with the ECCCONF1_PAGE_IS_WRITTEN.


I forgot about this.  If the hardware can indeed tell you, I guess this is the
best way.  Sounds like I'll be updating my blank page detection.

Mike
