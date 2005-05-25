Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaxDN-0000h2-D6
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 10:50:39 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 8B01BBA6A
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 16:50:06 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40418-01 for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 16:50:02 +0200 (CEST)
Received: from [192.1.1.61] (unknown [192.1.1.61])
	by n1.cetrtapot.si (Postfix) with ESMTP id 181EDB9A6
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 16:50:02 +0200 (CEST)
Message-ID: <4294909C.8070307@cetrtapot.si>
Date: Wed, 25 May 2005 16:50:04 +0200
From: Simon Posnjak <simon.posnjak@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: IO_ADDR_R and IO_ADDR_W
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am writing a board specific driver. We have Toshiba TC58DVM 32 MB chip 
connected over gpio (g) port.

Pins are:

_Data:
_
 
g8  <-> I/O1
g9  <-> I/O2
g10 <-> I/O3
g11 <-> I/O4
g12 <-> I/O5
g13 <-> I/O6
g14 <-> I/O7
g15 <-> I/O8
 
_Control:
_
 
g16 <-- RY/BY
g17 --> /RE
g18 --> /CE
g19 --> CLE
g20 --> ALE
g21 --> /WE
g22 --> /WP

The g port address is 0xB0000028  (32-bit).

My questions are:

1. What address do I have to supply to IO_ADDR_R and IO_ADDR_W fields? 
The address of the g port? The g port + 1 (0xB0000029) [so that we start 
reading at g8]? Or should I provide a function that reads and writes the 
I/O pins?

2. We are using the rest of the pins for some other devices. Will my 
driver interfere with there drivers?

Thank you.

          Regards Simon
