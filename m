Received: from rv-out-0708.google.com ([209.85.198.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kv9cg-0000lL-Jj
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 11:54:03 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5314106rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Oct 2008 04:54:00 -0700 (PDT)
Message-ID: <f96d234e0810290454p7c50e9d5t6bd0ecd65444e883@mail.gmail.com>
Date: Wed, 29 Oct 2008 07:54:00 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: bus access for NAND parts
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been looking at interfacing a raw NAND device to a PXA270 and
have the following questions.  It seems that most devices simply use a
chip select for CE.  What is the mechanism that prevents the NAND
driver from getting pre-empted and another device access toggling the
read/write stobes and messing up the NAND cycle while the NAND chip
select is still low?  I see memory barriers that should prevent out of
order issues, but I've not located any mechanism yet for preventing a
separate device access from interfering with the NAND access.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com
