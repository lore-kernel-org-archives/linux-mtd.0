Received: from webmail9.mail.yandex.net ([213.180.223.100])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMi11-00026S-0m
	for linux-mtd@lists.infradead.org; Mon, 11 Sep 2006 10:23:43 +0100
Date: Mon, 11 Sep 2006 13:19:42 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <45052A2E.000002.26611@webmail9.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: dwmw2@infradead.org
Subject: Re: State of UBI
In-Reply-To: <1157962298.2977.193.camel@pmac.infradead.org>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<1157962298.2977.193.camel@pmac.infradead.org>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>"A handful of bytes" ought to fit into the spare area, and not take real
>data pages at all.

It was actually a design decision not to use OOB area and make UBI
flash-independent. OBB area size varies, tends to be ECC-only in
new NANDs, not large enough for UBI VID header.

Artem.
