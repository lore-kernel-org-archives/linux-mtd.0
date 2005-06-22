Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dl4H7-0007TD-6W
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 08:24:14 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j5MCOBin012127
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 08:24:11 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j5MCOBjx191148
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 08:24:11 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j5MCOBlw005142
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 08:24:11 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1119432945.7618.3.camel@sauron.oktetlabs.ru>
References: <E1Dkz3Q-0008Px-00.tkutergin-mail-ru@f24.mail.ru>
	<1119432945.7618.3.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 22 Jun 2005 07:24:10 -0500
Message-Id: <1119443050.16063.16.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Timofey Kutergin <tkutergin@mail.ru>
Subject: Re: clean marker size for NOR w/ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-06-22 at 13:35 +0400, Artem B. Bityuckiy wrote:
> 
> 2 questions:
> 
> 1. Where did you find NOR-ECC? An URL to the data-sheet, or that's your
> private stuff?

http://www.st.com/stonline/books/pdf/docs/9229.pdf

I had to use google for that.  You can't find it via the ST webpages
anymore.  I'm fairly sure that the part has been discontinued.

> 2. For what clean marker should be larger then 16 bytes? Surely 16 bytes
> is enough to do the job the clean marker needs to do ?

Yes, 16 bytes is plenty.  See my other note on why it has to be 16 bytes
in the first place :).

josh
