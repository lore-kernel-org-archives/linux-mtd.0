Received: from [81.2.110.250] (helo=the-village.bc.nu)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFUkR-0002fR-FJ
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 08:53:21 -0400
Date: Mon, 30 Jul 2007 13:57:23 +0100
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "Sriram, Kannan" <ksriram@ti.com>
Subject: Re: Testing of CPRM on SD Card
Message-ID: <20070730135723.4e5338b4@the-village.bc.nu>
In-Reply-To: <0A50DBE80DD6674E94F7269DC964A7B6440EDA@dbde01.ent.ti.com>
References: <e1d5030b0707280108v236cc522m454c58e1044f1996@mail.gmail.com>
	<0A50DBE80DD6674E94F7269DC964A7B6440EDA@dbde01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Midhun A <midhunagni@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Jul 2007 11:20:58 +0530
"Sriram, Kannan" <ksriram@ti.com> wrote:

> 
> Midhun,
> 
>  There is no open-source implementation of CPRM (SD-Audio/ SD-Bind
> standards). So first of all, you need to license keys from 4C (device
> keys, media keys etc) and do your own implementation.

Also remember that if you do your own implementation in the kernel you
will be required to publish the source code under the GPL and that will
not be permitted with the CPRM licensing. Thus you will need to do all
the work in user space.
