Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SI6y-0000Zr-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 12:57:28 +0100
Received: from mb04.swip.net ([193.12.122.208])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13SI6n-0000ZX-00
	for mtd@infradead.org; Fri, 25 Aug 2000 12:57:17 +0100
Reply-To: <mdeans@algonet.se>
From: "=?iso-8859-1?Q?Bj=F6rn_Eriksson?=" <bjorn@brannstrom.se>
To: <mtd@infradead.org>
Cc: <mark.langsdorf@amd.com>
Subject: Anyone using mtd on NAND flash? (Was: The archives [looking for info on AM29LV640 flash])
Date: Fri, 25 Aug 2000 13:57:11 +0200
Message-ID: <000801c00e8b$9a649560$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F079@txexmta8.amd.com>
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> >  I've been browsing the archive to see if anyone's used MTD on
> > AM29LV640 (64Mb, NAND I believe) parts.
>
> 	The spec sheet for the Am29LV640 indicates they are CFI
> parts.  You should be able to use the cfi_cmdset_0002 module
> with them, though admittedly I haven't tested this myself.

 I've just been across the hall to strangle our hardware engineer (who
happens to also be my boss). He /intended/ to use the AM29LV640 part but =
had
problems finding a reliable source for them so we're using Samsungs KM29U=
128
part instead.

 There's no mention of CFI in the .pdf file I've got but I've detected th=
e
KM29U128 chip using:

read_ID() /*pseudo_code*/ {
	const ReadID_cmd =3D 0x90;

	ready_chip();
	chip_enable();
	cmd_latch_enable();
	outportb(DATA, ReadID_cmd);	/*Read ID command */
	cmd_latch_disable();
	addr_latch_enable();
	outportb(DATA, 0x00);		/*1st address cycle */
	addr_latch_disable();

	m_code =3D inportb(DATA);		/* Reading 2 byte data */
	d_code =3D inportb(DATA);

	return (m_code << 8) | d_code;
}

 Which doesn't have much similarity to the cfi_probe.c:cfi_probe_new_chip=
()
function so I guess they're not CFI compliant chips; Why is that?


//Bj=F6rnen.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
