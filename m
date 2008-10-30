Received: from rv-out-0708.google.com ([209.85.198.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvfhN-0004dQ-2H
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 22:09:01 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1765531rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Oct 2008 15:08:59 -0700 (PDT)
Message-ID: <f96d234e0810301508n773734efp7a72f3da4ee50841@mail.gmail.com>
Date: Thu, 30 Oct 2008 18:08:59 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: bus access for NAND parts
In-Reply-To: <f96d234e0810290454p7c50e9d5t6bd0ecd65444e883@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <f96d234e0810290454p7c50e9d5t6bd0ecd65444e883@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2008 at 7:54 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> I've been looking at interfacing a raw NAND device to a PXA270 and
> have the following questions.  It seems that most devices simply use a
> chip select for CE.  What is the mechanism that prevents the NAND
> driver from getting pre-empted and another device access toggling the
> read/write stobes and messing up the NAND cycle while the NAND chip
> select is still low?  I see memory barriers that should prevent out of
> order issues, but I've not located any mechanism yet for preventing a
> separate device access from interfering with the NAND access.

Correction -- above should say:  "It seems that most devices simply use a
_GPIO_ for CE".  The chip select is set low in software, and then
multiple bus cycles are run to execute the address and data phases of
the NAND operation.  So what keeps another process from interrupting
this and running a bus cycle while the GPIO for NAND CE is still low
-- which would toggle the strobes to the NAND cs.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com
