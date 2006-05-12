Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeTQB-0004QG-Lg
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 04:55:14 -0400
Message-ID: <44644D79.7000903@ru.mvista.com>
Date: Fri, 12 May 2006 12:55:21 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Russ Dill <russ.dill@gmail.com>
References: <4461B7CD.9010100@ru.mvista.com>	
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>	
	<4461CC8C.6010105@ru.mvista.com>	
	<f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>	
	<1147386362.12030.9.camel@shinybook.infradead.org>
	<f9d2a5e10605111626u743b101dgfc7e90422dec9a80@mail.gmail.com>
In-Reply-To: <f9d2a5e10605111626u743b101dgfc7e90422dec9a80@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	Josh Boyer <jwboyer@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russ Dill wrote:
> True, I also realized another possible shortcut. If a blocks gets an
> ECC correction on a read, rewrite it to a free block, erase the block,
> rewrite it from the data written to the free block, and then erase the
> free block. You'd need to put some info in the OOB so you could know
> what the state is on power recovery.
>
Oh thanks, that's the idea I'm going to use. It's a pretty reasonable 
assumption that 1 byte out of OOB is available as there's not going to 
be anything in OOB but ECC code in case of RO filesystem.

Vitaly
