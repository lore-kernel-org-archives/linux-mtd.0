Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7Gcr-0006W0-9e
	for linux-mtd@lists.infradead.org; Sun, 30 Jul 2006 15:07:00 -0400
Received: by ug-out-1314.google.com with SMTP id u40so447509ugc
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jul 2006 12:06:55 -0700 (PDT)
Message-ID: <625fc13d0607301206h51694fe1n574efe1c61103b54@mail.gmail.com>
Date: Sun, 30 Jul 2006 14:06:55 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Adrian Bunk" <bunk@stusta.de>
Subject: Re: RFC: remove include/mtd/jffs2-user.h
In-Reply-To: <20060723190239.GB25367@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20060723190239.GB25367@stusta.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/23/06, Adrian Bunk <bunk@stusta.de> wrote:
> include/mtd/jffs2-user.h is not used in the kernel, and depends on
> user space providing a variable target_endian.
>
> I don't see it providing an interface between the kernel and user space.
>
> It seems this header should be part of the user space MTD tools instead
> of headers provided by the kernel?

The mtd-utils already has a copy of this file.  I don't see a reason
for it to stay in kernel.

josh
