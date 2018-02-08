Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eju1C-0001pU-SA
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 21:46:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 08 Feb 2018 22:45:55 +0100
From: Stefan Agner <stefan@agner.ch>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: boris.brezillon@bootlin.com, marcel.ziswiler@toradex.com,
 richard@nod.at, bpringle@sympatico.ca, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [RFC PATCH v2] mtd: nand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180208192347.692a2d93@xps13>
References: <20180114220012.30039-1-stefan@agner.ch>
 <20180208190744.615a25ef@xps13> <20180208192347.692a2d93@xps13>
Message-ID: <afe80e5ddc694cd88a29d1128618589e@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08.02.2018 19:23, Miquel Raynal wrote:
>> > +}
>> >
>> > -	switch (command) {
>> > -	case NAND_CMD_SEQIN:
>> > -		/* Use valid column/page from preread... */
>> > -		vf610_nfc_addr_cycle(nfc, column, page);
>> > -		nfc->buf_offset = 0;
>> > +static int vf610_nfc_exec_op(struct nand_chip *chip,
>> > +			     const struct nand_operation *op,
>> > +			     bool check_only)
>>
>> The soul of ->exec_op() is here :) However this implementation looks
>> very specific to the kind of tasks you are used to do with one specific
>> chip. What if someone wants to support a new command that implies
>> several command/address/data cycles interleaved? Maybe one solution
>> would be to rework a bit by using a case statement in a for loop. If
>> the indentation level is too high, you may use helpers to do small
>> tasks like sending a command or addresse cycle. What do you think?

The controller mandates the sequence. If another sequence is required,
then multiple controller level command executions need to be issues.

> 
> Actually, instead of writing your own implementation, maybe you should
> just write the helpers I mentioned above and fill a parser patterns
> array to give to the NAND core's parser, simplifying again the
> implementation.

I actually worked on a v3 just yesterday which implements Boris
suggetion. It also should be easier to review due two independent
patches for adding exec_op and removing the old callbacks. I hope we can
carry on the discussion there.

--
Stefan
