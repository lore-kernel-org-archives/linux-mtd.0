Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G2X85-0008SL-NB
	for linux-mtd@lists.infradead.org; Mon, 17 Jul 2006 13:43:42 -0400
Received: by ug-out-1314.google.com with SMTP id u40so64305ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jul 2006 10:43:33 -0700 (PDT)
Message-ID: <625fc13d0607171043i79bad731mc9bfab4893147180@mail.gmail.com>
Date: Mon, 17 Jul 2006 12:43:33 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Raj Kumar Yadav" <ryadav@neomagic.com>
Subject: Re: nandwrite problem
In-Reply-To: <004e01c6a9c2$b330d7b0$491fa8c0@pcryadav>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0607170804i745f2566k8173ba5d85cad662@mail.gmail.com>
	<004e01c6a9c2$b330d7b0$491fa8c0@pcryadav>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/17/06, Raj Kumar Yadav <ryadav@neomagic.com> wrote:
> Also for mtdblock/5 the character node will be mtd10  "mknod /dev/mtd10 c 90
> 10".
>
> With mtd character interface every partition is accessed through pair of two
> char device node.
> First with  read-write permission. Second with read-only permission.

Quite right.  I had forgotten that particular horrible detail.  Thanks
for correcting me.

josh
