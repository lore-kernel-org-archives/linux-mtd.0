Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8HFc-0003Sp-6z
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 16:40:28 +0000
Date: Thu, 4 Dec 2008 11:40:26 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Hinko Kocevar" <hinko.kocevar@cetrtapot.si>
Subject: Re: Partition badness
Message-ID: <20081204114026.06e6552b@lappy.seanm.ca>
In-Reply-To: <493793E6.4040309@cetrtapot.si>
References: <20081203235925.3c2442e2@lappy.seanm.ca>
	<493793E6.4040309@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 04 Dec 2008 09:25:10 +0100
"Hinko Kocevar" <hinko.kocevar@cetrtapot.si> wrote:

> I had similar problems when inserting the mtd driver for the second
> time. This helped me:
> http://forum.soft32.com/linux/bdi-register-sysfs-bdi-device-queue-ftopict469102.html.

That patch was added, and they made it a WARN_ON()!!!!! Which means I
get 8 WARN_ON messages on every boot :(

Thanks! I'll just remove the WARN_ON.

Cheers,
   Sean
