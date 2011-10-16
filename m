Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFRmy-00021H-MO
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 14:34:09 +0000
Received: from [192.168.12.102] (137.sub-166-250-6.myvzw.com [166.250.6.137])
	by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id p9GEY4BO098058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 07:34:06 -0700 (PDT)
	(envelope-from mikedunn@newsguy.com)
Message-ID: <4E9AEB36.7000806@newsguy.com>
Date: Sun, 16 Oct 2011 07:33:26 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: nand_base.c:nand_get_flash_type() test results
References: <4E95B1B4.7040603@st.com>
In-Reply-To: <4E95B1B4.7040603@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/12/2011 08:26 AM, Angus CLARK wrote:
> Hi All,
>
> While attempting to add support for some of the more recent NAND devices, I
> ended up refactoring nand_get_flash_type() code.  The refactoring was primarily
> aimed at simplifying the way in which the growing number 'READID' decoding
> exceptions could be accommodated.
>

I am currently grappling with this issue with my driver for the diskonchip G4,
which is an MLC nand under the hood, but has a proprietary controller around it
which doesn't interact as a "typical" NAND device.  Specific to this topic, it
doesn't respond to NAND_READID commands.  My solution was to skip the call to
nand_scan_ident(), which calls nand_get_flash_type().  Instead, I do all the
initializations done by nand_get_flash_type() within my driver. 

Any thoughts or suggestions appreciated.

Thanks,
Mike
