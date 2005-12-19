Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EoJi2-0002SQ-3f
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2005 07:01:50 -0500
Message-ID: <43A6A105.9020407@yandex.ru>
Date: Mon, 19 Dec 2005 15:01:09 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "zhao, forrest" <forrest.zhao@intel.com>
References: <439C33D2.506@yandex.ru>	<1134367675.3152.9.camel@localhost.localdomain>	<439D5159.4030704@yandex.ru>
	<1134455209.7346.12.camel@localhost.localdomain>
In-Reply-To: <1134455209.7346.12.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: EBH question 1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao, forrest wrote:
> Hi, Artem
> 
> The following is what I do in my lab:
> 1 download MTD snapshot of 2005/10/30(the
> snapshot before I check in EBH patch)
Thanks, I know that it worked before EBH. Could you please take the 
*lates* CVS stanpshot. Try this on nandsim.

> 2 ./patchkernel.sh -c -2 /usr/src/linux.2.6.12.2
> 3 make; make modules_install
> 4 modprobe mtdram
> 5 cd util/; make
> 6 ./flash_eraseall -j /dev/mtd0
> Then kernel panic happened, seemed there's a bug
> in mtd_char code.
I've fixed this revently.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
