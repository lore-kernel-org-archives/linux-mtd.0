Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KsB4f-0003aT-KU
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 06:50:39 +0000
Date: Tue, 21 Oct 2008 08:50:34 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Du Zhongdong <axdududu@gmail.com>
Subject: Re: [NAND flash driver] What would mtd do if read returns -EBADMSG
	(ecc	failed)
In-Reply-To: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0810210848000.6120@lnxricardw.se.axis.com>
References: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 21 Oct 2008, Du Zhongdong wrote:

> Hi,
>
> I'm doing a NAND flash driver, and I suppose if ecc cannot be
> corrected while read something from NAND flash, that block should be
> marked bad, is that right?

No, not necessarily. A block should be marked bad if it cannot reliably=20
hold data, i.e. if the block refuses to write or erase properly.

Normally, uncorrectable errors occur after there have been correctable=20
errors for a while. When correctable errors start occurring, this is a=20
sign that the block should be erased and rewritten. As someone pointed=20
out, UBI does this, plain JFFS2 does not.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
  --- PLEASE NOTE - I have moved - from F407 to F117 - PLEASE NOTE ---
