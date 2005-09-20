Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHgVM-0004QH-NA
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 07:41:58 -0400
Message-ID: <432FF557.4010701@yandex.ru>
Date: Tue, 20 Sep 2005 15:41:11 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: srinath.satyanarayana@wipro.com
References: <30A4A576EB47C64AB2694E1F17DBE117026DA4CE@blr-itp-msg.wipro.com>
In-Reply-To: <30A4A576EB47C64AB2694E1F17DBE117026DA4CE@blr-itp-msg.wipro.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on Samsung NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

srinath.satyanarayana@wipro.com wrote:
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f1c:
> 0x05d1 in
> stead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f20:
> 0x1000 in
> stead
> Further such events for this erase block will not be printed
> 
> Is steps followed  are corrent? Any suggestion is appreciated.

Please, try:

1. The last MTD from CVS.
2. Try it with both EBS enabled or disabled.
3. Try to mount free partition, create files there and remount. Does it 
work well?

> Confidentiality Notice
> 
> The information contained in this electronic message and any attachments to this message are intended
> for the exclusive use of the addressee(s) and may contain confidential or privileged information. If
> you are not the intended recipient, please notify the sender at Wipro or Mailadmin@wipro.com immediately
> and destroy all copies of this message and any attachments.
It's bad style to send messages with disclaimers like this to public 
mailing lists.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
