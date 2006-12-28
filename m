Received: from wx-out-0506.google.com ([66.249.82.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GzrY1-0007BP-WE
	for linux-mtd@lists.infradead.org; Thu, 28 Dec 2006 04:27:47 -0500
Received: by wx-out-0506.google.com with SMTP id h30so4555722wxd
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Dec 2006 01:27:35 -0800 (PST)
Message-ID: <740e30f50612280127y1ff931a2q5ac27fd67340ff1b@mail.gmail.com>
Date: Thu, 28 Dec 2006 11:27:34 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: "Kyungmin Park" <kyungmin.park@samsung.com>
Subject: onenand_wait and onenane_read
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

onenand_wait does not return an error if there is an ecc failure i.e.

ecc & ONENAND_ECC_2BIT_ALL

but onenand_read still marks the bufferRAM as valid i.e.

ret = this->wait(mtd, FL_READING);
/* First copy data and check return value for ECC handling */
onenand_update_bufferram(mtd, from, !ret);

This looks wrong to me.  I think onenand_wait should return an error
if there is an ecc failure.

Can you comment on this?

Regards
Adrian
