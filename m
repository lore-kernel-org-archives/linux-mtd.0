Received: from rv-out-0708.google.com ([209.85.198.241])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJwEA-0004K2-C4
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 20:39:10 +0000
Received: by rv-out-0708.google.com with SMTP id b17so7496049rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 12:39:09 -0800 (PST)
Message-ID: <782515bb0901051239w2c750f6am8d5914504a1df14d@mail.gmail.com>
Date: Mon, 5 Jan 2009 14:39:09 -0600
From: "Nishanth Menon" <menon.nishanth@gmail.com>
To: "Scott Wood" <scottwood@freescale.com>
Subject: Re: nand_default_bbt and x8 large page nand devices
In-Reply-To: <49626E1E.1040408@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <782515bb0901051227k7c8b8a13o13016f0178058bf@mail.gmail.com>
	<49626E1E.1040408@freescale.com>
Cc: linux-mtd@lists.infradead.org, maragani2000@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 5, 2009 at 2:31 PM, Scott Wood <scottwood@freescale.com> wrote:
> Nishanth Menon wrote:
>>
>> I guess the real question could be: is this a bug in reality? Do all x8
>> large
>> page devices expect 1 byte bb marker or is it just micron?
>
> It's not so much a bug as just a wasted byte -- any good block should
> contain all FFs from the factory, so unless software chooses to use it for
> something else (or the controller insists on putting ECC there) it should be
> harmless to treat the bad block marker as if it were two bytes.
:( unfortunately we have a ROM code which insists on using the
offset[1] on x8 largepage nand for ecc data.
yes, as far as a wasted byte goes, it is fine, but functionality gets
hit on my SOC, hence the question.
Regards,
Nishanth Menon
