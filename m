Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJopI-000100-5H
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 03:54:37 -0400
Message-ID: <4174C8EF.50604@inf.u-szeged.hu>
Date: Tue, 19 Oct 2004 09:57:35 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru>
In-Reply-To: <4173B404.6040100@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

>> I was not successful. I write JFFS2 to full (there was no left space),
>> than I tried to mkdir, but there was no slab cache corruption.
> 
> Did you see system message "No space left on device"?
> 
> How did you see that slab is OK? I've found this when I've enabled the 
> correspondent option in "Linux Hacking" (no sure, possibly 
> CONFIG_DEBUG_SLAB).

Yes, I've got the message "No space left on device", and I've 
CONFIG_DEBUG_SLAB enabled.

I didn't got slab cache error because it has already returned with "no 
left space" before this place. But, I think you are right, and I 
commited your patch.

I hope David will aggree with it.

Bye,
Ferenc
