Received: from www.wytron.com.tw ([211.75.82.101])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PYXvb-0002Ds-BB
	for linux-mtd@lists.infradead.org; Fri, 31 Dec 2010 05:53:28 +0000
Message-ID: <4D1D7027.3070503@wytron.com.tw>
Date: Fri, 31 Dec 2010 13:54:47 +0800
From: Thomas Chou <thomas@wytron.com.tw>
MIME-Version: 1.0
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] mkfs.jffs2: fix devtable count as mkfs.ubifs does
References: <4D1C3565.1030800@wytron.com.tw>
	<1293765366-27147-1-git-send-email-thomas@wytron.com.tw>
	<AANLkTinuOGP7=97UOq5eRe+FxNq3zwKnQQUdCaLT_OqC@mail.gmail.com>
In-Reply-To: <AANLkTinuOGP7=97UOq5eRe+FxNq3zwKnQQUdCaLT_OqC@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/31/2010 01:08 PM, Mike Frysinger wrote:
> On Thu, Dec 30, 2010 at 22:16, Thomas Chou wrote:
>> The counting was incorrect. Follow that of mkfs.ubifs.
>
> hmm, sounds like we should rip the stuff out of both and put into
> lib/devtable.c.  feel up to the challenge ?
> -mike
>
Sound great. But I am lost in the maze of kernel v2.6.37-rc and not 
ready to come up with this right now.

- Thomas
