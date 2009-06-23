Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ4Td-0005Zf-Nk
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 11:47:56 +0000
Received: by qw-out-1920.google.com with SMTP id 9so135qwj.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jun 2009 04:47:47 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 23 Jun 2009 17:17:47 +0530
Message-ID: <ce9ab5790906230447h324174a1na884a6308555914f@mail.gmail.com>
Subject: query: nand read/write method for 2048 + 64 byte page
From: vimal singh <vimal.newwork@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am implementing BCH HW ECC method (present in omap2/3), which can
provide ECC protection
for spare area bytes too, along with main area bytes.
Below are few details:
1. It is a large page NAND device
2. We are looking for upto 4-bit error correction (for each 512 + 9 bytes)

Nand has 2048 + 64 bytes page size. (main area + spare area). The
layout I am creating is:
(all other possible layouts are similar to this only for this HW ECC scheme)

|<------main area, divided into 4-sectors----->|<-----Protected spare
area------>|<----------ECC bytes-------->|
|   512      +    512    +    512    +    512      |    9    +    9
+    9    +    9    |   7   +   7   +   7   +   7    |
|<-- 1st --> <-- 2nd --> <-- 3rd --> <-- 4th -->|<-1st-> <-2nd->
<-3rd-> <-4th->|<1st> <2nd> <3rd> <4th>|

i.e. 7 ECC bytes (52 bits in actual) for each 512 + 9 bytes (main +
spare), to correct up to 4- errors.


My concern is that, none of the present ECC scheme (in nand_base.c)
seems suitable for this.
Do I need to implement new ECC scheme, and hence new read / write API's?

In that case too, main question is: how to handle oob read/write for
such layout? (where spare
area bytes are protected along with main are ECC)

Any suggestion / help is appreciated.
Thanks in advance.

---
Regards,
Vimal
