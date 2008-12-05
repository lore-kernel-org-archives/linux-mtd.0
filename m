Received: from 81-7-68-229.static.zebra.lt ([81.7.68.229] helo=teltonika.lt)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8WBd-0001QV-IE
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 08:37:22 +0000
Message-ID: <4938E839.2010604@teltonika.lt>
Date: Fri, 05 Dec 2008 10:37:13 +0200
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
MIME-Version: 1.0
To: Sean MacLennan <smaclennan@pikatech.com>
Subject: Re: Partition badness
References: <20081203235925.3c2442e2@lappy.seanm.ca>	<493793E6.4040309@cetrtapot.si>
	<20081204114026.06e6552b@lappy.seanm.ca>
In-Reply-To: <20081204114026.06e6552b@lappy.seanm.ca>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Hinko Kocevar <hinko.kocevar@cetrtapot.si>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sean MacLennan wrote:
> On Thu, 04 Dec 2008 09:25:10 +0100
> "Hinko Kocevar" <hinko.kocevar@cetrtapot.si> wrote:
> 
>> I had similar problems when inserting the mtd driver for the second
>> time. This helped me:
>> http://forum.soft32.com/linux/bdi-register-sysfs-bdi-device-queue-ftopict469102.html.
> 
> That patch was added, and they made it a WARN_ON()!!!!! Which means I
> get 8 WARN_ON messages on every boot :(
> 
> Thanks! I'll just remove the WARN_ON.

This WARN_ON is to detect bugs in driver... Actually MTD has to be fixed,
but not this WARN_ON...

> Cheers,
>    Sean
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
