Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13PUnK-0001sQ-00
	for mtd-list@infradead.org; Thu, 17 Aug 2000 19:53:38 +0100
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13PUnC-0001sI-00
	for mtd@infradead.org; Thu, 17 Aug 2000 19:53:36 +0100
Received: from mamao.cetuc.puc-rio.br (mamao.cetuc.puc-rio.br [139.82.73.37])
	by caja.ldhs.cetuc.puc-rio.br (8.9.3/8.9.3) with ESMTP id QAA03055
	for <mtd@infradead.org>; Thu, 17 Aug 2000 16:53:19 -0300
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: mtd@infradead.org
Date: Thu, 17 Aug 2000 15:53:05 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: Quoted-printable
Subject: New DiskOnChip driver
Reply-to: miguel@cetuc.puc-rio.br
Message-ID: <1E34686FAD@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


   Hi,

   I've just uploaded the new DiskOnChip driver to CVS repository. The 
bad news is that this driver _may_ break all I/O to the DoC, so please 
send me any e-mails with reports of success and failures.

   The changes from previous driver are:

   - Millennium driver merged (UNTESTED!!)
   - Support to 2Mb and 64Mb (and more) nand chip addressing modes.
   - 4Kb and 16Kb erase blocks devices (we have to check if nftl is aware 
of this).
   - Subsector writing.
  
   There is also a new utility called nandtest.c. This is provided for tes=
ting 
the DiskOnChip driver without nftl. Please report any problems together 
with nandtest output.

   The only know bug seems to have something to do with my testing 
hardward, I hope that it's not a bug in software at all: sometimes I get 
corrupted data if an interrupt from network card happens inside 
DoC_ReadBuf. Let me know if you have similar problems, and 
preferably, give me a solution! :) Try it doing the following: 1) erase th=
e 
/dev/mtd0; 2) dd if=3Dsometextfile of=3D/dev/mtd0; 3) less -f /dev/mtd0 ->=
 
checking for strange charaters on the text. Running less from the console 
do not generate errors, while running it from a telnet session causes the 
appearance of "=FF=FF=FF=FF" (0xff) in the middle of the text.


Regards,

Miguel Freitas
Center for Telecommunications Studies
CATHOLIC UNIVERSITY - BRASIL
e-mail: miguel@cetuc.puc-rio.br
phone/fax#:+55-21-540-8854


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
