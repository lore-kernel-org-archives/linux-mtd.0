Received: from [139.138.16.117] (helo=email2.dataio.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M10Gk-0006i4-TG
	for linux-mtd@lists.infradead.org; Mon, 04 May 2009 15:39:57 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: UBI - NAND Flash Programming
Date: Mon, 4 May 2009 08:39:49 -0700
Message-ID: <B538B21A486F9E4CBBE577217764F37701662A53@email2.dataio.internal>
From: "Musch, Edwin" <musche@dataio.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hello

I am from Data I/O. We produce mass production Flash programming =
equipment.
We received a request from Keymile/Germany to support the UBI.

As you will know we need to program the raw NAND Flash the same way than =
the application is handling the NAND Flash ( bad blocks )

Could you please give me further information regarding the Bad Block =
Handling? Since we are programming the NAND Flash only once we are not =
worried about wear levelling.

1) If we detect a bad block where should we move the Data
   a. SKIP: go on with the next good block - or
   b. Put the Data into a reserved area
      c. Please let me know where this area is defined
2) Do I need to update the Main area if I move a block? - Is there a =
header?
3) Could you explain the info within the spare area?=20
   a. Do I need to update anything if I move a block to different =
location?
   b. ECC - In case I need to update the main area - How is it done?
4) Are there any dynamic table somewhere that needs to be updated - Bad =
block table?

Thank you for your help - Let me know if you need further information to =
answer any of my questions.

Mit freundlichen Gr=FC=DFen / Best Regards
Edwin Musch
