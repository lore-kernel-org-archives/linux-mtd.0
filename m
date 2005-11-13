Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbMCy-0008Ln-0h
	for linux-mtd@lists.infradead.org; Sun, 13 Nov 2005 13:04:09 -0500
Message-ID: <4377803B.9050403@mvista.com>
Date: Sun, 13 Nov 2005 10:04:43 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <20051112182155.GE28987@flint.arm.linux.org.uk>
	<437646F5.6080803@mvista.com> <43771EFF.4090407@yandex.ru>
In-Reply-To: <43771EFF.4090407@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: fyi: jornada720 build failure in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
>> Fixed in linux-mtd CVS.  Avoid with CONFIG_JFFS2_FS_DEBUG=0 in the 
>> meantime.
>>
>> Thomas, please consider for sending upstream, or give me the word and 
>> I'll mail it to Andrew, thanks,
>>
> I would just remove that D2() printkeys instead of fixing them.

That was my first thought as well, but didn't want to remove debugging 
info somebody found useful, so figured I'd fix it to quickly get 
kernel.org back in shape.  If it's not that useful then let's kill it.

-- 
Todd
