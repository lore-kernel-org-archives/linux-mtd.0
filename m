Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R2hOT-0004wf-Hj
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 10:36:10 +0000
Message-ID: <4E6C8F09.4060806@free-electrons.com>
Date: Sun, 11 Sep 2011 12:35:53 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>		
	<1315280704.19067.14.camel@sauron>
	<1315282208.19067.24.camel@sauron>		
	<201109081726.00769.arnd@arndb.de>
	<1315569206.7905.41.camel@sauron>	
	<4E6A25B1.8070400@free-electrons.com>
	<1315736297.18731.1.camel@sauron>
In-Reply-To: <1315736297.18731.1.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-embedded <linux-embedded@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/09/2011 12:18, Artem Bityutskiy wrote:
> On Fri, 2011-09-09 at 16:41 +0200, David Wagner wrote:
>>> 1. Stick with the own cdev approach - the driver becomes very simple
>>>     in this case - we review it.
>>
>> This is the way it's implemented in v4, right ?
>
> Yes, but I though I sent you some feed back with minor things as well as
> with major issue related to race condigions: you should keep the UBI
> volume open as long as your block device is referenced, to prevent the
> UBI volume from being removed.
>

Ah, yes, of course.  I made these changes and will send them monday.

Regards,
David.
