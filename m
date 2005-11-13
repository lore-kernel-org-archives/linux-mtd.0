Received: from zproxy.gmail.com ([64.233.162.203])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbMWx-0000Ip-7o
	for linux-mtd@lists.infradead.org; Sun, 13 Nov 2005 13:24:47 -0500
Received: by zproxy.gmail.com with SMTP id i11so1130254nzi
	for <linux-mtd@lists.infradead.org>;
	Sun, 13 Nov 2005 10:24:28 -0800 (PST)
Message-ID: <625fc13d0511131024j7a7af5a4xc00f4433d1e7e8af@mail.gmail.com>
Date: Sun, 13 Nov 2005 12:24:28 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
In-Reply-To: <20051112205610.GA20860@mipter.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20051112205610.GA20860@mipter.zuzino.mipt.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Remove include/linux/mtd/compatmac.h
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/05, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> From: Alexey Dobriyan <adobriyan@gmail.com>
>
> File is effectively empty.

I would prefer not to do this.  The file is effectively empty in
Linus' tree, but it's quite full of stuff in MTD CVS.  It's not really
hurting anything being there and makes the merge from MTD CVS easier.

josh
