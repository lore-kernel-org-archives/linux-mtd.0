Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dl1eb-0006hm-KR
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 05:36:18 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Timofey Kutergin <tkutergin@mail.ru>
In-Reply-To: <E1Dkz3Q-0008Px-00.tkutergin-mail-ru@f24.mail.ru>
References: <E1Dkz3Q-0008Px-00.tkutergin-mail-ru@f24.mail.ru>
Content-Type: text/plain
Date: Wed, 22 Jun 2005 13:35:44 +0400
Message-Id: <1119432945.7618.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: clean marker size for NOR w/ECC
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-06-22 at 10:49 +0400, Timofey Kutergin wrote:
> Hi all !
> Currently, JFFS2 WBUF implicitly assumes that cleanmarker size is multiple number of eccsize and sets it to 16 in jffs2_nor_ecc_flash_setup(). Which in fact mean 1,2,4,8 and 16 valid values for eccsize. Newer flashes may have ECC window more than that, 1024 bytes, for example. So at least it is suggested to change
Hello,

2 questions:

1. Where did you find NOR-ECC? An URL to the data-sheet, or that's your
private stuff?
2. For what clean marker should be larger then 16 bytes? Surely 16 bytes
is enough to do the job the clean marker needs to do ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
