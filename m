Received: from nf-out-0910.google.com ([64.233.182.187])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMlkU-0007Oo-Gf
	for linux-mtd@lists.infradead.org; Mon, 11 Sep 2006 14:22:57 +0100
Received: by nf-out-0910.google.com with SMTP id l37so1325058nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Sep 2006 06:21:47 -0700 (PDT)
Message-ID: <625fc13d0609110621p7df16005ua223628f961ad9ab@mail.gmail.com>
Date: Mon, 11 Sep 2006 08:21:35 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@yandex.ru
Subject: Re: State of UBI
In-Reply-To: <45052A2E.000002.26611@webmail9.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<1157962298.2977.193.camel@pmac.infradead.org>
	<45052A2E.000002.26611@webmail9.yandex.ru>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/11/06, dedekind <dedekind@yandex.ru> wrote:
> >"A handful of bytes" ought to fit into the spare area, and not take real
> >data pages at all.
>
> It was actually a design decision not to use OOB area and make UBI
> flash-independent. OBB area size varies, tends to be ECC-only in
> new NANDs, not large enough for UBI VID header.

Yes, what Artem said.  It's more than a handful of bytes.  The EC
header and VID headers are both 64 bytes.

josh
