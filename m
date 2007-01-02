Received: from wx-out-0506.google.com ([66.249.82.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H1eeM-0007Bv-P0
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 03:05:37 -0500
Received: by wx-out-0506.google.com with SMTP id h30so6004001wxd
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jan 2007 00:05:33 -0800 (PST)
Message-ID: <740e30f50701020005k1cd5f5c0x848d78b193ecfeb2@mail.gmail.com>
Date: Tue, 2 Jan 2007 10:05:33 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: kyungmin.park@samsung.com
Subject: Re: onenand_wait and onenane_read
In-Reply-To: <31382027.865581167361152877.JavaMail.weblogic@ep_ml28>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <31382027.865581167361152877.JavaMail.weblogic@ep_ml28>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for looking at this.

Note that after the patch, onenane_wait seems to return non-zero even
when the error is corrected by ecc.  Shouldn't it return zero in that
case?
