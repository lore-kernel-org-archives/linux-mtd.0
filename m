Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VGUQ-0000jc-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 18:26:46 +0000
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: <manningc2@actrix.gen.nz>
Cc: "MTD for Linux" <linux-mtd@lists.infradead.org>
Subject: FW: [OT] Cf Card vs DiskOnChip
Date: Mon, 28 Jan 2002 18:36:08 -0000
Message-ID: <GEEAIDAKDGCGOMMOLAHMKEONCGAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Charles,

>>move stuff around and level out the wearing.  Some devices do not apply
wear
>>levelling (eg. Compact Flash and SmartMedia). Some do (eg. full-size
PCMCIA
>>cards, DOC, JFFS).

The lack of wear-levelling on CF comes as a surprise - could you comment on
whether the various manufacturers, such as Sandisk are making this
assertion?

The closest we have seen is in the CF Sandisk spec. where they state they
support wear levelling - but that this '.. is an intrinsic part of the Erase
Pooling functionality of NAND memory...', '...if necessary, CF cards will
rewrite data from a defective sector to a good sector...'.

With this type of statement it certainly doesn't appear that our flash
lifetime calculations for a 'true' wear-levelling implementation would
hold for CF.

Best,

-Alex


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre. 

Company registered in England No. 1608562.
Registered Office: Unit 8, Clifton Road, Cambridge, CB1 7EA, United Kingdom, Tel: 01223 411200.
