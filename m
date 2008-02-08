Received: from rv-out-0910.google.com ([209.85.198.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JNRKn-0004Se-7i
	for linux-mtd@lists.infradead.org; Fri, 08 Feb 2008 11:24:04 +0000
Received: by rv-out-0910.google.com with SMTP id c24so4364127rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Feb 2008 03:23:52 -0800 (PST)
Message-ID: <47AC3B84.30501@gmail.com>
Date: Fri, 08 Feb 2008 16:52:44 +0530
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Is mtdblock_ro to be used only with 512byte page size flash only?
References: <47AC318F.2040909@gmail.com>
In-Reply-To: <47AC318F.2040909@gmail.com>
Content-Type: multipart/mixed; boundary="------------020600030209050700010705"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020600030209050700010705
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Max Stirling wrote:
> In mtdblock_ro code, mtdblock_readsect function calls mtd->read 
> passing a hard coded parameter of 512 (the third parameter).
>
> Is this refering to 512 bytes data which is like one page in case of 
> the flash I am using? If that is the case then can this block RO code 
> be used only with flash which has a 512 data size?
>
> M.S
Ok this is the sector size.

--------------020600030209050700010705
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


--------------020600030209050700010705--
