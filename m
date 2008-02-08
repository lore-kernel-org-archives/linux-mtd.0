Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JNQfc-0004ai-Sl
	for linux-mtd@lists.infradead.org; Fri, 08 Feb 2008 10:41:32 +0000
Received: by wa-out-1112.google.com with SMTP id v33so326218wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Feb 2008 02:41:22 -0800 (PST)
Message-ID: <47AC318F.2040909@gmail.com>
Date: Fri, 08 Feb 2008 16:10:15 +0530
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Is mtdblock_ro to be used only with 512byte page size flash only?
Content-Type: multipart/mixed; boundary="------------010205060608040102070401"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010205060608040102070401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In mtdblock_ro code, mtdblock_readsect function calls mtd->read passing 
a hard coded parameter of 512 (the third parameter).

Is this refering to 512 bytes data which is like one page in case of the 
flash I am using? If that is the case then can this block RO code be 
used only with flash which has a 512 data size?

M.S

--------------010205060608040102070401
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:M S
n:S;M
version:2.1
end:vcard


--------------010205060608040102070401--
