Received: from rn-out-0910.google.com ([64.233.170.186]
	helo=rn-out-0102.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J501i-0006kA-VY
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:36:09 +0000
Received: by rn-out-0102.google.com with SMTP id e25so541086rng.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Dec 2007 06:36:02 -0800 (PST)
Message-ID: <79ac09b60712190636o88be444ydf873c9ea5f39dca@mail.gmail.com>
Date: Wed, 19 Dec 2007 08:36:01 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on SPI Flash
In-Reply-To: <79ac09b60712181315y3c913d56o14a8f41efd677fdf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60712181315y3c913d56o14a8f41efd677fdf@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can anyone offer any thoughts?

On 12/18/07, Duke <ezbonites@gmail.com> wrote:
> Hi,
> If I choose to have a JFFS2 fs on SPI flash device, what is the
> minimum size required?
> For example a 16Mbit ST chip has a sector size of 512K bit while the
> Atmel 16Mbit (AT45DB..) has a sector size of 128Kbytes.  Is there a
> rule of tumb to apply for making th choice?
>
