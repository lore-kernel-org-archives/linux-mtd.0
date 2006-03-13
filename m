Received: from gw-eur4.philips.com ([161.85.125.10])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIqu8-0007u5-8U
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2006 12:32:30 -0500
Received: from smtpscan-eur4.philips.com (smtpscan-eur4.mail.philips.com
	[130.144.57.167])
	by gw-eur4.philips.com (Postfix) with ESMTP id 965094970F
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Mar 2006 17:32:20 +0000 (UTC)
Received: from smtpscan-eur4.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 6390059
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Mar 2006 17:32:20 +0000 (GMT)
Received: from smtprelay-eur2.philips.com (smtprelay-eur2.philips.com
	[130.144.57.171])
	by smtpscan-eur4.philips.com (Postfix) with ESMTP id 3F01856
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Mar 2006 17:32:20 +0000 (GMT)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125])
	by smtprelay-eur2.philips.com (Postfix) with ESMTP id 119F136
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Mar 2006 17:32:20 +0000 (GMT)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-ID: <OF88FAEFCD.31F79312-ONC1257130.005E3D7F-C1257130.00605383@philips.com>
From: Sebastien Merceron <sebastien.merceron@philips.com>
Content-Type: multipart/alternative;
	boundary="=_alternative 0060536BC1257130_="
Subject: Mode WriteBuffer on flash Mirrorbit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 13 Mar 2006 17:32:32 -0000

This is a multipart message in MIME format.
--=_alternative 0060536BC1257130_=
Content-Type: text/plain; charset="US-ASCII"

Hi,

I'm working on ARM9 with Linux 2.4.20 and jffs2.

I try to use new flash Mirrorbit from SPANSION (S29WS256N).
This flash allows two programation mode : OneWord or WriteBuffer.

-> I already integrated and tested "OneWord" code in cfi_cmdset_0002.c.
And it works perfectly. The only issue, is that the writting is too long.
It's why, I have to use the "WriteBuffer" mode to improve that.

-> When I'm using "WriteBuffer mode", I have some errors messages : 
Data CRC 00d0ce03 != calculated CRC 73e51396 for node at 00ee8ea4

If I optimise the code in cfi_cmdset_0002.c, by reducing the buffer size 
from 32 words to 16 words, I have less errors messages.
        If I remove the code below in procedure do_write_buffer(), it 
works better, but I still have sometimes CRC error when I update some 
files in file system.:
/*cfi_spin_unlock(chip->mutex);*/
/*cfi_udelay(chip->buffer_write_time);*/
/*cfi_spin_lock(chip->mutex);*/

It look like a timing issue, as if the buffer writting was interrupted 
before the programmation was ended.

Is there any timer in Jffs2 or in linux, that could be disturb the 
programtion in WriteBuffer mode.



================================================
Sebastien Merceron Software

Philips Consumer Electronics 
BG Home Entertainment Networks 
BL Home Communication 
Route d'Angers 
72081 LE MANS CEDEX 9 - FRANCE
 
TEL : +33 2 43 41 10 80 
Email :sebastien.merceron@philips.com
================================================
--=_alternative 0060536BC1257130_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi,</font>
<br>
<br><font size=2 face="sans-serif">I'm working on ARM9 with Linux 2.4.20
and jffs2.</font>
<br>
<br><font size=2 face="sans-serif">I try to use new flash Mirrorbit from
SPANSION (S29WS256N).</font>
<br><font size=2 face="sans-serif">This flash allows two programation mode
: OneWord or WriteBuffer.</font>
<br>
<br><font size=2 face="sans-serif">-&gt; I already integrated and tested
&quot;OneWord&quot; code in cfi_cmdset_0002.c.</font>
<br><font size=2 face="sans-serif">And it works perfectly. The only issue,
is that the writting is too long.</font>
<br><font size=2 face="sans-serif">It's why, I have to use the &quot;WriteBuffer&quot;
mode to improve that.</font>
<br>
<br><font size=2 face="sans-serif">-&gt; When I'm using &quot;WriteBuffer
mode&quot;, I have some errors messages : </font>
<br><font size=2 face="Courier New">Data CRC 00d0ce03 != calculated CRC
73e51396 for node at 00ee8ea4</font>
<br>
<br><font size=2 face="sans-serif">If I optimise the code in cfi_cmdset_0002.c,
by reducing the buffer size from 32 words to 16 words, I have less errors
messages.</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; If I remove
the code below in procedure do_write_buffer(), it works better, but I still
have sometimes CRC error when I update some files in file system.:</font>
<br><font size=2 face="sans-serif">/*cfi_spin_unlock(chip-&gt;mutex);*/</font>
<br><font size=2 face="sans-serif">/*cfi_udelay(chip-&gt;buffer_write_time);*/</font>
<br><font size=2 face="sans-serif">/*cfi_spin_lock(chip-&gt;mutex);*/</font>
<br>
<br><font size=2 face="sans-serif">It look like a timing issue, as if the
buffer writting was interrupted before the programmation was ended.</font>
<br>
<br><font size=2 face="sans-serif">Is there any timer in Jffs2 or in linux,
that could be disturb the programtion in WriteBuffer mode.</font>
<br>
<br>
<br><font size=2 face="sans-serif"><br>
================================================<br>
Sebastien Merceron &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Software<br>
<br>
Philips Consumer Electronics &nbsp; &nbsp;<br>
BG Home Entertainment Networks &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;<br>
BL Home Communication &nbsp; &nbsp; &nbsp;<br>
Route d'Angers <br>
72081 LE MANS CEDEX 9 - FRANCE<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
TEL : +33 2 43 41 10 80 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<br>
Email :sebastien.merceron@philips.com<br>
================================================</font>
--=_alternative 0060536BC1257130_=--
