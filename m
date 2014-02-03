Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAFGF-0001Ms-17
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2014 08:52:11 +0000
From: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 3 Feb 2014 09:51:36 +0100
Subject: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

in July, 2013, a thread named "UBI leb_write_unlock NULL pointer Oops" was =
started, but not resolved.
We have kernel 3.6.11 running on an Freescale i.MX257 (arm926) with UBIFS o=
n a NAND Flash.
I run into the same problem. Is there a solution for this problem ?

I already added the patches:
- 605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
- 33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid b=
ug
But this doesn't resolve the problem.

If necessary, I will provide further information about our system, but perh=
aps someone can give me a hint where I can find the solution if it exists a=
lready.

Best regards,

Thorsten Wiedemer
