Received: from wx-out-0506.google.com ([66.249.82.237])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H3pEP-0004Bi-Rg
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 02:47:48 -0500
Received: by wx-out-0506.google.com with SMTP id h30so7935706wxd
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Jan 2007 23:47:38 -0800 (PST)
Message-ID: <740e30f50701072347h4c2969e0kffa5bb46ed46603@mail.gmail.com>
Date: Mon, 8 Jan 2007 09:47:38 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: read-while-load (known problem)
In-Reply-To: <7302633.455711168227442976.JavaMail.weblogic@ep_ml21>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <7302633.455711168227442976.JavaMail.weblogic@ep_ml21>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/8/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> Hi,
>
> FYI: read-while-load known problem in DDP.
>
> Of course it's rare case in MTD. and please don't program like this in upper layer.
>
> If you are using OneNAND DDP (Dual Densidy Package) and you want to read data between chip boundary. you maybe failed to read.
>
> For example, 2Gbit OneNAND DDP has following address
>
> Chip 0: 0x0000 0000 ~ 0x0800 0000 - 1
> Chip 1: 0x0800 0000 ~ 0x1000 0000 - 1
>
> If you want to read from 0x07ff f800 to 0x8000 0800 (4KB). it will be failed since each chip has its own bufferram
> So it don't support read-while-loading between each chip.
>
> [Chip 0] onenand_update_bufferram: 1 addr 0x7ffe000, valid = 1
> [Chip 0] onenand_update_bufferram: 0 addr 0x7ffe800, valid = 1
> [Chip 0] onenand_update_bufferram: 1 addr 0x7fff000, valid = 1
> [Chip 0] onenand_update_bufferram: 0 addr 0x7fff800, valid = 1
>   -> Send next page read, but next page is in chip 1
> [Chip 1] onenand_update_bufferram: 1 addr 0x8000000, valid = 1 => Actually it's invalid
> [Chip 1] onenand_update_bufferram: 0 addr 0x8000800, valid = 1
> [Chip 1] onenand_update_bufferram: 1 addr 0x8001000, valid = 1
>
> Thank you,
> Kyungmin Park

I think I see what you mean.  It occurs to me that maybe
onenand_check_bufferram has the same problem i.e. a different chip is
selected to the one that we want to read from.  Do you think there
could be a problem with onenand_check_bufferram also?
