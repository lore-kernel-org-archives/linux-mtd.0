Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RENaw-000663-28
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 15:53:18 +0000
Message-ID: <4E970942.60608@newsguy.com>
Date: Thu, 13 Oct 2011 08:52:34 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<201110101751.19010.marek.vasut@gmail.com>
	<20111010181210.GA23655@parrot.com> <4E935D5D.4050504@newsguy.com>
	<20111011115034.GA28920@parrot.com> <4E949642.9020209@newsguy.com>
	<20111012184903.GA9535@parrot.com> <871uuhl6mq.fsf@free.fr>
	<20111013083704.GA12110@parrot.com>
In-Reply-To: <20111013083704.GA12110@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/13/2011 01:37 AM, Ivan Djelic wrote:
>
> I'm still a little puzzled as to how this Hamming code works.
> If it was meant to correct 1 bitflip in 7 bytes + 1 parity byte, then it
> should be at least 12 bits long.
> If the idea is to simply detect a single bitflip, then 6 bits are enough.
> Maybe the probability of having 2 bitflips in 7 oob bytes is low enough to
> allow reading oob using this simple check ?

Hmm.  They claim 1 bit correction, 2 detection.
