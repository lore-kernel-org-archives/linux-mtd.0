Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpqjJ-0002nJ-Pd
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2005 12:29:25 -0500
Message-ID: <43AC3411.6050604@mvista.com>
Date: Fri, 23 Dec 2005 09:29:53 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: =?UTF-8?B?5ZSQ6ZW36bS7?= <changhung@mail.im.tku.edu.tw>
References: <8b6915c1bd80465b68edd5092af49f52@59.120.32.217>
In-Reply-To: <8b6915c1bd80465b68edd5092af49f52@59.120.32.217>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: where is platform_device.h header file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

唐長鴻 wrote:
> Hi, all.
> I'm a newbie on mtd. When I patched the newest snapshot in
> linux kernel 2.6.14.2 and "make" it, I received kernel complaint,
> "platform_device.h: No such file."
> I re-searched in linux-mtd archives and google, but there was no
> resolution. I wondered that it was maybe a populate problem and
> resolved.
> 
> Could anyone help me to find that file?

This has been changing in mainline, can probably check the CVS logs and 
find a version of the files of interest prior to converting to 
platform_device.h.

-- 
Todd
